import java.io.File;
import java.io.IOException;
import java.util.Scanner;

// Note: Must close FileWriter or it doesn't write to the file
public class Translator {
	public static void main(String[] args) throws IOException {
		Scanner sc = new Scanner(System.in);
		print("File/Directory: ");
		String fidi = sc.nextLine(); // file path of vm file(s)
		String fileName;
		CodeWriter cw;
		Parser parser;
		if (fidi.endsWith("\\")) { // directory (ex: C:\PATH\)
			fidi = fidi.substring(0, fidi.length() - 1); // remove ending '\'
			File directory = new File(fidi);
			println("Directory: " + directory.getAbsolutePath());
			File asmFile = new File(directory.getAbsoluteFile() + "\\" + directory.getName() + ".asm");
			asmFile.createNewFile();
			cw = new CodeWriter(new File(directory.getAbsoluteFile() + "\\" + directory.getName() + ".asm"));
			println("ASM File: " + directory.getAbsoluteFile() + "\\" + directory.getName() + ".asm");
			
			cw.writeInit(); // initialize
			for (File file : directory.listFiles()) {
				fileName = file.getName();
				if (fileName.endsWith(".vm")) {
					parser = new Parser(file);
					cw.setFileName(fileName.substring(0, fileName.indexOf(".")));
					loop(parser, cw);
				}
			}
			cw.close(); // don't forget to close or else it doesn't write to the outFile
		} else { // file (ex: C:\PATH\FILENAME.vm or C:\PATH\FILENAME)
			// Note: Doesn't need vm extension to work.
			if (!fidi.endsWith(".vm")) {
				fidi += ".vm";
			}
			File vmFile = new File(fidi);
			fileName = vmFile.getName();
			fileName = fileName.substring(0, fileName.indexOf(".vm"));
			parser = new Parser(vmFile);
			File asmFile = new File(vmFile.getParent() + "\\" + fileName + ".asm");
			cw = new CodeWriter(asmFile);
			cw.setFileName(fileName);
			println("File: " + vmFile.getAbsoluteFile());
			println("ASM File: " + asmFile.getAbsoluteFile());
			loop(parser, cw);
			cw.close();
		}
		print("Translation complete.");
		sc.close();
	}

	public static void loop(Parser parser, CodeWriter cw) throws IOException {
		String commandType;
		while (parser.hasMoreCommands()) {
			parser.advance();
			cw.writeComment(parser.getCommand()); // good to see what the translation is of the current command
			commandType = parser.commandType();
			switch (commandType) {
			case "C_ARITHMETIC":
				cw.writeArithmetic(parser.arg1());
				break;
			case "C_PUSH":
			case "C_POP":
				cw.writePushPop(parser.commandType(), parser.arg1(), parser.arg2());
				break;
			case "C_LABEL": // ex: label loop 
				cw.writeLabel(parser.arg1());
				break;
			case "C_GOTO": // ex: goto end
				cw.writeGoto(parser.arg1());
				break;
			case "C_IF": // ex: if-goto end
				cw.writeIf(parser.arg1());
				break;
			case "C_CALL": // ex: call mult 2
				cw.writeCall(parser.arg1(), parser.arg2());
				break;
			case "C_RETURN": // ex: return
				cw.writeReturn();
				break;
			case "C_FUNCTION": // ex: function power 2
				cw.writeFunction(parser.arg1(), parser.arg2());
				break;
			}
		}
	}

	public static void print(Object o) {
		System.out.print(o.toString());
	}

	public static void println(Object o) {
		System.out.println(o.toString());
	}

}
