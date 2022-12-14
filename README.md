# Team 24: RISC-V CPU (Pipelined with Data Cache)

## Table of Contents

* Single Cycle
  * [F1 Program (Samuel)](docs/Log_F1_Program.md)
  * [Program Counter & Instruction Memory ()](docs/Log_Pc_Im.md)
  * [Control Unit (Samuel)](docs/Log_Control_Unit.md)
  * [ALU (Bharathaan)](docs/Log_Alu.md)
  * [Data Memory ()](docs/Log_Data_Mem.md)
  * [Debugging Single Cycle CPU (Bharathaan)](docs/Log_Debug_Sc.md)
* Pipeline
  * [Programs For Pipelined CPUs (Samuel)](docs/Log_Pipeline_Program.md)
  * [Debugging Pipelined CPU (Bharathaan, Samuel)](docs/Log_Debug_Pip.md)
* Data Cache
  * [Data Cache (Chenglin, Qidong)](docs/Log_Data_Cache.md)
  * [Debugging Data Cache CPU (Bharathaan, Chenglin, Qidong)](docs/Log_Debug_Dc.md)
* Others
  * [Result Verification (Samuel)](docs/Log_Verify.md)

## Quick Start

`WIP: How to use entrypoint.sh`

## Overview (Abstract)

`WIP: 1) How to find each version, 2) Results for each stage 3) Verification`

## Contribution Table 

**Note:** o = Main Contributor; v = Co-Author.

Table 1: Contribution List
| Task       | Files | Chenglin | Qidong | Bharathaan | Samuel |
| :--------- | :---- | :------: | :----: | :--------: | :----: |
| **Single Cycle** | ----- | ----- | ----- | ----- | ----- |
| Repo Setup | `.gitignore`, `.gitkeep`, ... | | | | o | 
| Entry Script | `debug.sh`, `entrypoint.sh`, ... | | | v | o |
| F1 Program | `f1_branch.s`, `f1_jump.s`, ... | | | | o |
| Program Counter & Instruction Memory | `pc_reg.sv`, `instruction_memory.sv`, `pc_reg_tb.cpp` | | | | |
| Control Unit | `control_unit.sv`, `extend.sv`, `control_top_tb.cpp` | | | v | o |
| ALU | `alu.sv`, `reg_file.sv`, `alu_tb.cpp` | | | o |  |
| Data Memory | `data_memory.sv`, `data_memory_tb.cpp` | | | | |
| Top-Level Debugging | `rtl.sv`, `ref_tb.cpp`, `f1_tb.cpp` | | | o | v |
| **Pipeline** | ----- | ----- | ----- | ----- | ----- |
| Pipeline Programs | `f1_pipeline.s`, `f1_pipeline_debug.s`, `pdf_pipeline.s` | | | v | o | 
| Fetch Stage Registers | `instruction_memory_pip.sv` | | | | | 
| Decode Stage Registers | `decode_register.sv` | | | | o | 
| Execute Stage Registers | `memory_stage_register.sv` | | | o | |
| Memory Stage Registers | `memory_writeback_register.sv` | | | | 
| Top-Level Debugging | `rtl.sv`, `ref_tb.cpp`, `f1_tb.cpp` | | | o | v |
| **Data Cache** | ----- | ----- | ----- | ----- | ----- |
| Data Cache (1-way) | | | | | |
| Data Cache (2-way, incomplete) | | | | | |
| Top-Level Debugging | `rtl.sv`, `ref_tb.cpp`, `f1_tb.cpp` | v | v | o | | 

## Specifications

`WIP: 1) Implemented instructions, 2) Signals meaning 3) pipeline & data cache`

Table 2: Implemented Instructions
| Type | Instructions                      |
| :--- | :-------------------------------- |
| R    | `add`, `xor`                      |
| B    | `bne`                             |
| I    | `addi`, `slli`, `lb`, `lw`, `lbu` |
| S    | `sb`, `sw`                        |
| U    | `lui`                             |
| J    | `jal`, `jalr`                     |

Table 3: General Specifications
| Property                | Value  |
| :---------------------- | :----- |
| Instruction Memory Size |        |
| Instruction Width       | 32-bit |
| Data Memory Size        |        |
| Data Witdh              | 8-bit  | 
| Data Cache Size         |        |
| Data Cache Sets         |        |
| Data Cache Ways         |        |
| Data Cache Block Size   |        |

For more detailed detailed specifications, see our [Specification Sheet](docs/Specs.md).
