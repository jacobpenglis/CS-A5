load ArrMin.asm,
output-file ArrMin06.out,
compare-to ArrMin06.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[25]%D2.6.2 RAM[26]%D2.6.2 RAM[27]%D2.6.2 RAM[28]%D2.6.2;

set PC 0,
set RAM[0]  0,  // Set R0
set RAM[1]  25, // Set R1
set RAM[2]  4,  // Set R2
set RAM[25] -500,  // Set Arr[0]
set RAM[26] -10,  // Set Arr[1]
set RAM[27] 100,  // Set Arr[2]
set RAM[28] -10;  // Set Arr[3]
repeat 300 {
  ticktock;    // Run for 300 clock cycles
}
set RAM[1] 25,  // Restore arguments in case program used them
set RAM[2] 4,
output;        // Output to file