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
// function Class1.set 0
(Class1.set)
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
// pop static 0
@SP
M=M-1
A=M
D=M
@Class1.0
M=D
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
// pop static 1
@SP
M=M-1
A=M
D=M
@Class1.1
M=D
// push constant 0
@0
D=A
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
// function Class1.get 0
(Class1.get)
// Push 0 0's
// push static 0
@Class1.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Class1.1
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
// function Class1.set 0
(Class1.set)
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
// pop static 0
@SP
M=M-1
A=M
D=M
@Class2.0
M=D
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
// pop static 1
@SP
M=M-1
A=M
D=M
@Class2.1
M=D
// push constant 0
@0
D=A
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
// function Class1.get 0
(Class1.get)
// Push 0 0's
// push static 0
@Class2.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Class2.1
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
// function Class2.set 0
(Class2.set)
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
// pop static 0
@SP
M=M-1
A=M
D=M
@Class2.0
M=D
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
// pop static 1
@SP
M=M-1
A=M
D=M
@Class2.1
M=D
// push constant 0
@0
D=A
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
// function Class2.get 0
(Class2.get)
// Push 0 0's
// push static 0
@Class2.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Class2.1
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
// function Class1.set 0
(Class1.set)
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
// pop static 0
@SP
M=M-1
A=M
D=M
@Sys.0
M=D
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
// pop static 1
@SP
M=M-1
A=M
D=M
@Sys.1
M=D
// push constant 0
@0
D=A
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
// function Class1.get 0
(Class1.get)
// Push 0 0's
// push static 0
@Sys.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Sys.1
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
// function Class2.set 0
(Class2.set)
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
// pop static 0
@SP
M=M-1
A=M
D=M
@Sys.0
M=D
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
// pop static 1
@SP
M=M-1
A=M
D=M
@Sys.1
M=D
// push constant 0
@0
D=A
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
// function Class2.get 0
(Class2.get)
// Push 0 0's
// push static 0
@Sys.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Sys.1
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
// function Sys.init 0
(Sys.init)
// Push 0 0's
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Class1.set 2
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
@7
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
@Class1.set
0;JMP
(RETURN1)
// pop temp 0
@SP
M=M-1
A=M
D=M
@R5
M=D
// push constant 23
@23
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Class2.set 2
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
@7
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
@Class2.set
0;JMP
(RETURN2)
// pop temp 0
@SP
M=M-1
A=M
D=M
@R5
M=D
// call Class1.get 0
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
@Class1.get
0;JMP
(RETURN3)
// call Class2.get 0
// Push return-address, LCL, ARG, THIS, and THAT
// Push RETURN4
@RETURN4
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
@Class2.get
0;JMP
(RETURN4)
// label WHILE
(WHILE)
// goto WHILE
@WHILE
0;JMP
