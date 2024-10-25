// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.



(BEGIN)
    @24576
    D=A
    @input // Set the address of the input (24579) to @input
    M=D
    @16384
    D=A
    @SCREEN
    M=D // Set the address of the screen (16384) to @SCREEN
(CHECK_INPUT)
    @24575
    D=A
    @oldvalue
    M=D // set the last address of the screen to @oldvalue
    @input
    A=M
    D=M // gather the value of the input into D
    @newvalue
    M=-1 // in binary, -1 is all 1's, which is black
    @DRAW
    D;JNE // Jump if @input is not 0 (screen will be black because @newvalue is -1)
    @newvalue
    M=0 // (screen will be white because @newvalue is 0)
(DRAW)
    @newvalue
    D=M // Get the value of @newvalue into D
    @oldvalue
    A=M
    M=D // Set the value of @newvalue to @oldvalue
    @oldvalue
    D=M // Get the value of @oldvalue into D
    @SCREEN
    D=D-A // Subtract the value of @oldvalue from
    @CHECK_INPUT
    D;JLE // Compare D to A (D=@oldvalue, A=@SCREEN)
    @oldvalue
    M=M-1
    @DRAW
    0;JMP
