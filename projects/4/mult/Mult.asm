// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// Adds 1+...+100.
@R2
    M=0 // Set R2=0
(LOOP)
    @R1
    D=M // D=R1
    @END
    D;JEQ // if R1 is 0 goto END
    @R0
    D=M // D=R2
    @R2
    M=D+M // add R0 to sum
    @R1
    M=M-1 // decrement R1
    @LOOP
    0;JMP // Goto LOOP
(END)
    @END
    0;JMP // Infinite loop at end
