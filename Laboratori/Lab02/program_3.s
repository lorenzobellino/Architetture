;Bellino Lorenzo 245442

.data
K:  .byte 30
I:  .double 1.1,2.3,4.7,2.9,1.1,2.3,4.7,2.9,1.1,2.3,4.7,2.9
    .double 1.1,2.3,4.7,2.9,1.1,2.3,4.7,2.9,1.1,2.3,4.7,2.9
    .double 1.1,2.3,4.7,2.9,1.1,2.3
W:  .double 2.8,1.2,6.5,7.1,2.8,1.2,6.5,7.1,2.8,1.2,6.5,7.1
    .double 2.8,1.2,6.5,7.1,2.8,1.2,6.5,7.1,2.8,1.2,6.5,7.1
    .double 2.8,1.2,6.5,7.1,2.8,1.2
B:  .double 0xab
Y:  .space 8


.text
main:
    lb r1,K(r0)       ;r1 = K
    daddi r3,r0,8     ;r3 = 8
    dmul r2,r3,r1     ;r2 = r1 * r3 = total number of bytes to read
    and r1, r1, r0    ;r1 = 0
    and r3, r3, r0    ;r3 = 0
    l.d f4,B(r0)      ;f4 = B[0]
    daddi r5,r0,0x7ff ;r5 = 0x7ff
    
loop:
    beq r2,r1,output  ;if(r1 == r2): exit
    l.d f1,W(r1)      ;f1 = W(i)
    l.d f2,I(r1)      ;f2 = I(i)
    mul.d f3,f1,f2    ;f3 = f1*f2
    add.d f5,f3,f4    ;f5 = f3 + f4
    daddui r1,r1,8    ;i = i + 8
    j loop

output:
    mfc1 r4,f5        ;move fpr in to a gpr
    dsra r4,r4,31     ;shift right of 31 bit
    dsra r4,r4,21     ;shift right of 21 bit
                      ;in total we have to shift 52 bit
    andi r4,r4,4095   ;select only the exponent with a bitwise and operation
    bne r4,r5,not_equal ;if the exponent is not equal to 0x7ff branch
    mtc1 r0,f5        ;else store 0 in f3

not_equal:
    s.d f5,Y(r0)      ;Y[i] = f3
    halt
