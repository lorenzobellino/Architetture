;Bellino Lorenzo 245442
;clock cycle = 1158

.data

Element:  .byte 40
V1:       .double 1.2,2.3,4.5,3.4,1.2,4.2,5.8,8.7,7.1,6.4
          .double 1.2,2.3,4.5,3.4,1.2,4.2,5.8,8.7,7.1,6.4
          .double 7.2,5.5,1.4,8.2,9.0,7.2,5.5,1.4,8.2,9.0
          .double 4.2,5.8,8.7,7.1,6.4,4.2,5.8,8.7,7.1,6.4

V2:       .double 3.4,1.1,5.2,7.1,8.1,3.4,1.1,5.2,7.1,8.1
          .double 1.2,2.3,4.5,3.4,1.2,4.2,5.8,8.7,7.1,6.4
          .double 4.2,5.8,8.7,7.1,6.4,4.2,5.8,8.7,7.1,6.4
          .double 7.2,5.5,1.4,8.2,9.0,7.2,5.5,1.4,8.2,9.0

V3:       .double 7.2,5.5,1.4,8.2,9.0,7.2,5.5,1.4,8.2,9.0
          .double 3.4,1.1,5.2,7.1,8.1,3.4,1.1,5.2,7.1,8.1
          .double 7.2,5.5,1.4,8.2,9.0,7.2,5.5,1.4,8.2,9.0
          .double 4.2,5.8,8.7,7.1,6.4,4.2,5.8,8.7,7.1,6.4

V4:       .double 4.2,5.8,8.7,7.1,6.4,4.2,5.8,8.7,7.1,6.4
          .double 7.2,5.5,1.4,8.2,9.0,7.2,5.5,1.4,8.2,9.0
          .double 3.4,1.1,5.2,7.1,8.1,3.4,1.1,5.2,7.1,8.1
          .double 1.2,2.3,4.5,3.4,1.2,4.2,5.8,8.7,7.1,6.4

V5:       .space 320
V6:       .space 320
V7:       .space 320



.text
main:
    lb r4,Element(r0)
    daddi r3,r0,8
    dmul r2,r3,r4
    and r1, r1, r0

loop:
    beq r2,r1,exit
    l.d f2,V2(r1)
    l.d f3,V3(r1)
    mul.d f10,f2,f3
    l.d f1,V1(r1)
    l.d f4,V4(r1)
    add.d f5,f10,f1
    daddui r3,r1,8
    mul.d f6,f5,f4
    s.d f5,V5(r1)
    l.d f3,V3(r3)
    s.d f6,V6(r1)
    div.d f7,f6,f2
    l.d f2,V2(r3)
    l.d f1,V1(r3)
    l.d f4,V4(r3)
    s.d f7,V7(r1)
    mul.d f10,f2,f3
    add.d f5,f10,f1
    daddui r1,r3,8
    mul.d f6,f5,f4
    s.d f5,V5(r3)
    l.d f3,V3(r1)
    s.d f6,V6(r3)
    div.d f7,f6,f2
    l.d f2,V2(r1)
    l.d f1,V1(r1)
    l.d f4,V4(r1)
    s.d f7,V7(r3)
    mul.d f10,f2,f3
    add.d f5,f10,f1
    daddui r3,r1,8
    mul.d f6,f5,f4
    s.d f5,V5(r1)
    l.d f3,V3(r3)
    s.d f6,V6(r1)
    div.d f7,f6,f2
    l.d f2,V2(r3)
    l.d f1,V1(r3)
    l.d f4,V4(r3)
    s.d f7,V7(r1)
    mul.d f10,f2,f3
    add.d f5,f10,f1
    daddui r1,r3,8
    mul.d f6,f5,f4
    s.d f5,V5(r3)
    s.d f6,V6(r3)
    div.d f7,f6,f2
    s.d f7,V7(r3)
    j loop

exit:
    halt
