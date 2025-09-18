// This file is based on part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: Mult.asm

// Multiplies R1 and R2 and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R0	//GO TO FINAL ANSWER BOX
M=0	//ZERO ANS BOX

@R1
D=M
@END
D;JEQ	//IF ONE PRODUCT IS ZERO

@R2
D=M
@END
D;JEQ	//IF ONE PRODUCT IS ZERO

@R1	//NOT NECESSARY
D=M	//
@3	//
M=D	//ONLY TO KEEP THE NUMBERS BEING MUTLIPLED


(LOOP)
@R2	//GET 2ND NUM
D=M	//D HAS 2ND NUM

@R0	//GO TO FINAL ANSWER BOX
M=D+M	//RAM[2] NOW HAS 2ND NUMBER + ITS PREVIOUS VALUE

@3	//GET 1ST NUM
M=M-1	//1ST NUM-1

D=M	//IDK WHY D NEEDS TO =M?
@LOOP	//WHERE TO JUMP TO
D;JGT	//JUMP		    (WHY CANT THIS BE M;JGT?)


(END)
@END
0;JMP	//FOREVER LOOP