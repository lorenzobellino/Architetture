;Lorenzo Bellino 245442


.data
A: .byte -1,1,3,5,4,3,2,1,6,44,32,-34,-55,-4,30,-4,-77,-65,98,7,5,-3,-4,-2,53,12,-11,-13,-75,9  ;declaration of Vector A
B: .byte -2,-5,3,-24,-53,-13,14,7,9,22,-43,-24,5,8,5,-6,-3,-1,45,-98,16,63,-5,-3,-8,13,2,4,6,10 ;declaration of Vector B
C: .space 30            ;allocation for vector C
treshold_high: .space 1 ;allocation for treshold_high variable
treshold_low: .space 1  ;allocation for treshold_low variable
max: .space 1           ;allocation for max variable
min: .space 1           ;allocation for tmin variable
element: .byte 30       ;declaration of number of element in the array

.text
main:
    lb r1,A(r0)
    and r1, r1, r0    ;set r1 to zero (counter)
    and r6, r6, r0    ;set r6 to zero
    and r7, r7, r0    ;set r7 to zero
    lb r2,element(r0) ;load in r2 the nummber of element in the arrays

loop:
    beq r2,r1,exit    ;if all the elements are checked exit
  	lb r3,A(r1)       ;r3 = A[r1] -> load in r3 an element of A in position r1
    lb r4,B(r1)       ;r4 = B[r1] -> load in r4 an element of B in position r1
  	dadd r5,r3,r4     ;r5 = r3 + r4 -> add the two element and store the result in r5
    sb r5, C(r1)      ;C[r1] = r5 -> store r5 in the third Vector C at position r1
    slti r8,r5,0      ;if r5 < 0 then r8 = 1
    beqz r8,high      ;if r8 == 0 jump to high
    daddui r7,r7,1    ;else r7++ -> r7 = treshold_low counter
    j check_min      ;jump to check_min
high:
    daddui r6,r6,1    ;r6++ -> r6 = treshold_high counter
check_min:
    bnez r1,from_second_elem  ;if r1!=0 check for maximum and minimum
                              ;else r5 is the first element that we check
                              ;so we can already assign a minimum and a maximum
    dadd r9,r5,r0             ;r9 = r5 -> set r5 as minimum
    dadd r10,r5,r0            ;r10 = r5 -> set r5 as maximum
    j continue                ;jump to continue
from_second_elem:
    slt r11,r5,r9    ;if r5<r9:
                     ;r11=1 -> we found a new minimum
    beqz r11,check_max  ;if r11 == 0 jump to check_max
    dadd r9,r5,r0    ;else r9 = r5 -> update minimum
check_max:
    slt r11,r10,r5    ;if r10<r5:
                      ;r11 = 1 -> we found a new maximum
    beqz r11,continue ;if r11 == 0 jump to continue
    dadd r10,r5,r0    ;else r10 = r5 -> update maximum
continue:
  	daddui r1,r1,1    ;increment r1 (counter)
    j loop            ;jump back to the top of the loop

exit:
    sb r9,min(r0)     ;store in min the value of r9 (minimum)
    sb r10,max(r0)    ;store in max the value of r10 (maximum)
    sb r6,treshold_high(r0) ;store the value for treshold_high
    sb r7,treshold_low(r0)  ;store the value for treshold_low
		halt                    ;stop the execution
