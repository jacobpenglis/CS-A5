load ArrSort.asm,
output-file ArrSort05.out,
compare-to ArrSort05.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[20]%D2.6.2 RAM[21]%D2.6.2 RAM[22]%D2.6.2 RAM[23]%D2.6.2 RAM[24]%D2.6.2;

// Multiple Overflow Values

set PC 0,
set RAM[0]  0,  // Set R0
set RAM[1]  20, // Set R1
set RAM[2]  4,  // Set R2
set RAM[20] -32767,  // Set Arr[0]
set RAM[21] -32766,  // Set Arr[1]
set RAM[22] 32767,  // Set Arr[2]
set RAM[23] 32767;  // Set Arr[3]
set RAM[24] 32766;
repeat 600 {
  ticktock;    // Run for 600 clock cycles
}
set RAM[1] 20,  // Restore arguments in case program used them
set RAM[2] 4,
output;        // Output to file