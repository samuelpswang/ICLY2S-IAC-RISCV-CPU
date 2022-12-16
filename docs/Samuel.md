# Personal Statement: Samuel Wang

## Contributions

Note that only the first commit that contains the majority of the contribution is linked after the item listed below.

* Infrastructure
  * Written overall documentation: README.md and releases. ([d9fcad9](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/d9fcad91085f0f3525649f62ab7182a64270b549))
  * Created repo workflow: file structures, branches, and gitignores. ([42d89f1](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/42d89f1c9ee92c2f03e9740f0fec810aded759c0))
  * Created entry script: debug.sh and entrypoint.sh. ([5162470](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/516247088ea9224b982fd84529b77bec009aee98))
* Single Cycle
  * F1 program. ([44277b5](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/44277b53ac53b2dd3e0c6704910e06567c711ef1))
  * Control unit and sign exntend components. ([3563a6a](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/3563a6a820932df696d60c43c184cd93b3ffc869))
* Pipelined
  * F1 program and reference program pipeline versions. ([b4cb93a](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/b4cb93a7cef3078ac6c063301441267859d38abc))
  * Decode stage pipeline register. ([67dfab7](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/b4cb93a7cef3078ac6c063301441267859d38abc))
  * Overall debugging. (various commits)

## What I Learned

* Hard Skills
  * Processor Design
    * Understand how a processor execute instructions.
    * Understand how to pipeline a processor.
    * Understand how memory hiearchy works.
  * Build Tools
    * Practiced Assembly language programming.
    * Hone familiarithy of SystemVerilog when describing the hardware logic.
    * Learned basic Shell programming when writing entry scripts for designs.
* Soft Skills
  * Team Collaboration
    * How to set up a workflow that makes sense for the team, such as feature branches an others.
    * How to set up file structure and work with tools (e.g. Verilator and Make) to allow compilation in different directories.
  * Personal
    * How to persuade your teammates that something is a good idea.

## Mistakes Made

No significant mistakes were made during the process. For an account of challenges faced during the build process of the modules I am responsible for, see the challenge section in the individual logbook entries as listed below.

* [F1 Program](Log_F1_Program.md)
* [Control Unit & Sign Extension Unit](Log_Control_Unit.md)
* [Writing Programs For Pipelined CPU](Log_Pipeline_Program.md)
* [Results Verification](Log_Verify.md)

## Special Design Decisions

No special design decisions were made for my contributions in the processor. All designs built attempts to follow a previously established set of guidelines for easier debugging and verification. These rule of thumbs can be found below:

1. Good backwards compatiability; i.e. always make sure previous features work when adding new features.
2. Good readability; i.e. naming conventions that make sense, section and comment code where reasonable.
3. Good logic; i.e. make sure all possible cases are handled in a branch.
4. Low redundancy; i.e. do not repeat code when not neccessary.
5. Piecemeal commits; i.e. make small incremental changes in commit to allow quick reversion back to previous working version.

## What I Would Do If I Had More Time

1. Assist and try my hand at building a data cache.
2. Implement all possible instructions.
3. Try to figuire out the logic for a hazard unit.