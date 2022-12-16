#!/bin/sh

# script vars
ID=`tput sgr0``tput bold``tput setab 7``tput setaf 0`
COMD=`tput sgr0``tput bold`
SUCC=`tput sgr0``tput bold``tput setaf 2`
FAIL=`tput sgr0``tput bold``tput setaf 1`
RSET=`tput sgr0`

# user vars
OBJ_DIR=build
if [[ "$1" == "ref" ]]; then
  if [[ "$2" == "gaussian" ]]; then
    DUT=source/rtl.sv
    TB=testbench/rtl/ref_tb.cpp
    INSTR=program/ref/pdf.hex
    DATA=program/ref/gaussian.mem
    DUT_NAME=rtl
    echo "${ID}[entrypoint.sh] Running reference program with gaussian data...${RSET}"
  elif [[ "$2" == "noisy" ]]; then
    DUT=source/rtl.sv
    TB=testbench/rtl/ref_tb.cpp
    INSTR=program/ref/pdf.hex
    DATA=program/ref/noisy.mem
    DUT_NAME=rtl
    echo "${ID}[entrypoint.sh] Running reference program with noisy data...${RSET}"
  elif [[ "$2" == "sine" ]]; then
    DUT=source/rtl.sv
    TB=testbench/rtl/ref_tb.cpp
    INSTR=program/ref/pdf.hex
    DATA=program/ref/sine.mem
    DUT_NAME=rtl
    echo "${ID}[entrypoint.sh] Running reference program with sine data...${RSET}"
  elif [[ "$2" == "triangle" ]]; then
    DUT=source/rtl.sv
    TB=testbench/rtl/ref_tb.cpp
    INSTR=program/ref/pdf.hex
    DATA=program/ref/triangle.mem
    DUT_NAME=rtl
    echo "${ID}[entrypoint.sh] Running reference program with triangle data...${RSET}"
  else
    DUT=source/rtl.sv
    TB=testbench/rtl/ref_tb.cpp
    INSTR=program/ref/pdf.hex
    DATA=program/ref/gaussian.mem
    DUT_NAME=rtl
    echo "${ID}[entrypoint.sh] Running reference program with gaussian data...${RSET}"
  fi
elif [[ "$1" == "f1" ]]; then
  if [[ "$2" == "debug" ]]; then
    DUT=source/rtl.sv
    TB=testbench/rtl/f1_tb.cpp
    INSTR=program/f1/f1_jump_debug.s.hex
    DATA=NULL
    DUT_NAME=rtl
    echo "${ID}[entrypoint.sh] Running F1 Program with debug states...${RSET}"
  else
    DUT=source/rtl.sv
    TB=testbench/rtl/f1_tb.cpp
    INSTR=program/f1/f1_jump.s.hex
    DATA=NULL
    DUT_NAME=rtl
    echo "${ID}[entrypoint.sh] Running F1 Program...${RSET}"
  fi
elif [[ "$1" == "comp" ]]; then
  if [[ "$2" == "alu" ]]; then
    DUT=source/alu/alu_top.sv
    TB=testbench/alu/alu_tb.cpp
    INSTR=NULL
    DATA=NULL
    DUT_NAME=alu_top
    echo "${ID}[entrypoint.sh] Running alu top-level testbench...${RSET}"
  elif [[ "$2" == "ctrl" ]]; then
    DUT=source/ctrl/control_top.sv
    TB=testbench/ctrl/control_top_tb.cpp
    INSTR=NULL
    DATA=NULL
    DUT_NAME=control_top
    echo "${ID}[entrypoint.sh] Running control unit top-level testbench...${RSET}"
  elif [[ "$2" == "mem" ]]; then
    DUT=source/mem/data_memory.sv
    TB=testbench/mem/data_memory_tb.cpp
    INSTR=NULL
    DATA=NULL
    DUT_NAME=data_memory
    echo "${ID}[entrypoint.sh] Running data memory testbench...${RSET}"
  elif [[ "$2" == "pc" ]]; then
    DUT=source/pc/pc_reg.sv
    TB=testbench/pc/pc_reg_tb.cpp
    INSTR=NULL
    DATA=NULL
    DUT_NAME=pc_reg
    echo "${ID}[entrypoint.sh] Running program counter register testbench...${RSET}"
  else
    echo "${ID}[entrypoint.sh] Running component testbench requires a component to be specified.${RSET}"
    return
  fi
