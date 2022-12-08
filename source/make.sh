rm -rf obj_dir
rm -f RISC-V.vcd

verilator -F doit.config --cc --trace RISCV.sv pc_reg.sv instruction_memory.sv control_unit.sv reg_file.sv alu.sv data_memory.sv --exe RISCV_tb.cpp

make -j -C obj_dir/ -f VRISCV.mk VRISCV