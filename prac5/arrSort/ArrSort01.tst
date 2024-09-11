load ArrSort.asm,
output-file ArrSort01.out,
compare-to ArrSort01.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[1000]%D2.9.2 RAM[1001]%D2.9.2 RAM[1002]%D2.9.2 RAM[1003]%D2.9.2;

// Attempting overflow with -2^15 and (2^15)-1

set PC 0,
set RAM[0] 0,
set RAM[1] 1000,
set RAM[2] 4,
set RAM[1000] 32767,
set RAM[1001] 2,
set RAM[1002] -32768,
set RAM[1003] 1;
repeat 1000 {
    ticktock;
}
set RAM[1] 1000,
set RAM[2] 4,
output;