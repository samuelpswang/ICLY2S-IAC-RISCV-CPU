# clean previous files
rm -rf build
rm -f Vrtl.vcd
make -f program/f1.mk clean
make -f program/ref.mk clean

# generate .hex file
make -f program/f1.mk hexfile
make -f program/ref.mk reference


# verilator
verilator -F debug.cfg --cc --trace source/rtl.sv --exe testbench/rtl/rtl_tb.cpp

# make executable
make -s -j -C build/ -f Vrtl.mk Vrtl

# run
build/Vrtl