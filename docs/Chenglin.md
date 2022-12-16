# Personal Statement: Chenglin Sun

## My Cotributions

* For the single cycle processor:
  * Data Memory
* For the pipelined processor:
  * Memory Stage Register
* For the cached processor:
  * Co-authored the data cache
  * Co-authored the cached data memory
  * Testbench for the overall cache design
  * Co-authored prototypes of 2 other versions of cache:
    * A two-way cache design that did not meet the requirements:
      * A way-divider unit that implements LRU policy
      * Data cache
      * A way-merger unit that takes output from the two caches, decides hit, and select data output
      * Top module to link the aforementioned modules together
    * A two-way write-back cache design that has unresolved bugs:
      * A way-divider unit that implements LRU policy
      * Data cache with dirty bits
      * A way-merger unit that takes output from the two caches, decides hit, select data output, and generate write enable for the data memory
      * Top module to link the aforementioned modules together, generate address for data memory, and provide stall signal
* Note: These two prototypes are not included in the final design, but could be found in the push history.

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

