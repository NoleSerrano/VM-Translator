// function SimpleFunction.test 2
(SimpleFunction.test)
// Push 2 0's
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@LCL
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=A
@LCL
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
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
// not
@SP
M=M-1
A=M
D=M
D=!D
@SP
A=M
M=D
@SP
M=M+1
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
// push argument 1
@1
D=A
@ARG
A=M+D
D=M
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
