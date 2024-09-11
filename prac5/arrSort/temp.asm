// Sorts the array of length R2 whose first element is at RAM[R1] in ascending order in place. Sets R0 to True (-1) when complete.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// Check if array starts at an appropriate register!
@R1
D=M-1           
@SORTED
D;JLE 

// Check for sufficient number of elements!
@R2
D=M-1
@SORTED
D;JLE

// /* Bubble Sort! */

// Initialise needed variables to loop twice, and check flag.
@0
D=A
@R7                 // R7 = INNER_INDEX J
M=D
@R6                 // R6 = OUTER_INDEX I
M=D
@R8                 // R8 = BOOLEAN SWAP_FLAG
M=D

// /* OUTER LOOP: 1. Reset swap flag, 2. Increment Index 3. Check condition for Loop, 4. Conditional Statement */

(OUTERLOOP)
@0
D=A
@R8                 // Responsibility Outer 1: Reset R8
M=D
@R3                 // R3 = TEMP REGISTER
M=D
@R4                 // R4 = Compare_Value_1
M=D
@R5                 // R5 = Compare_Value_2
M=D
@R7                 // R7 = j
M=D

// /* INNER LOOP: 1. Conditional Statement (SWAP), 2. Increment Index, 3. Check Condition for Loop */

(INNERLOOP)
@R7          // /* CONDITIONAL IF: (arr[j] > arr[j + 1]): SWAP IF TRUE */ (Responsibility 1) 
D=M                     // j
@R1
A=M+D                   // Array[j]
D=M
@R4                     // R4 = Compare_Value_1
M=D

@R7          // j
D=M+1                   // j+1
@R1                     // R1 = Array Starting Index
A=M+D                   // Array[j+1]
D=M
@R5                     // R5 = Compare_Value_2
M=D

// Compare Values Proper
@R4
D=M
@R5
D=D-M                       // WANT: A[j] > A[j+1], if A[j] - A[j+1] < 0, no swap should occur
@NOSWAP
D;JLT

// A[j] < A[j+1] (bad), Swapping!
// Swap 1:
@R7
D=M                     // j
@R1
A=M+D                   // Array[j]
D=A                     
@R3                     // r3 = temp reg
M=D
@R5
D=M
@R3
A=M                     // oh my fucking god this took my forever to figure out
M=D

// Swap 2:
@R7
D=M+1                   // j+1
@R1
A=M+D                   // Array[j+1]          
D=A                     // Store the *ADDRESS* of Array[j+1] in D
@R3                     // R3 = temp reg
M=D                     // Store the ADDRESS of Array[j+1] in a temp reg
@R4
D=M
@R3                     // R3 = temp reg
A=M                     
M=D

@R8                     // Update Swap Flag
M = 1

// End Swap
// END CONDITIONAL IF (INNER) 

(NOSWAP)
@R7                     // Responsibility 2. Increment Index
M=M+1

@R6                     // Responsibility 3. Check Conditional 
D=M

@R2                     // R2 = Array length
D=M-D                   // D = Array length - I
D=D-1                   // D = Array length - I - 1

@R7                     // Check j < n - i - 1
D=M-D
@INNERLOOP
D;JGT

// END INNER LOOP

// /* CONDITIONAL IF (OUTER): if (swapped == 0 (false)), BREAK if TRUE */

@R8
D=M
@SORTED
D;JEQ

// END CONDITIONAL IF (OUTER)

@R6                     // Responsibility Outer 2: Increment Index!
M=M+1       
D=M

@R2                     // Responsibility Outer 3: Check Condition, if OUTER_INDEX >= R2, Break
D=M-D
D=D-1
@OUTERLOOP
D;JGT

// END OUTER LOOP

(SORTED)
@R7
D=M
@R0
M=D

(END)
@END
0;JMP