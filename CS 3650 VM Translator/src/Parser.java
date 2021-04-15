import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

// FINISHED
public class Parser {
	// NOTE TO SELF YOU CAN'T HAVE THE BELOW VARIABLES SET TO STATIC OR THE PARSER
	// WILL ALSO READ FROM THE PREVIOUS FILES AND THIS GAVE ME SO MUCH PAIN
	public String command = ""; // current command
	public String[] Commands = new String[0]; // set of commands
	public int n; // index of current command

	public Parser(File vmFile) throws FileNotFoundException {
		Scanner fileReader = new Scanner(vmFile);
		n = 0;
		while (fileReader.hasNextLine()) {
			command = fileReader.nextLine();
			if (!(command.startsWith("//") || command.isEmpty())) { // valid vm line
				if (command.contains("//")) { // remove comment if on same line
					command = command.substring(0, command.indexOf("//"));
				}
				command = removeEndingWhiteSpace(command);
				String[] temp = new String[Commands.length + 1];
				for (int i = 0; i < Commands.length; i++) {
					temp[i] = Commands[i];
				}
				temp[temp.length - 1] = command;
				Commands = temp;
			}
		}
		fileReader.close();

	}

	public boolean hasMoreCommands() {
		if (n < Commands.length) {
			return true;
		}
		return false;
	}

	public void advance() {
		command = Commands[n]; // current command
		n++;
	}

	// ex command: "pop pointer 0"
	public String commandType() {
		int space = command.indexOf(' '); // first space in command
		String commandType;
		if (space == -1) { // command is whole line
			commandType = command;
		} else {
			commandType = command.substring(0, space);
		}
		switch (commandType) {
		case "push":
			return "C_PUSH";
		case "pop":
			return "C_POP";
		case "label":
			return "C_LABEL";
		case "if-goto":
			return "C_IF";
		case "goto":
			return "C_GOTO";
		case "function":
			return "C_FUNCTION";
		case "return":
			return "C_RETURN";
		case "call":
			return "C_CALL";
		default:
			return "C_ARITHMETIC";
		}
	}

	public String arg1() {
		int space = command.indexOf(' ');
		if (space == -1) { // arithmetic
			return command;
		}
		// return second word
		String s = command.substring(space + 1);
		int space2 = s.indexOf(' '); // possible second space
		if (space2 == -1) {
			return s; // if-goto, goto, label
		}
		return s.substring(0, space2);
	}

	public int arg2() {
		// third word
		int space = 2;
		for (int i = 0; i < command.length(); i++) {
			if (command.charAt(i) == ' ') {
				space--;
				if (space == 0) {
					return Integer.valueOf(command.substring(i + 1));
				}
			}
		}
		return -1; // bad
	}

	public String getCommand() { // useful for comments
		return command;
	}

	public static String removeEndingWhiteSpace(String s) {
		for (int i = s.length() - 1; i >= 0; i--) {
			char c = s.charAt(i);
			if (!(c == ' ' || c == '\t')) {
				return s.substring(0, i + 1);
			}
		}
		return null; // bad
	}
}
