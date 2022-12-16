# Logbook: Writing Programs For Pipelined CPU

## Basic Info

* Author: Samuel Wang
* Date: 16 Dec 2022
* Objective: 
  * Add nops for the F1 program and reference program.

## Result

Since our processor follows the diagram in Figure 1, there are 4 pipeline registers inserted into the designs. Note that it would take 4 cycles for an ALU operation to be written back to to the register file; it would take 2 cycles for program counter to be set to the correct jump value. This meant that 3 nops are needed after every ALU operation we immediately need the results for and 1 nop after every branch or jump.

This is implemented exacly as described and commented accordingly. See [f1_pipeline.s](../program/f1/f1_pipeline.s) and [pdf_pipeline.s](../program/ref/pdf_pipeline.s) for the implementation.

The program worked as expected on vBuddy.

## Challenges

**1/ NOPs Were Needed After Jump Or Branch:** It was originally thought that nops were only needed after ALU operations, but it was observed that the processor always executed one additional instruction after branch or jump. A review of the design was conducted and it was noted that 1 nop was needed to avoid this as pc is only set during the execution stage.
