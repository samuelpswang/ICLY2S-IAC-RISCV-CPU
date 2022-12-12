# clean previous files
rm -rf build
rm -f Vrtl.vcd
rm -f program/data.mem
rm -f program/instr.hex
make -f program/f1.mk clean
make -f program/ref.mk clean

# generate .hex file
make -f program/f1.mk hexfile
make -f program/ref.mk reference
cp program/ref/gaussian.mem program/data.mem
cp program/ref/pdf_pipeline.hex program/instr.hex

# verilator
verilator -F debug.cfg --cc --trace source/rtl.sv --exe testbench/rtl/ref_tb.cpp

# make executable
make -s -j -C build/ -f Vrtl.mk Vrtl

# declaration
echo "[debug.sh] Running pipelined reference program with gaussian.mem: "

# run
build/Vrtl