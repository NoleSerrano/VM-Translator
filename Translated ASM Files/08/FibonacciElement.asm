// initialize
@256
D=A
@SP
M=D
// Push return-address, LCL, ARG, THIS, and THAT
// Push RETURN0
@RETURN0
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG = SP-n-5
@5
D=A
@SP
D=M-D
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
@Sys.init
0;JMP
(RETURN0)
// function Main.fibonacci 0
(Main.fibonacci)
// Push 0 0's
// push argument 0
@0
D=A
@ARG
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@TRUE0
D;JLT
D=0
@FALSE0
0;JMP
(TRUE0)
D=-1
(FALSE0)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE
@SP
M=M-1
A=M
D=M
@Main$IF_TRUE
D;JNE
// goto IF_FALSE
@Main$IF_FALSE
0;JMP
// label IF_TRUE
(Main$IF_TRUE)
// push argument 0
@0
D=A
@ARG
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
// FRAME = LCL
@LCL
D=M
@R14
M=D
// RET = *(FRAME-5)
@5
A=D-A
D=M
@R15
M=D
// *ARG = pop()
@0
D=A
@ARG
D=M+D
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// SP = ARG+1
@ARG
D=M
@SP
M=D+1
// THAT = *(FRAME-1)
@R14
A=M-1
D=M
@THAT
M=D
// THIS = *(FRAME-2)
@2
D=A
@R14
A=M-D
D=M
@THIS
M=D
// ARG = *(FRAME-3)
@3
D=A
@R14
A=M-D
D=M
@ARG
M=D
// LCL = *(FRAME-4)
@4
D=A
@R14
A=M-D
D=M
@LCL
M=D
// goto RET
@R15
A=M
0;JMP
// label IF_FALSE
(Main$IF_FALSE)
// push argument 0
@0
D=A
@ARG
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@SP
A=M
M=D
@SP
M=M+1
// call Main.fibonacci 1
// Push return-address, LCL, ARG, THIS, and THAT
// Push RETURN1
@RETURN1
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG = SP-n-5
@6
D=A
@SP
D=M-D
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
@Main.fibonacci
0;JMP
(RETURN1)
// push argument 0
@0
D=A
@ARG
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@SP
A=M
M=D
@SP
M=M+1
// call Main.fibonacci 1
// Push return-address, LCL, ARG, THIS, and THAT
// Push RETURN2
@RETURN2
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG = SP-n-5
@6
D=A
@SP
D=M-D
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
@Main.fibonacci
0;JMP
(RETURN2)
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// return
// FRAME = LCL
@LCL
D=M
@R14
M=D
// RET = *(FRAME-5)
@5
A=D-A
D=M
@R15
M=D
// *ARG = pop()
@0
D=A
@ARG
D=M+D
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// SP = ARG+1
@ARG
D=M
@SP
M=D+1
// THAT = *(FRAME-1)
@R14
A=M-1
D=M
@THAT
M=D
// THIS = *(FRAME-2)
@2
D=A
@R14
A=M-D
D=M
@THIS
M=D
// ARG = *(FRAME-3)
@3
D=A
@R14
A=M-D
D=M
@ARG
M=D
// LCL = *(FRAME-4)
@4
D=A
@R14
A=M-D
D=M
@LCL
M=D
// goto RET
@R15
A=M
0;JMP
// function Sys.init 0
(Sys.init)
// Push 0 0's
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Main.fibonacci 1
// Push return-address, LCL, ARG, THIS, and THAT
// Push RETURN3
@RETURN3
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG = SP-n-5
@6
D=A
@SP
D=M-D
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
@Main.fibonacci
0;JMP
(RETURN3)
// label WHILE
(Sys$WHILE)
// goto WHILE
@Sys$WHILE
0;JMP
