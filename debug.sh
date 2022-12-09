# clean previous files
rm -rf build
rm -f Vrtl.vcd
make -C program/ Makefile clean

# make .hex file
make -C program/ Makefile hexfile

# verilator
verilator -F debug.cfg --cc --trace source/rtl.sv --exe testbench/rtl/rtl_tb.cpp

# make executable
make -s -j -C build/ -f Vrtl.mk Vrtl

# run
build/Vrtl