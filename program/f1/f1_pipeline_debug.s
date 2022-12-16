main:   
    addi    s0, zero, 0x1       # s0: set to 1 to avoid using bne
    addi    a0, zero, 0xC3      # special state for when lfsr is running (1100 0011)
    addi    a1, zero, 0x0
    jal     ra, lfsr
    addi    zero, zero, 0x0     # nop: 1x needed after jump or branch
start:  
    addi    s1, zero, 0xFF      # s1: lights final state
    addi    s2, zero, 0x1       # s2: location of random data
    addi    s3, zero, 0x8       # s3: random data final state
    addi    s4, zero, 0x5       # s4: random data value
    addi    s5, zero, 0x0F      # s5: action delay length after each cycle
    slli    s2, s2, 0xC         # (shift to get correct state)
    addi    t1, zero, 0x0       # t1: flash light temp
    addi    t2, zero, 0x0       # t2: action delay counter (flash)
    addi    t3, zero, 0x0       # t3: action delay counter (delay)
    addi    t4, zero, 0x0       # t4: random data counter
    addi    a0, zero, 0x1       # a0: set initial lights state
flash:                          # flash loop
    addi    t2, t2, 0x1         # delay starts
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    bne     t2, s5, flash
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0     # nop: 1x needed after jump or branch
    addi    t2, zero, 0x0       # delay ends
    slli    t1, a0, 0x1         # shift by 1 digit to t1
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    addi    a0, t1, 0x1         # add 1 and t1 to a0
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    bne     a0, s1, flash
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    lw      s4, 0(s2)           # load random delay data
wait:                           # wait loop
    addi    t3, t3, 0x1         # delay loop
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    bne     t3, s5, wait
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    addi    t3, zero, 0x0       # delay ends
    addi    t4, t4, 0x1
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    bne     t4, s4, wait
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    addi    t4, zero, 0x0
    addi    a0, zero, 0x0       # dim lights
    addi    s2, s2, 0x4         # increment random data location by 4
    bne     s4, s3, flash 
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0      # keep on repeating process
    addi    zero, zero, 0x0     # nop: 1x needed after jump or branch
    bne     zero, s0, end
    addi    zero, zero, 0x0     # nop: 1x needed after jump or branch
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0

lfsr:
    addi    s1, zero, 0x1
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0      
    slli    s1, s1, 0xC         # s1: starting data memory location
    addi    s2, zero, 0x8       # s2: end result
    addi    t1, zero, 0x1       # set up registers
    addi    t2, zero, 0x0
    addi    t3, zero, 0x0
    addi    t4, zero, 0x0
nloop:                          # next loop
    addi    s9, s9, 0x1
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    addi    a1, t1, 0x0         # shift and add to get numbers
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    slli    t5, t2, 0x1
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    add     a1, a1, t5
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    slli    t5, t3, 0x2
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    add     a1, a1, t5
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    slli    t5, t4, 0x3
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    add     a1, a1, t5
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    xor     t6, t3, t4          # xor set up next state
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    add     t4, t3, zero
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    add     t3, t2, zero
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    add     t2, t1, zero
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    add     t1, t6, zero
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    sw      a1, 0(s1)           # store and next
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    addi    s1, s1, 0x4
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    bne     a1, s2, nloop
    addi    zero, zero, 0x0     # nop: 3x needed for immediately used register counter
    addi    zero, zero, 0x0
    addi    zero, zero, 0x0
    jalr    ra, ra, 0x0
    addi    zero, zero, 0x0     # nop: 1x needed after jump or branch

end:
    addi    a0, zero, 0x3C      # special state for when program ended (0011 1100)