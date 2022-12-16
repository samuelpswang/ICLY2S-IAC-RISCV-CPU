# Team 24: RISC-V CPU (Pipelined with Data Cache)

## Table of Contents

### Processor

* Single Cycle
  * [F1 Program (Samuel)](docs/Log_F1_Program.md)
  * [Program Counter & Instruction Memory (Qidong)](docs/Log_Pc_Im.md)
  * [Control Unit (Samuel, Bharathaan)](docs/Log_Control_Unit.md)
  * [ALU (Bharathaan)](docs/Log_Alu.md)
  * [Data Memory (Chenglin)](docs/Log_Data_Mem.md)
* Pipeline
  * [Programs For Pipelined CPUs (Samuel)](docs/Log_Pipeline_Program.md)
* Data Cache
  * [Data Cache (Chenglin, Qidong)](docs/Log_Data_Cache.md)
* Others
  * [Result Verification (Samuel)](docs/Log_Verify.md)

### Individual Statements

* [Personal Statement: Chenglin](docs/Chenglin.md)
* [Personal Statement: Qidong](docs/Qidong.md)
* [Personal Statement: Bharathaan](docs/Bharathaan.md)
* [Personal Statement: Samuel](docs/Samuel.md)

## Quick Start

`WIP: How to use entrypoint.sh`

## Overview

### Versions (See Release)

* Single Cycle: [`v1.0-single-cycle`](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/releases/tag/v1.0-single-cycle)
* Pipeline: [`v2.0-pipeline`](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/releases/tag/v2.0-pipeline)
* Data Cache (merged to main):

### Evidence Of Working Processor

See the following embedded videos, for the F1 program and the 4 waveforms PDF programs.

| [![Figure 1: F1 Lights](https://img.youtube.com/vi/NuIQRqBnFG8/0.jpg)](https://www.youtube.com/watch?v=NuIQRqBnFG8) |
| :---: |
| Figure 1: F1 Lights |

| [![Figure 2: Reference Program (Gaussian)](https://img.youtube.com/vi/_73PF9DOqbE/0.jpg)](https://www.youtube.com/watch?v=_73PF9DOqbE) |
| :---: |
| Figure 2: Reference Program (Gaussian) |

| [![Figure 3: Reference Program (Noisy)](https://img.youtube.com/vi/Pd9K9bdHOnM/0.jpg)](https://www.youtube.com/watch?v=Pd9K9bdHOnM) |
| :---: |
| Figure 3: Reference Program (Noisy) |

| [![Figure 4: Reference Program (Sine)](https://img.youtube.com/vi/ktAXgXnco60/0.jpg)](https://www.youtube.com/watch?v=ktAXgXnco60) |
| :---: |
| Figure 4: Reference Program (Sine) |

| [![Figure 5: Reference Program (Triangle)](https://img.youtube.com/vi/GJRNKH8N5kc/0.jpg)](https://www.youtube.com/watch?v=GJRNKH8N5kc) |
| :---: |
| Figure 5: Reference Program (Triangle) |

## Contribution Table 

**Note:** o = Main Contributor; v = Co-Author.

Table 1: Contribution List
| Task       | Files | Chenglin | Qidong | Bharathaan | Samuel |
| :--------- | :---- | :------: | :----: | :--------: | :----: |
| **Single Cycle** | ----- | ----- | ----- | ----- | ----- |
| Repo Setup | `.gitignore`, `.gitkeep`, ... | | | | o | 
| Entry Script | `debug.sh`, `entrypoint.sh`, ... | | | v | o |
| F1 Program | `f1_branch.s`, `f1_jump.s`, ... | | | | o |
| Program Counter & Instruction Memory | `pc_reg.sv`, `instruction_memory.sv`, `pc_reg_tb.cpp` | v | o | | |
| Control Unit | `control_unit.sv`, `extend.sv`, `control_top_tb.cpp` | | | v | o |
| ALU | `alu.sv`, `reg_file.sv`, `alu_tb.cpp` | | | o |  |
| Data Memory | `data_memory.sv`, `data_memory_tb.cpp` | o | v | | |
| Top-Level Debugging | `rtl.sv`, `ref_tb.cpp`, `f1_tb.cpp` | | | o | v |
| **Pipeline** | ----- | ----- | ----- | ----- | ----- |
| Pipeline Programs | `f1_pipeline.s`, `f1_pipeline_debug.s`, `pdf_pipeline.s` | | | v | o | 
| Fetch Stage Registers | `instruction_memory_pip.sv` | |o| | | 
| Decode Stage Registers | `decode_register.sv` | | | | o | 
| Execute Stage Registers | `memory_stage_register.sv` | | | o | |
| Memory Stage Registers | `memory_writeback_register.sv` |o| | | 
| Top-Level Debugging | `rtl.sv`, `ref_tb.cpp`, `f1_tb.cpp` | | | o | v |
| **Data Cache** | ----- | ----- | ----- | ----- | ----- |
| Data Cache (1-way) | | o | o | | |
| Data Cache (2-way, incomplete) | | o | o | | |
| Top-Level Debugging | `rtl.sv`, `ref_tb.cpp`, `f1_tb.cpp` | v | v | o | | 

## Specifications

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
| Property                | Value      |
| :---------------------- | :--------- |
| Instruction Memory Size | 2^12 bits  |
| Instruction Width       | 32-bit     |
| Data Memory Size        | 2^17 bits  |
| Data Witdh              | 8-bit      | 
| Data Cache Size         | 128 bytes  |
| Data Cache Sets         | 8          |
| Data Cache Ways         | 1          |
| Data Cache Block Size   | 4 * 32-bit |

For more detailed detailed specifications, see our [Specification Sheet](docs/Specs.md).

## File Structure

...