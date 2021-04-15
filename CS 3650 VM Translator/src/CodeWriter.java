import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class CodeWriter {
	public File outFile;
	public FileWriter fileWriter;
	public String fileName;

	// indices for jumps
	public static int trueIndex = 0; // true/false are used for comparison arithmetic commands
	public static int falseIndex = 0;
	public static int returnIndex = 0; // used for return

	public CodeWriter(File outFile) throws IOException {
		this.outFile = outFile;
		this.outFile.createNewFile();
		fileWriter = new FileWriter(outFile.getAbsolutePath(), false);
	}

	public void setFileName(String fileName) throws IOException { // make sure to set file name before writing
		this.fileName = fileName;
	}

	public void writeComment(String comment) throws IOException {
		fileWriter.write("// " + comment + "\n");
	}

	// arithmetic command input string [CHAPTER 7]
	public void writeArithmetic(String command) throws IOException {
		fileWriter.write("@SP\n");
		fileWriter.write("M=M-1\n");
		fileWriter.write("A=M\n");
		fileWriter.write("D=M\n"); // D = y

		if (!(command.equals("not") || command.equals("neg"))) { // pop x
			fileWriter.write("@SP\n");
			fileWriter.write("M=M-1\n");
			fileWriter.write("A=M\n"); // M = x
		}

		switch (command) { // get D to store in the stack
		// D = y and if there is an x, M = x
		case "add": // x + y
			fileWriter.write("D=D+M\n"); // D = x + y
			break;
		case "sub": // x - y
			fileWriter.write("D=M-D\n"); // D = x - y
			break;
		case "neg": // -y
			fileWriter.write("D=-D\n"); // D = -y
			break;
		case "eq": // x = y, JEQ
			fileWriter.write("D=M-D\n"); // D = x - y
			fileWriter.write("@TRUE" + trueIndex + "\n");
			fileWriter.write("D;JEQ\n"); // if equal go to true
			fileWriter.write("D=0\n"); // D = false
			fileWriter.write("@FALSE" + falseIndex + "\n");
			fileWriter.write("0;JMP\n"); // skip to end
			fileWriter.write("(TRUE" + trueIndex + ")\n");
			fileWriter.write("D=-1\n"); // D = true
			fileWriter.write("(FALSE" + falseIndex + ")\n");
			// increment jump indices
			trueIndex++;
			falseIndex++;
			break;
		case "gt": // x > y, JGT
			fileWriter.write("D=M-D\n"); // D = x - y
			fileWriter.write("@TRUE" + trueIndex + "\n");
			fileWriter.write("D;JGT\n"); // if equal go to true
			fileWriter.write("D=0\n"); // D = false
			fileWriter.write("@FALSE" + falseIndex + "\n");
			fileWriter.write("0;JMP\n"); // skip to end
			fileWriter.write("(TRUE" + trueIndex + ")\n");
			fileWriter.write("D=-1\n"); // D = true
			fileWriter.write("(FALSE" + falseIndex + ")\n");
			// increment jump indices
			trueIndex++;
			falseIndex++;
			break;
		case "lt": // x < y, JLT
			fileWriter.write("D=M-D\n"); // D = x - y
			fileWriter.write("@TRUE" + trueIndex + "\n");
			fileWriter.write("D;JLT\n"); // if equal go to true
			fileWriter.write("D=0\n"); // D = false
			fileWriter.write("@FALSE" + falseIndex + "\n");
			fileWriter.write("0;JMP\n"); // skip to end
			fileWriter.write("(TRUE" + trueIndex + ")\n");
			fileWriter.write("D=-1\n"); // D = true
			fileWriter.write("(FALSE" + falseIndex + ")\n");
			// increment jump indices
			trueIndex++;
			falseIndex++;
			break;
		case "and":
			fileWriter.write("D=D&M\n");
			break;
		case "or":
			fileWriter.write("D=D|M\n");
			break;
		case "not": // !y
			fileWriter.write("D=!D\n");
			break;
		}
		fileWriter.write("@SP\n");
		fileWriter.write("A=M\n");
		fileWriter.write("M=D\n"); // store result into stack

		fileWriter.write("@SP\n");
		fileWriter.write("M=M+1\n"); // point to top of stack (empty area)

		return;
	}

	// [CHAPTER 7]
	public void writePushPop(String command, String segment, int index) throws IOException {
		// command is either C_PUSH or C_POP
		// index = number
		if (command.equals("C_PUSH")) { // PUSH
			switch (segment) {
			case "argument":
				// @ARG
				fileWriter.write("@" + index + "\n");
				fileWriter.write("D=A\n"); // D = index
				fileWriter.write("@ARG\n");
				fileWriter.write("A=M+D\n"); // address points to ARG[index]
				fileWriter.write("D=M\n"); // D = ARG[index]
				break;
			case "local":
				// @LCL
				fileWriter.write("@" + index + "\n");
				fileWriter.write("D=A\n"); // D = index
				fileWriter.write("@LCL\n");
				fileWriter.write("A=M+D\n"); // address points to LCL[index]
				fileWriter.write("D=M\n"); // D = LCL[index]
				break;
			case "static":
				// @XXX.j
				fileWriter.write("@" + fileName + "." + index + "\n");
				fileWriter.write("D=M\n");
				break;
			case "constant":
				fileWriter.write("@" + index + "\n");
				fileWriter.write("D=A\n"); // D = index
				break;
			case "this":
				// @THIS
				fileWriter.write("@" + index + "\n");
				fileWriter.write("D=A\n"); // D = index
				fileWriter.write("@THIS\n");
				fileWriter.write("A=M+D\n"); // address points to LCL[index]
				fileWriter.write("D=M\n"); // D = LCL[index]
				break;
			case "that":
				// @THAT
				fileWriter.write("@" + index + "\n");
				fileWriter.write("D=A\n"); // D = index
				fileWriter.write("@THAT\n");
				fileWriter.write("A=M+D\n"); // address points to LCL[index]
				fileWriter.write("D=M\n"); // D = LCL[index]
				break;
			case "pointer":
				// RAM[3-4] (0 or 1)
				fileWriter.write("@R" + (3 + index) + "\n");
				fileWriter.write("D=M\n");
				break;
			case "temp":
				// RAM[5-12] (0 - 7)
				fileWriter.write("@R" + (5 + index) + "\n");
				fileWriter.write("D=M\n");
				break;
			}
			fileWriter.write("@SP\n");
			fileWriter.write("A=M\n");
			fileWriter.write("M=D\n"); // push
			fileWriter.write("@SP\n");
			fileWriter.write("M=M+1\n"); // increment stack pointer
		} else { // POP (Can't pop a constant)
			switch (segment) {
			case "argument":
				offset("ARG", index);
				pop();
				reload();
				break;
			case "local":
				offset("LCL", index);
				pop();
				reload();
				break;
			case "static":
				pop();
				fileWriter.write("@" + fileName + "." + index + "\n");
				break;
			case "this":
				offset("THIS", index);
				pop();
				reload();
				break;
			case "that":
				offset("THAT", index);
				pop();
				reload();
				break;
			case "pointer":
				pop();
				fileWriter.write("@R" + (3 + index) + "\n");
				break;
			case "temp":
				pop();
				fileWriter.write("@R" + (5 + index) + "\n");
				break;
			}
			fileWriter.write("M=D\n"); // segment[index] = stack[top]
		}
		return;
	}

	public void writeInit() throws IOException {
		fileWriter.write("// initialize\n");
		// SP = 0x0100
		fileWriter.write("@256\n");
		fileWriter.write("D=A\n");
		fileWriter.write("@SP\n");
		fileWriter.write("M=D\n");

		writeCall("Sys.init", 0); // goes to sys.init
	}

	public void writeLabel(String label) throws IOException {
		fileWriter.write("(" + fileName + "$" + label + ")\n");
	}

	public void writeGoto(String label) throws IOException {
		fileWriter.write("@" + fileName + "$" + label + "\n");
		fileWriter.write("0;JMP\n");
	}

	public void writeIf(String label) throws IOException {
		pop(); // D = stack's topmost value
		fileWriter.write("@" + fileName + "$" + label + "\n");
		fileWriter.write("D;JNE\n"); // jump if != 0
	}

	public void writeCall(String functionName, int numArgs) throws IOException {
		fileWriter.write("// Push return-address, LCL, ARG, THIS, and THAT\n");
		fileWriter.write("// Push RETURN" + returnIndex + "\n");
		writePush("return", returnIndex);
		fileWriter.write("// Push LCL\n");
		writePush("local", 0);
		fileWriter.write("// Push ARG\n");
		writePush("argument", 0);
		fileWriter.write("// Push THIS\n");
		writePush("this", 0);
		fileWriter.write("// Push THAT\n");
		writePush("that", 0);

		// ARG = SP-n-5
		fileWriter.write("// ARG = SP-n-5\n");
		fileWriter.write("@" + (numArgs + 5) + "\n");
		fileWriter.write("D=A\n"); // D = n + 5
		fileWriter.write("@SP\n");
		fileWriter.write("D=M-D\n"); // D = SP - (n + 5)
		fileWriter.write("@ARG\n");
		fileWriter.write("M=D\n"); // ARG = SP - n - 5

		// LCL = SP
		fileWriter.write("// LCL = SP\n");
		fileWriter.write("@SP\n");
		fileWriter.write("D=M\n");
		fileWriter.write("@LCL\n");
		fileWriter.write("M=D\n");

		fileWriter.write("@" + functionName + "\n");
		fileWriter.write("0;JMP\n");
		fileWriter.write("(RETURN" + returnIndex + ")\n");
		returnIndex++;
	}

	// SUB WRITE COMMANDS FOR CALLWRITE (BELOW)
	public void writePushReturn(int index) throws IOException { // used only for pushing return of some index
		fileWriter.write("@RETURN" + index + "\n");
		fileWriter.write("D=A\n");
		push();
	}

	public void writePush(String segment, int index) throws IOException { // not used for return
		switch (segment) {
		case "argument":
			fileWriter.write("@ARG\n");
			fileWriter.write("D=M\n");
			break;
		case "local":
			fileWriter.write("@LCL\n");
			fileWriter.write("D=M\n");
			break;
		case "this":
			fileWriter.write("@THIS\n");
			fileWriter.write("D=M\n");
			break;
		case "that":
			fileWriter.write("@THAT\n");
			fileWriter.write("D=M\n");
			break;
		case "return":
			fileWriter.write("@RETURN" + index + "\n");
			fileWriter.write("D=A\n");
			break;
		}
		push();
	}
	// SUB WRITE COMMANDS FOR CALLWRITE (ABOVE)

	public void writeFunction(String functionName, int numLocals) throws IOException {
		fileWriter.write("(" + functionName + ")\n");
		fileWriter.write("// Push " + numLocals + " 0's\n");
		for (int i = 0; i < numLocals; i++) {
			writePushPop("C_PUSH", "constant", 0); // PUSH 0
		}
	}

	public void writeReturn() throws IOException { // Note: writePushPop uses @R13 so can use 14 and 15 instead
		// FRAME = LCL // FRAME is a temporary variable
		fileWriter.write("// FRAME = LCL\n");
		fileWriter.write("@LCL\n");
		fileWriter.write("D=M\n"); // D = FRAME
		fileWriter.write("@R14\n");
		fileWriter.write("M=D\n"); // R14 = FRAME

		// RET = *(FRAME-5) // Put the return-address in a temp. var. (* means ->
		// M[address])
		fileWriter.write("// RET = *(FRAME-5)\n");
		fileWriter.write("@5\n");
		fileWriter.write("A=D-A\n"); // FRAME - 5
		fileWriter.write("D=M\n"); // D = *(FRAME - 5)
		fileWriter.write("@R15\n");
		fileWriter.write("M=D\n"); // R15 = RET

		// *ARG = pop() // Reposition the return value for the caller
		fileWriter.write("// *ARG = pop()\n");
		writePushPop("C_POP", "argument", 0);

		// SP = ARG+1 // Restore SP of the caller
		fileWriter.write("// SP = ARG+1\n");
		fileWriter.write("@ARG\n");
		fileWriter.write("D=M\n"); // D = ARG
		fileWriter.write("@SP\n");
		fileWriter.write("M=D+1\n"); // SP = ARG + 1

		// THAT = *(FRAME-1) // Restore THAT of the caller
		fileWriter.write("// THAT = *(FRAME-1)\n");
		fileWriter.write("@R14\n");
		fileWriter.write("A=M-1\n"); // FRAME - 1
		fileWriter.write("D=M\n"); // *(FRAME - 1)
		fileWriter.write("@THAT\n");
		fileWriter.write("M=D\n");

		// THIS = *(FRAME-2) // Restore THIS of the caller
		fileWriter.write("// THIS = *(FRAME-2)\n");
		fileWriter.write("@2\n");
		fileWriter.write("D=A\n");
		fileWriter.write("@R14\n");
		fileWriter.write("A=M-D\n"); // FRAME - 2
		fileWriter.write("D=M\n"); // *(FRAME - 2)
		fileWriter.write("@THIS\n");
		fileWriter.write("M=D\n");

		// ARG = *(FRAME-3) // Restore ARG of the caller
		fileWriter.write("// ARG = *(FRAME-3)\n");
		fileWriter.write("@3\n");
		fileWriter.write("D=A\n");
		fileWriter.write("@R14\n");
		fileWriter.write("A=M-D\n"); // FRAME - 3
		fileWriter.write("D=M\n"); // *(FRAME - 3)
		fileWriter.write("@ARG\n");
		fileWriter.write("M=D\n");

		// LCL = *(FRAME-4) // Restore LCL of the caller
		fileWriter.write("// LCL = *(FRAME-4)\n");
		fileWriter.write("@4\n");
		fileWriter.write("D=A\n");
		fileWriter.write("@R14\n");
		fileWriter.write("A=M-D\n"); // FRAME - 4
		fileWriter.write("D=M\n"); // *(FRAME - 4)
		fileWriter.write("@LCL\n");
		fileWriter.write("M=D\n");

		// goto RET // Goto return-address (in the caller’s code)
		fileWriter.write("// goto RET\n");
		fileWriter.write("@R15\n"); // RET
		fileWriter.write("A=M\n");
		fileWriter.write("0;JMP\n");
	}

	// get R13 (only used if offset). Note: R13
	public void reload() throws IOException {
		fileWriter.write("@R13\n");
		fileWriter.write("A=M\n");
	}

	// store LABEL + index into R13
	public void offset(String LABEL, int index) throws IOException {
		fileWriter.write("@" + index + "\n");
		fileWriter.write("D=A\n");
		fileWriter.write("@" + LABEL + "\n");
		fileWriter.write("D=M+D\n"); // segment with correct offset
		fileWriter.write("@R13\n"); // free register
		fileWriter.write("M=D\n"); // saved segment with correct offset in R13
	}

	// pop stack
	public void pop() throws IOException { // pops stack onto D
		fileWriter.write("@SP\n");
		fileWriter.write("M=M-1\n");
		fileWriter.write("A=M\n");
		fileWriter.write("D=M\n"); // D = stack[top]
	}

	public void push() throws IOException { // pushes D onto stack
		fileWriter.write("@SP\n");
		fileWriter.write("A=M\n");
		fileWriter.write("M=D\n");
		fileWriter.write("@SP\n");
		fileWriter.write("M=M+1\n");
	}

	public void close() throws IOException {
		fileWriter.close();
	}
}
