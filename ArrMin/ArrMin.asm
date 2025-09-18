// Finds the smallest element in the array of length R2 whose first element is at RAM[R1] and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@R2
    D=M
    @END          // if length == 0 -> R0=0
    D;JEQ

    @R1
    A=M
    D=M           // D = first element
    @R0
    M=D           // min = first element

    @R2
    M=M-1         // decrement length (we processed first element)

    @R1
    D=M
    @3
    M=D+1         // pointer = base+1

(LOOP)
    @R2
    D=M
    @END
    D;JEQ         // if no more elements, finish

    @3
    A=M
    D=M           // D = current element
    @R0
    D=D-M         // D = current - min
    @UPDATE
    D;JLT         // if current < min, update

(CONT)
    @3
    M=M+1         // pointer++
    @R2
    M=M-1         // length--
    @LOOP
    0;JMP

(UPDATE)
    @3
    A=M
    D=M
    @R0
    M=D
    @CONT
    0;JMP

(END)
    @END
    0;JMP