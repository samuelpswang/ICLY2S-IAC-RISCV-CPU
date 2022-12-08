main:   
    addi    s0, zero, 0x1       # s0: set to 1 to avoid using bne
    addi    a0, zero, 0x55      # special state for when lfsr is running
    addi    a1, zero, 0x0
    bne     zero, s0, lfsr    
start:  
    addi    s1, zero, 0xFF      # s1: lights final state
    addi    s2, zero, 0x1       # s2: location of random data
    slli    s2, s2, 0xC         # (shift to get correct state)
    addi    s3, zero, 0x8       # s3: random data final state
    addi    s4, zero, 0x0       # s4: random data
    addi    s5, zero, 0x5F      # s5: delay added after each cycle
    addi    t1, zero, 0x0       # t1: flash light temp
    addi    t2, zero, 0x0       # t2: flash delay temp
    addi    t3, zero, 0x0       # t3: dim delay temp
    addi    t4, zero, 0x0       # t4: random delay temp
    addi    a0, zero, 0x1       # a0: lights state
flash:                          # flash loop
    addi    t2, t2, 0x1         # delay starts
    bne     t2, s5, flash
    addi    t2, zero, 0x0       # delay ends
    slli    t1, a0, 0x1         # shift by 1 digit to t1
    addi    a0, t1, 0x1         # add 1 and t1 to a0
    bne     a0, s1, flash
    lw      s4, 0(s2)           # load random delay data
wait:                           # wait loop
    addi    t3, t3, 0x1         # delay loop
    bne     t3, s5, wait
    addi    t3, zero, 0x0       # delay ends
    addi    t4, t4, 0x1
    bne     t4, s4, wait
    addi    t4, zero, 0x0
    addi    a0, zero, 0x0       # dim lights
    addi    s2, s2, 0x4         # increment random data by 4
    bne     s4, s3, flash       # keep on repeating process
    bne     zero, s0, end

lfsr:
    addi    s1, zero, 0x7FF
    addi    s1, s1, 0x7FF
    addi    s1, s1, 0x2         # s2: random data location
    addi    a0, zero, 0x1
    sw      a0, 0(s1)
    addi    s1, s1, 0x4
    addi    a0, zero, 0x2
    sw      a0, 0(s1)
    addi    s1, s1, 0x4
    addi    a0, zero, 0x4
    sw      a0, 0(s1)
    addi    s1, s1, 0x4
    addi    a0, zero, 0x9
    sw      a0, 0(s1)
    addi    s1, s1, 0x4
    addi    a0, zero, 0x3
    sw      a0, 0(s1)
    addi    s1, s1, 0x4
    addi    a0, zero, 0x6
    sw      a0, 0(s1)
    addi    s1, s1, 0x4
    addi    a0, zero, 0xD
    sw      a0, 0(s1)
    addi    s1, s1, 0x4
    addi    a0, zero, 0xA
    sw      a0, 0(s1)
    addi    s1, s1, 0x4
    addi    a0, zero, 0x5
    sw      a0, 0(s1)
    addi    s1, s1, 0x4
    addi    a0, zero, 0xB
    sw      a0, 0(s1)
    addi    s1, s1, 0x4
    addi    a0, zero, 0x7
    sw      a0, 0(s1)
    addi    s1, s1, 0x4
    addi    a0, zero, 0xF
    sw      a0, 0(s1)
    addi    s1, s1, 0x4
    addi    a0, zero, 0xE
    sw      a0, 0(s1)
    addi    s1, s1, 0x4
    addi    a0, zero, 0xC
    sw      a0, 0(s1)
    addi    s1, s1, 0x4
    addi    a0, zero, 0x8
    sw      a0, 0(s1)
    bne     s0, zero, start

end:
    addi zero, zero, 0x0        # nop