// Finds the smallest element in the array of length R2 whose first element is at RAM[R1] and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R1 
D=M
@R3         // Stores current element
M=D

@R2
D=M         // D = Length of array
@END
D;JLE       // <= 0

@R3
A=M
D=M         // D = First Element Memory
@R0
M=D         // Current Minimum Stored in R0

@R3
M=1         // From the second element (1)

(LOOP)
@R3      // /* Check if loop should stop! */
D=M
@R2
D=D-M
@END
D;JEQ       // R2 Data == 0, meaning that we have iterated through whole loop

@R3         // /* Iterate through array */
D=M
@R1
A=M
D=D+A       // INDEX + Base Address
@R4         // R4 contains Memory: Address A[j+i]
M=D

@R0
D=M
@CHECK_SAME_POS
D;JGE                    // Current Min is pos >= 0
@CHECK_SAME_NEG
D;JLT                    // Current Min is negative

(CHECK_SAME_POS)
@R4
A=M
D=M
@DIFFERENT_SIGN_1
D;JLT                   // Jumps if current min is positive and A[j+1] is negative
@SAME_SIGN
D;JGE                   // Otherwise, poth positive

(CHECK_SAME_NEG)
@R4
A=M
D=M
@DIFFERENT_SIGN_2       // Jumps if current min is negative and A[j+1] is positive
D;JGE
@SAME_SIGN              // Otherwise, both negative
D;JLT

(DIFFERENT_SIGN_1)
@SAME_SIGN
0;JMP

(DIFFERENT_SIGN_2)
@MINNOTFOUND
0;JMP

(SAME_SIGN)
@R0                 // /* Check minimum value */
D=D-M               // Check this, can't use M directly?
@MINNOTFOUND        // Current data value is bigger then current min!
D;JGE

(SWAP)
@R3         // /* Otherwise, current data value is new min! */
D=M
@R1
A=M
D=D+A       // D = Current R3 + Base Address
A=D         // Go to the minimum array!
D=M         // New val
@R0
M=D         // Update R0 to the new minimum

(MINNOTFOUND)
@R3    // Increment the counter
M=M+1

@LOOP       // Repeat the loop
0;JMP

(END)
@END        // Halt the program
0;JMP