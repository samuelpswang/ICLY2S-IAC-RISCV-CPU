main:   
    addi    s0, zero, 0x1
    addi    a1, zero, 0x0 
    addi    s1, zero, 0x0FF     # s1: lights final state
    addi    s2, zero, 0x05F     # s2: delay set by testbench
    addi    s3, zero, 0x07F     # s3: random delay set by testbench
start:  
    addi    a0, zero, 0x1       # a0: lights state
floop:                          # flash loop
    addi    t2, t2, 0x1
    bne     t2, s2, floop
    addi    t2, zero, 0x0
    slli    t1, a0, 0x1         # shift by 1 digit
    addi    a0, t1, 0x1         # add 1 to a0
    addi    t1, zero, 0x0
    bne     a0, s1, floop
wloop:                          # wait loop
    addi    t3, t3, 0x1
    bne     t3, s3, wloop
    addi    t3, zero, 0x0       
    addi    a0, zero, 0x0       # dim lights
    bne     zero, s0, floop     # keep on repeating process
