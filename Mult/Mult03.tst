// 2 * 10 = 20

load Mult.asm,
output-file Mult03.out,
compare-to Mult03.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2;

set PC 0,
set RAM[0] 0,  // Set R0
set RAM[1] 2,  // Set R1
set RAM[2] 10;  // Set R2
repeat 200 {
  ticktock;    // Run for 100 clock cycles
}
set RAM[1] 2,  // Restore arguments in case program used them
set RAM[2] 10,
output;        // Output to file
