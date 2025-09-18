// This file is based on part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: Mult.asm

// Multiplies R1 and R2 and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R0
M=0
@R1
D=M
@END
D;JEQ
@R2
D=M
@END
D;JEQ
@4
M=1
@R1
D=M
@R1NEG
D;JLT
@CHECKR2
0;JMP
(R1NEG)
@R1
M=-M
@4
M=-M
@CHECKR2
0;JMP
(CHECKR2)
@R2
D=M
@R2NEG
D;JLT
@CONT
0;JMP
(R2NEG)
@R2
M=-M
@4
M=-M
@CONT
0;JMP
(CONT)
@R1
D=M
@3
M=D
(LOOP)
@3
D=M
@APPLY_SIGN
D;JEQ
@R2
D=M
@R0
M=M+D
@3
M=M-1
@LOOP
0;JMP
(APPLY_SIGN)
@4
D=M
@END
D;JGE
@R0
M=-M
(END)
@END
0;JMP
