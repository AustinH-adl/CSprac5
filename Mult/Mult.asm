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
    @NEG1
    D;JLT

    @R2
    D=M
    @NEG2
    D;JLT

    @SIGN
    M=1
    @ABS_DONE
    0;JMP

(NEG1)
    @R1
    M=-M
    @SIGN
    M=-1
    @R2
    D=M
    @NEG2_FIX
    D;JGE
    @R2
    M=-M
    @SIGN
    M=1
    @ABS_DONE
    0;JMP

(NEG2)
    @R2
    M=-M
    @SIGN
    M=-1
    @ABS_DONE
    0;JMP

(NEG2_FIX)
    @R2
    M=-M
    @SIGN
    M=1
    @ABS_DONE
    0;JMP

(ABS_DONE)
    @R2
    D=M
    @COUNT
    M=D

(LOOP)
    @COUNT
    D=M
    @END
    D;JEQ

    @R1
    D=M
    @R0
    M=M+D

    @COUNT
    M=M-1

    @LOOP
    0;JMP

(END)
    @SIGN
    D=M
    @POS
    D;JGE

    @R0
    M=-M

(POS)
    @END
    0;JMP
