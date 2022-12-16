# Logbook: F1 Program

## Basic Info

* Author: Samuel Wang
* Date: 03 Dec 2022
* Objective: 
  * Create an assembly program that emulates the behavior of the F1 lights as shown in Lab 3.
  * Create alternative versions of the program that uses as less instructions as possible.

## Result

The F1 Program involved 2 parts: 1) generating the pseudo-random sequence with LFSR and 2) flashing the lights.

Part 1 involves simulating the linear feedback shift registers with the register file. Here `t1` to `t4` were used to simulate the registers. A loop to calculate the new digit and shift was run until the final state was reached, for the 4-digit XOR LFSR this is `0b1000`. The generated pseudo-random sequence (total of 14 values), were stored in data memory spaces staring from location `0x1000`. 

This segment was originally implemented as a branch (see [f1_branch.asm](../program/f1/f1_branch.s) file) but later on implemented with a subroutine (see [f1_jump.s](../program/f1/f1_jump.s) file). Another method to implement the seqence was to load it directly with the `addi` instructions, which is what is done in [f1_load.asm](../program/f1/f1_load.s).

Part 2 involved either loading light status (`0b1111`, `0b0111`, `0b0011`, `0b0001`) directly into `a0` or to shift left and add 1. In [f1_jump.s](../program/f1/f1_jump.s) and [f1_branch.s](../program/f1/f1_branch.s), the flashing lights were implemented using the `addi` and `slli` instructions. In [f1_load.s](../program/f1/f1_load.s), only `addi` was used to implement this.

Note that it is possible to implement this program with just 2 instructions: `addi` and `bne`, but this was not done as it would make the program incredibly long and therefore not practical.

All three versions of the program were tested with an [online RISC-V interpreter](https://www.cs.cornell.edu/courses/cs3410/2019sp/riscv/interpreter/) and validated to be correct.[^1]

The programs were then compiled with an [online RISC-V compiler](https://riscvasm.lucasteske.dev/). The resulting files were stored as `program_name.mem` for later use in the [`program/f1`](../program/f1/) directory.

## Challenges

Two challenges were faced while writing the program.

**1/ Hard to Debug By Hand:** Debugging the assembler code by hand is extremely compilcated as it involved tracing through the program by hand. This was overcame with using an online interpreter as it allows you to step & fast-forward through the program as required.

**2/ Setting Memory Start Address:** It was orginally attempted to set the memory address with the `addi` instruction. This did not work as the `imm` operand in `addi` is only 12 bits, while `0x1000` required at least 14 bits (`imm` is sign extended). This was overcame either 3 `addi` instructions or a `addi` and a `slli`.

---

## Appendix A: Instructions Used

**[f1_jump.s](../program/f1/f1_jump.s) -- Count: 9**

* R: `add`, `xor`
* S: `sw`
* I: `addi`, `slli`, `lw`
* B: `bne`
* J: `jal`, `jalr`

**[f1_branch.s](../program/f1/f1_branch.s) -- Count: 7**

* R: `add`, `xor`
* S: `sw`
* I: `addi`, `slli`, `lw`
* B: `bne`

**[f1_load.s](../program/f1/f1_load.s) -- Count: 4**

* S: `sw`
* I: `addi`, `lw`
* B: `bne`

[^1]: Along with byte addressing, this was later assembled with the assembler provided by Professor Cheung.