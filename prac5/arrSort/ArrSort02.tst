load ArrSort.asm,
output-file ArrSort02.out,
compare-to ArrSort02.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[1000]%D2.9.2 RAM[1001]%D2.9.2 RAM[1002]%D2.9.2 RAM[1003]%D2.9.2 RAM[1004]%D2.9.2 RAM[1005]%D2.9.2 RAM[1006]%D2.9.2;

// Testing if it sorts beyond set array limits

set PC 0,
set RAM[0] 0,
set RAM[1] 1000,
set RAM[2] 5,
set RAM[1000] 100,
set RAM[1001] 2,
set RAM[1002] -100,
set RAM[1003] 1;
set RAM[1004] 1;
set RAM[1005] -500;
repeat 1000 {
    ticktock;
}
set RAM[1] 1000,
set RAM[2] 5,
output;