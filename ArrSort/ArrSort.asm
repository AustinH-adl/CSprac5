// Sorts the array of length R2 whose first element is at RAM[R1] in ascending order in place. Sets R0 to True (-1) when complete.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

@R3
M=0

// Outer loop: for i = 0 to n-2
(OUTER_LOOP)
    // Check if i < n-1 (R2-1)
    @R2
    D=M
    @1
    D=D-A    // D = n-1
    @R3
    D=D-M    // D = (n-1) - i
    @END_SORT
    D;JLE    // if i >= n-1, exit outer loop
    
    // Initialize inner loop counter j = 0
    @R4
    M=0
    
    // Inner loop: for j = 0 to n-i-2
    (INNER_LOOP)
        // Check if j < n-i-1
        @R2
        D=M      // D = n
        @R3
        D=D-M    // D = n-i
        @1
        D=D-A    // D = n-i-1
        @R4
        D=D-M    // D = (n-i-1) - j
        @NEXT_OUTER
        D;JLE    // if j >= n-i-1, go to next outer iteration
        
        // Calculate address of array[j]
        @R1
        D=M      // D = base address
        @R4
        D=D+M    // D = base + j
        @R5
        M=D      // R5 = address of array[j]
        
        // Calculate address of array[j+1]
        @R5
        D=M
        @1
        D=D+A    // D = address of array[j+1]
        @R6
        M=D      // R6 = address of array[j+1]
        
        // Load array[j] into R7
        @R5
        A=M
        D=M
        @R7
        M=D      // R7 = array[j]
        
        // Load array[j+1] into R8
        @R6
        A=M
        D=M
        @R8
        M=D      // R8 = array[j+1]
        
        // Compare array[j] and array[j+1] with overflow protection
        // First check if array[j] is negative
        @R7
        D=M      // D = array[j]
        @ARR_J_NEGATIVE
        D;JLT    // if array[j] < 0, jump to negative case
        
        // array[j] is non-negative
        @R8
        D=M      // D = array[j+1]
        @NO_SWAP
        D;JGE    // if array[j+1] >= 0, both non-negative, safe to subtract
        // array[j] >= 0 and array[j+1] < 0, so array[j] > array[j+1], need swap
        @SWAP_ELEMENTS
        0;JMP
        
        (ARR_J_NEGATIVE)
        // array[j] is negative
        @R8
        D=M      // D = array[j+1]
        @SWAP_ELEMENTS
        D;JGE    // if array[j+1] >= 0, then array[j] < array[j+1], no swap needed
        // Both are negative, safe to subtract
        @R7
        D=M      // D = array[j]
        @R8
        D=D-M    // D = array[j] - array[j+1]
        @NO_SWAP
        D;JLE    // if array[j] <= array[j+1], no swap needed
        @SWAP_ELEMENTS
        0;JMP
        
        // Handle case where both are non-negative
        @R7
        D=M      // D = array[j]
        @R8
        D=D-M    // D = array[j] - array[j+1]
        @NO_SWAP
        D;JLE    // if array[j] <= array[j+1], no swap needed
        
        (SWAP_ELEMENTS)
        // Swap array[j] and array[j+1]
        // array[j] = array[j+1]
        @R8
        D=M
        @R5
        A=M
        M=D
        
        // array[j+1] = original array[j]
        @R7
        D=M
        @R6
        A=M
        M=D
        
    (NO_SWAP)
        // Increment j
        @R4
        M=M+1
        @INNER_LOOP
        0;JMP
    
    (NEXT_OUTER)
        // Increment i
        @R3
        M=M+1
        @OUTER_LOOP
        0;JMP

(END_SORT)
    // Set R0 = -1 to indicate completion
    @R0
    M=-1

// Infinite loop to end program
(END)
    @END
    0;JMP