else
  DUT=source/rtl.sv
  TB=testbench/rtl/ref_tb.cpp
  INSTR=program/ref/pdf.hex
  DATA=program/ref/gaussian.mem
  DUT_NAME=rtl
  echo "${ID}[entrypoint.sh] Unspecified: Running reference program with gaussian data...${RSET}"
fi

# cleanup
echo "${ID}[entrypoint.sh]${COMD} Cleaning previous files...${RSET}"
rm -rf $OBJ_DIR
rm -f V$DUT_NAME.vcd
rm -f program/data.mem
rm -f program/instr.hex
make -f program/f1.mk clean
make -f program/ref.mk clean
if [ $? -eq 0 ]; then echo "${ID}[entrypoint.sh]${SUCC} Cleanup complete.${RSET}";
else echo "${ID}[entrypoint.sh]${FAIL} Cleanup failed.${RSET}"; fi

# make hexfile
echo "${ID}[entrypoint.sh]${COMD} Making *.hex from *.s using program/f1.mk and program/ref.mk...${RSET}"
make -f program/f1.mk hexfile
make -f program/ref.mk reference
if [ $? -eq 0 ]; then echo "${ID}[entrypoint.sh]${SUCC} Make complete.${RSET}";
else echo "${ID}[entrypoint.sh]${FAIL} Make failed.${RSET}"; fi

# copy hexfile
echo "${ID}[entrypoint.sh]${COMD} Copying ${DATA} (data) and ${INSTR} (instruction)...${RSET}"
if [ "$DATA" != "NULL" ]; then 
  cp ${DATA} program/data.mem
else
  touch program/data.mem
fi
if [ "$INSTR" != "NULL" ]; then 
  cp ${INSTR} program/instr.hex
else
  touch program/data.mem
fi
if [ $? -eq 0 ]; then echo "${ID}[entrypoint.sh]${SUCC} Copy complete.${RSET}";
else echo "${ID}[entrypoint.sh]${FAIL} Copy failed.${RSET}"; fi

# verilate system verilog files
echo "${ID}[entrypoint.sh]${COMD} Verilating $DUT using entrypoint.config...${RSET}"
verilator -F entrypoint.cfg --cc --trace ${DUT} --exe ${TB}
if [ $? -eq 0 ]; then echo "${ID}[entrypoint.sh]${SUCC} Verilation complete.${RSET}";
else echo "${ID}[entrypoint.sh]${FAIL} Verilation failed. Check error messages.${RSET}"; fi

# build verilator translation
echo "${ID}[entrypoint.sh]${COMD} Making V$DUT_NAME using V$DUT_NAME.mk...${RSET}"
make -s -j -C $OBJ_DIR/ -f V$DUT_NAME.mk V$DUT_NAME
if [ $? -eq 0 ]; then echo "${ID}[entrypoint.sh]${SUCC} Make complete.${RSET}";
else echo "${ID}[entrypoint.sh]${FAIL} Make failed. Check error messages.${RSET}"; fi

# run
echo "${ID}[entrypoint.sh]${COMD} Executing $OBJ_DIR/V$DUT_NAME...${RSET}"
$OBJ_DIR/V$DUT_NAME
if [ $? -eq 0 ]; then echo "${ID}[entrypoint.sh]${SUCC} Execution succeeded.${RSET}";
else echo "${ID}[entrypoint.sh]${FAIL} Execution failed.${RSET}"; fi