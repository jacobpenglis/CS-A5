// Finds the smallest element in the array of length R2 whose first element is at RAM[R1] and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// SLOW IMPLEMENTATION: Literally a for loop
@R1 
D=M
@R3         // Stores current element
M=D

@R2
D=M         // Length of array
@END
D;JLE       // <= 0

@R3
A=M
D=M         // D = First Element Memory
@R0
M=D         // Current Minimum Stored in R0

@INDEX
M=1         // From the second element (1)

(LOOP)
@INDEX      // /* Check if index is 0 */
D=M
@R2
D=D-M
@END
D;JEQ       // R2 Data == 0, meaning that we have iterated through whole loop

@INDEX      // /* Iterate through array */
D=M
@R1
A=M
D=D+A       // Index + Base Address
A=D
D=M

@R0         // /* Check minimum value */
A=M
D=D-A       // Check this, can't use M directly?
@MINNOTFOUND        // Current data value is bigger then current min!
D;JGE

@INDEX      // /* Otherwise, current data value is new min! */
D=M
@R1
A=M
D=D+A       // D = Current index + Base Address
A=D         // Go to the minimum array!
D=M         // New val
@R0
M=D         // Update R0 to the new minimum

(MINNOTFOUND)
@COUNTER    // Increment the counter
M=M+1

@LOOP       // Repeat the loop
0;JMP

(END)
@END        // Halt the program
0;JMP