# Personal Statement: Qidong Zhou

## Contributions 
* For the single cycle processor:
  * PC counter ([pc counter](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/77a75274f23fc8098afea4e8a70a33168bdeb4c0))
  * Instruction memory
  * Testbench for data memory([testbench](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/1f92f55607674bc2f2db5986179629d0ea693cc3))
* For the pipelined processor:
  * Testbench for ALU([testbench](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/cfe539e94bd5f295b2f287ececcc09d6a8a76ac6))
  * Pipelined instruction memory([pip instruction memory](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/926bd774a85a955b717c0b38ce66e8e9eec4789f))
* For the cached processor:
  * Data cache([data cache](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/855dff04aec97ee408b6aad3ab8ec91fc4365cf1))
  * Testbench for data cache([testbench](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/194f5953b6c866a27c1e4a624f519bf63eb71cd5))
  * Cached data memory([data memory](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/4d45c8e3d5273397b67114887bc059502c35a5a6))
  * Co-author of the top-level design for data cache with data memory([cache top](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/4a5ba40d1d6ee82f932b8d5a1c6faf1d3d4a67e9))
  * Co-author of the testbench for data cache with data memory([testbench](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/194f5953b6c866a27c1e4a624f519bf63eb71cd5))
  * Co-author of the 2-way write-back cache (not complete)
    * Way divider which implement LRU ([divider](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/68313ad9b1653109afbfb783271a2e21338b4256))
    * Way merger which combine 2 ways of cache ([merger](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/c6e30179c477256326ea5e0ffecfcf54488804a7))
    * Top level linkage between caches and data memory ([cache top](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/86b8021c9c9a81caaf7e4e42435b1856ee70ee0c))
    * testbench([testbench](https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/e3c18d78593ba812df5a4ba638087e15af9c8fb0))
* Note: we forgot to add co-author in the commit

## Special design decisions
* Design for the 2-way cache that combine both spatial and temporal locality metioned in the lecture. More detailed information can be found in [Data Cache](Log_Data_Cache.md).



## Learnings
* Overall construction of RISC-V cpu
* Instruction of the PC counter
* How the byte addressing works
* How pipelining works
* How cache works
  * LRU policy
  * Relationship between cache and data memory
* Solving cache coherency problem
  * Write-through cache
  * Write-back cache
* Experience of working as a team
* Skills of using GitHub
* Skills of debugging

## Mistakes

### 1. Misunderstanding of the memory map

My initial understanding of the memory map is coding both data memory and the instruction memory. 
### 2. Wrong orders of storing of Cache 

Our first version of the 2-way cache behaves differently when storing words compared with the real-world design. This wrong cache stores data into the data memory and then write back to the data cache, which is opposite in the real design. Although this version indeed works for the F1 program, we discard this version in the end. 

### 3. Forgot stalls inside the cache

Our final design is a 1-way write-through cache. It works correctly by running the testbench for top level of cache, but when it is integrated to the overall top level of cpu, the Vbuddy does not work properly. After debugging, it works out that this mistake is caused by the wrong output of the stall signal. This signal also outputs high when there is no memory instruction. 

## If I have time

### 1. completing design for the two-way cache with dirty bit

My initial expectation is designing a two-way cache with dirty bit which is the fastest and the most potential instruction on handling with misses. We indeed complete the one with this goal, but unfortunately, this version has the wrong order when there is an instruction of storing word. This design will store the data into the data memory in the clk rising edge and then storing back to the data cache in the following clk falling edge. Although this version works correctly in the F1 program, we discard this one because of the fault mentioned above. Later on, we design the cache with dirty bits which have the correct behavior when loading and storing the data into the data memory by running the test bench, but when there is miss and the cache needs to reload the data from the data memory, a delay in input to the cache always happened that causing the cache to store the undesired data which further leads to the wrong output. The debugging process takes time, so we finally choose the cache with write-through.  

