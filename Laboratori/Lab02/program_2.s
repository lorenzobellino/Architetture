;Bellino Lorenzo 245442

.data
;clock cycle = 1698
;1690
Element:  .byte 40
V1:       .double 1.2,2.3,4.5,3.4,1.2,4.2,5.8,8.7,7.1,6.4
          .double 4.2,5.8,8.7,7.1,6.4,4.2,5.8,8.7,7.1,6.4
          .double 1.2,2.3,4.5,3.4,1.2,4.2,5.8,8.7,7.1,6.4
          .double 4.2,5.8,8.7,7.1,6.4,4.2,5.8,8.7,7.1,6.4


V2:       .double 3.4,1.1,5.2,7.1,8.1,3.4,1.1,5.2,7.1,8.1
          .double 3.4,1.1,5.2,7.1,8.1,3.4,1.1,5.2,7.1,8.1
          .double 3.4,1.1,5.2,7.1,8.1,3.4,1.1,5.2,7.1,8.1
          .double 3.4,1.1,5.2,7.1,8.1,3.4,1.1,5.2,7.1,8.1

V3:       .double 7.2,5.5,1.4,8.2,9.0,7.2,5.5,1.4,8.2,9.0
          .double 7.2,5.5,1.4,8.2,9.0,7.2,5.5,1.4,8.2,9.0
          .double 7.2,5.5,1.4,8.2,9.0,7.2,5.5,1.4,8.2,9.0
          .double 7.2,5.5,1.4,8.2,9.0,7.2,5.5,1.4,8.2,9.0

V4:       .double 4.2,5.8,8.7,7.1,6.4,4.2,5.8,8.7,7.1,6.4
          .double 4.2,5.8,8.7,7.1,6.4,4.2,5.8,8.7,7.1,6.4
          .double 4.2,5.8,8.7,7.1,6.4,4.2,5.8,8.7,7.1,6.4
          .double 4.2,5.8,8.7,7.1,6.4,4.2,5.8,8.7,7.1,6.4
V5:       .space 320
V6:       .space 320
V7:       .space 320



.text
main:
    lb r1,Element(r0) ;load in r1 the number of elements in the array
    daddi r3,r0,8     ;store 8 in r3
    dmul r2,r3,r1     ;multiply the number of elements times 8 =
                      ;total number of bytes to read
    and r1, r1, r0    ;set r1 = 0
    and r3, r3, r0    ;set r3 = 0

loop:
    beq r2,r1,exit    ;if r2 == r1 : exit
    l.d f2,V2(r1)     ;f2 = V2[r1]
    l.d f3,V3(r1)     ;f3 = V3[r1]
    l.d f1,V1(r1)     ;f1 = V1[r1]
    l.d f4,V4(r1)     ;f4 = V4[r1]
    mul.d f10,f2,f3   ;f10 = f2*f3
    add.d f5,f10,f4   ;f5 = f10+f4
    s.d f5,V5(r1)     ;V5[r1] = f5
    mul.d f6,f5,f4    ;f6 = f5 * f4
    s.d f6,V6(r1)     ;V6[r1] = f6
    div.d f7,f6,f2    ;f7 = f6 / f2
    s.d f7,V7(r1)     ;V7[r1] = f7
    daddui r1,r1,8    ;r1 = r1 + 8
    j loop

exit:
    ;daddui r1,r1,8   ;per il delay slot inserisci questa istruzione qui
                      ;e toglila dal loop
    halt
