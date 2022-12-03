main:   
    addi    s0, zero, 0x1
    bne     zero, s0, lfsr
start:  
    addi    a0, zero, 0x1       # a0: lights state
    addi    s1, zero, 0xF       # s1: lights final state
    addi    s2, zero, 0x7FF
    addi    s2, s2, 0x7FF
    addi    s2, s2, 0x2         # s2: random data location
    addi    s3, zero, 0x8       # s3: random data final state
flash:
    addi    a0, zero, 0x1
    addi    a0, zero, 0x3
    addi    a0, zero, 0x7
    addi    a0, zero, 0xF
    lw      s4, 0(s2)           # s4: delay length
    addi    t1, zero, 0x0
wloop:                          # wait loop
    addi    t1, t1, 0x1
    bne     t1, s4, wloop
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