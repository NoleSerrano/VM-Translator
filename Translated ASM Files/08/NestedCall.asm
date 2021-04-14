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
// function Sys.init 0
(Sys.init)
// Push 0 0's
// push constant 4000
@4000
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
A=M
D=M
@R3
M=D
// push constant 5000
@5000
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@R4
M=D
// call Sys.main 0
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
@Sys.main
0;JMP
(RETURN1)
// pop temp 1
@SP
M=M-1
A=M
D=M
@R6
M=D
// label LOOP
(LOOP)
// goto LOOP
@LOOP
0;JMP
// function Sys.main 5
(Sys.main)
// Push 5 0's
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
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 4001
@4001
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
A=M
D=M
@R3
M=D
// push constant 5001
@5001
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@R4
M=D
// push constant 200
@200
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=A
@LCL
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
// push constant 40
@40
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
D=A
@LCL
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
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 3
@3
D=A
@LCL
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
// push constant 123
@123
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.add12 1
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
@Sys.add12
0;JMP
(RETURN2)
// pop temp 0
@SP
M=M-1
A=M
D=M
@R5
M=D
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
// push local 2
@2
D=A
@LCL
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 3
@3
D=A
@LCL
A=M+D
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 4
@4
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
// function Sys.add12 0
(Sys.add12)
// Push 0 0's
// push constant 4002
@4002
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
A=M
D=M
@R3
M=D
// push constant 5002
@5002
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@R4
M=D
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
// push constant 12
@12
D=A
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
