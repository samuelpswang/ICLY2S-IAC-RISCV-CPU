# cleanup
rm -rf build
rm -f Vrtl.vcd

# generate .hex file
cd program
make hexfile
cd ..

# verilator
verilator -F debug.cfg --cc --trace source/rtl.sv --exe testbench/rtl/rtl_tb.cpp

# make executable
make -s -j -C build/ -f Vrtl.mk Vrtl

# run
build/Vrtl