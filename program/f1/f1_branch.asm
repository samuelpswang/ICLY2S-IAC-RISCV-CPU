main:   
    addi    s0, zero, 0x1
    addi    a0, zero, 0x7F
    addi    a1, zero, 0x0
    bne     zero, s0, lfsr    
start:  
    addi    a0, zero, 0x1       # a0: lights state
    addi    s1, zero, 0xFF      # s1: lights final state
    addi    s2, zero, 0x1
    slli    s2, s2, 0xC         # s2: random data location
    addi    s3, zero, 0x8       # s3: random data final state
floop:                          # flash loop
    slli    t1, a0, 0x1         # shift by 1 digit
    addi    a0, t1, 0x1         # add 1 to a0
    bne     a0, s1, floop
    lw      s4, 0(s2)           # s4: delay length
    addi    t1, zero, 0x0
wloop:                          # wait loop
    addi    t1, t1, 0x1
    bne     t1, s4, wloop
    addi    a0, zero, 0x0       # dim lights
    addi    s2, s2, 0x4         # increment random data by 4
    bne     s4, s3, floop       # keep on repeating process
    jal     ra, end

lfsr:
    addi    s1, zero, 0x1    
    slli    s1, s1, 0xC         # s1: starting data memory location
    addi    s2, zero, 0x8       # s2: end result
    addi    t1, zero, 0x1       # set up registers
    addi    t2, zero, 0x0
    addi    t3, zero, 0x0
    addi    t4, zero, 0x0
nloop:                          # next loop
    addi    a1, t1, 0x0         # shift and add to get numbers
    slli    t5, t2, 0x1
    add     a1, a1, t5
    slli    t5, t3, 0x2
    add     a1, a1, t5
    slli    t5, t4, 0x3
    add     a1, a1, t5
    xor     t6, t3, t4          # xor set up next state
    add     t4, t3, zero
    add     t3, t2, zero
    add     t2, t1, zero
    add     t1, t6, zero
    sw      a1, 0(s1)           # store and next
    addi    s1, s1, 0x4
    bne     a1, s2, nloop
    bne     zero, s0, start

end:
    addi zero, zero, 0x0        # nop