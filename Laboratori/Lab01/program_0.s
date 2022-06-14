;Lorenzo Bellino 245442


.data
Vector: .word16 0x2fcd, 0xf234, 0x562f, 0x2f2f, 0xa2fd, 0x122f, 0x5678, 0x1111
        .word16 0x2fcd, 0xf234, 0x562f, 0x2f2f, 0xa2fd, 0x122f, 0x5678, 0x1111
        .word16 0x2fcd, 0xf234, 0x562f, 0x2f2f, 0xa2fd, 0x122f, 0x5678, 0x1111
        .word16 0x2fcd, 0xf234, 0x562f, 0x2f2f, 0xa2fd, 0x122f, 0x5678, 0x1111
        .word16 0x2fcd, 0xf234, 0x562f, 0x2f2f, 0xa2fd, 0x122f, 0x5678, 0x1111
        .word16 0x2fcd, 0xf234, 0x562f, 0x2f2f, 0xa2fd, 0x122f, 0x5678, 0x1111
        .word16 0x2fcd, 0xf234, 0x562f, 0x2f2f, 0xa2fd, 0x122f, 0x5678, 0x1111
        .word16 0x2fcd, 0xf234, 0x562f, 0x2f2f, 0xa2fd, 0x122f, 0x5678, 0x1111
        .word16 0x2fcd, 0xf234, 0x562f, 0x2f2f, 0xa2fd, 0x122f, 0x5678, 0x1111
        .word16 0x2fcd, 0xf234, 0x562f, 0x2f2f, 0xa2fd, 0x122f, 0x5678, 0x1111
        .word16 0x2fcd, 0xf234, 0x562f, 0x2f2f, 0xa2fd, 0x122f, 0x5678, 0x1111
        .word16 0x2fcd, 0xf234, 0x562f, 0x2f2f, 0xa2fd, 0x122f, 0x5678, 0x1111
        .word16 0x2fcd, 0xf234, 0x562f, 0x2f2f ; declaration of the vector
Element: .byte 100

res:	.space 1 ; memory allocation for the Result

.text

main:
    lb r1,Element(r0)     ;load number of element in r1
    daddi r3,r0,2         ;store #2 in r3
    dmul r4,r3,r1         ;r4 = Element*2 for each element of the array we have
                          ;to check the upper and lower byte
    and r1, r1, r0        ;set r1 (counter) to zero
    and r3, r3, r0        ;set r3 (temporary result) to zero
		daddui r2,r0,0x2f     ;store in r2 the value 0x2f

loop:
    beq r4,r1,exit        ;if we checked all the elements exit
    lh r5,Vector(r1)      ;load an element from thearray
    daddi r1,r1,2         ;increment counter
    andi r6,r5,255        ;select only the lower 8 bit
    bne r6,r2,second      ;if r6!=0x2f jump to second
    daddi r3,r3,1         ;else r3=r3+1
second:
    dsra r6,r5,8          ;right shift 8 bit of the value
    andi r6,r6,255        ;select only the lower 8 bit from r6
    bne r6,r2,loop        ;if r6!=0x2f jump back to loop
    daddi r3,r3,1         ;else r3=r3+1

    j loop

exit:
    sb r3,res(r0)        ;store r3 in res
		halt                 ;stop the execution
