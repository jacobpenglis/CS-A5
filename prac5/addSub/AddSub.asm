// Calculates R1 + R2 - R3 and stores the result in R0.
// (R0, R1, R2, R3 refer to RAM[0], RAM[1], RAM[2], and RAM[3], respectively.)

// Put your code here.

@R1     // A = R1
D=M     // Store memory of R1 into D
@R2     // A = R2
D=D+M   // D = R1M + R2M
@R3
D=D-M
@R0
M=D     // Store output
(END)
@END
0;JMP