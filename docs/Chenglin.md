# Personal Statement: Chenglin Sun

## My Cotributions

* For the single cycle processor:
  * Data Memory
  * Testbench for PC Register
* For the pipelined processor:
  * Memory Stage Register
* For the cached processor:
  * Co-authored the data cache
  * Co-authored testbench for data cache
  * Co-authored the cached data memory
  * Co-authored top module for one-way cache
  * Testbench for the overall cache design
  * Co-authored prototypes of 2 other versions of cache:
    * A two-way cache design that did not meet the requirements:
      * A way-divider unit that implements LRU policy
      * Data cache
      * A way-merger unit that takes output from the two caches, decides hit, and select data output
      * Top module to link the aforementioned modules together
    * A two-way write-back cache design based on the first prototype that has unresolved bugs:
      * A way-divider unit that implements LRU policy
      * Data cache with dirty bits
      * A way-merger unit that takes output from the two caches, decides hit, select data output, and generate write enable for the data memory
      * Top module to link the aforementioned modules together, generate address for data memory, and provide stall signal
* Note 1: These two prototypes are not included in the final design, but could be found in the push history.
* Note 2: Links to the commits are included in the appendix.

## Special Design Decisions

* Instead of making the data cache into one component, a three-part design was devised. A way-divider unit implements LRU policy and generates U signal, so each cache know whether it's their turn.
Two caches are in the middle, and their outputs are fed into the way-merger unit, which calculates hit signal, data memory write enable, and data to be fed into the data memory.
* This makes debugging easier, also makes it easier to divide up the work.

## Mistakes Made

* There have been many mistakes both on the techinical side and the strategical side.
* The major techinical mistake is that while we build our first cache, we were unclear of what a real-world cache desgin would look like. So our first design does not cache write. All the external write operations only write to the data memory, instead of the data cache. The data cache is written to only when there's a miss and we need to fetch data from the data memory.
* On the technical side, there were also a lot of mistakes and misunderstanding about the criteria of generating certain signals. For example, data memory write enable. It took us lots of brainstorming to make it straight.
* On the strategical side, we falsely assumed the difficulty in making a complicated cache work at the first attempt. We were ambitious and started with the hardest design that we could think of, which we completed, but did not manage to fully debug before deadline. We had to compromise and settle with a simpler design. A lot of time and effort did not go towards the final design.

## Learnings

* Design of a data memory
* How pipelining works
* By designing and implementing a data cache I have learnt about the structure of a data cache, how it works and how internal signals are generated.
* Better skills at writing system verilog
* Better skills at writing testbenches
* Better skills at debugging using vcd wave
* Increased familiarity with github
* More experience of working as a team
* It's good to have ambition, but starting low and gradually working up towards the goal is a better idea. 

## If I had more time

* I might be able to finish a two-way design for the write-through cache.
* I might find a way to debug the two-way write-back version and complete it as well.

## Appendix: Commit Links

* Single Cycle
  * Data Memory
    * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/9896ecb3d36d76159f1893e702b25660d1417057>
    * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/50e3c8b9be9caecd990b2d9145b3a6c0ecbb4eda>
  * Testbench for PC Register
    * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/049e9e56f8fceca908231603338e318e146c89e2>
* Pipelined Processor
  * Memory Stage Register
    * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/4bb4783b79b80f9c4bf6f9237d448ee8a1e6f5cd>
* Cached Processor
  * Data Cache
    * Note: Commit is made by Qidong, but I and Qidong worked on the same file off of github for more freedom in debugging. We did not know we could add co-author in the commit, so we agreed that I will remove old components and Qidong will add new. My commit that removes old design is <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/b5347c44999794179a4fcb0299bb8b0d6f07e22d> and <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/6f7a4f4a9b758af9ab4c1da984c540bff5827694>.
    * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/855dff04aec97ee408b6aad3ab8ec91fc4365cf1>
  * Testbench for data cache
    * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/50691eef746f1345d12ca797d07c05d8aa4c080f>
  * Cached Data Memory
    * Note: Commit is made by Qidong, but I and Qidong worked on the same file off of github for more freedom in debugging. We did not know we could add co-author in the commit, so we agreed that I will remove old components and Qidong will add new. My commit that removes old design is linked above.
    * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/4d45c8e3d5273397b67114887bc059502c35a5a6>
  * One-Way Cache Top
    * Note: Commit is made by Qidong, but I and Qidong worked on the same file off of github for more freedom in debugging. We did not know we could add co-author in the commit, so we agreed that I will remove old components and Qidong will add new. My commit that removes old design is linked above.
    * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/4a5ba40d1d6ee82f932b8d5a1c6faf1d3d4a67e9>
  * Testbench For Cache Top Design
    * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/194f5953b6c866a27c1e4a624f519bf63eb71cd5>
  * Two-Way Prototypes
    * Data Cache
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/213444ed35b93979f781a27d529183d6dc9b9e25>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/976987bd6600e33a8d854efa2f9bec333d035a1d>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/b845b4c49815b13e89f06f7739d5597ed8338223>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/b07165dedf318db864a8630f79ce132b12f7f2d6>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/f3a8abe0b7c27741c138b7b023a6d793ae32ed66>
    * Way Divider
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/68313ad9b1653109afbfb783271a2e21338b4256>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/d13c11e8cfcfbf786510b8c09a337626a997cd5c>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/cbdc56b409f0707ad166ffb85d4ccea0eaba8cb9>
    * Way Merger
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/1d77981a04248eebd61381b89418f3473c8dd277>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/296aec744f09ab33340a36ef6bebe421478d1de6>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/8e387e7fe2736b8c86f39ce294d937aea9b26425>
    * Data Memory Cached
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/bc16f6eca73934ee6fa1b94497da5922e56de028>
    * Top Module For Cache
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/86b8021c9c9a81caaf7e4e42435b1856ee70ee0c>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/fa20efb20de67b61d970b4df954787217c758287>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/2cb537db3e9ea2178e0ce16ab51f2eaff3b0f9dc>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/44356eb7050cb1556bdb76e577e22bcdeef0adfb>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/4678ac80ab73292415b549045049234887636acc>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/187a57f8f349d443cabad89207d189a61551b3c9>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/83df1ba3be10b4d0b6a5d0e5bf85026076c2cbc7>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/01e8539f86b0c5d89719f537429cbf27fdf11a3a>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/a83ea3ed3949fd35f635c13c8cfa8bcc20f6009b>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/06188618b43b87368e71d1cbb064684fb7febd86>
      * <https://github.com/EIE2-IAC-Labs/iac-riscv-cw-24/commit/8a64d80cfc7479decd74ccd702b56d3bc11d221c>
