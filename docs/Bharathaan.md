# Personal Statement: Bharathaan Sukumaran

## Contributions

Note that only the final versions/commits are included for module designs

1. Single Cycle
    * [ALU](../source/alu/alu.sv)
    * [Register File](../source/alu/reg_file.sv)
    * [Control Unit ( **Only** JAL, JALR and LUI Instructions)](../source/ctrl/control_unit.sv)
    * [Sign Extension (**Only** JAL, JALR and LUI Instructions)](../source/ctrl/extend.sv)
    * [Top Level File](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/866237f48437f9d5e60253d1a571c05a5027b07b)
    * Debugging single-cycle (various commits)

2. Pipelined
    * [Memory Stage Register](../source/alu/memory_stage_register.sv)
    * [Top-Level File](../source/rtl.sv)
    * Debugging pipelined CPU (various commits)

3. Cached
    * [Top-Level File](../source/rtl.sv)
    * [Debugging Cached CPU](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/239bd4911fe1a6736acc0cae19168a24ff86dc91)


## What I learned
### Technical Skills

1. Hardware Design using SystemVerilog
    * Learned how to design complex modules and chain them together to build a product
    * Learned how to design and build a processor that conforms to RISC-V Instruction Set Architecture
    * Learned how pipelining makes the average execution of all instructions faster
    * Learned how a cache reduces memory access time in a processor

2. Git, GNU make functions and Bash
    * Learned how to use git effectively for source control
    * Learned how bash and GNU make functions can be used in makefiles to streamline trivial processes within a project

### Soft Skills
1. Collaboration and Communication
    * Learned to receive and give feedback/suggestions within a team while collaborating to build a product


## Mistakes Made
Overall, I don't think I made any significant mistakes however I do think that I should have tracked my work better. However I did face some challenges while working on my module designs, please do see:

* [ALU Logbook](../docs/Log_Alu.md)
* [Top-Level Logbook](../docs/Log_Top_Level.md)

## Special Design Decisions


The only design decision that I put much thought into was to use the existing Jump and Branch signals within the control unit to create logic for JAL and JALR instructions. For more information on this, please see the [Control Unit Logbook](../docs/Log_Control_Unit.md) and [Top-Level Logbook](../docs/Log_Top_Level.md)


## What would I do if I had more time
1. Assist my teammates to make the two-way associative cache work
2. Log my work better and do better testing
3. Take a go at building shell files/ using github actions for design verification and debugging