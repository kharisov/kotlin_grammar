import java.io.*;
import java.util.ArrayList;

import org.antlr.v4.runtime.*;

public class ParserTester {
    public void listf(String directoryName, ArrayList<File> files) {
        File directory = new File(directoryName);

        // get all the files from a directory and subdirectories that have .kt extension
        File[] fList = directory.listFiles();
        if (fList == null) {
            System.out.println("Wrong directory name");
            return;
        }
        for (File file : fList) {
            if (file.isFile() && file.getAbsolutePath().endsWith(".kt")) {
                files.add(file);
            } else if (file.isDirectory()) {
                listf(file.getAbsolutePath() ,files);
            }
        }
    }

    public static void main(String[] args) {
        String dirName = ".";
        File exceptionsFile = null;
        if (args.length > 2) {
            System.out.println("Wrong number of arguments. Make sure you pass directory name and exceptions file");
            return;
        } else if (args.length == 1) {
            dirName = args[0];
        } else if (args.length == 2) {
            dirName = args[0];
            exceptionsFile = new File(args[1]);
        }
        ArrayList<String> exceptions = new ArrayList<>();
        if (exceptionsFile != null) {
            try (BufferedReader in = new BufferedReader(new FileReader(exceptionsFile))) {
                String tmp;
                while ((tmp = in.readLine()) != null) {
                    exceptions.add(tmp);
                }
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
            catch (IOException a) {
                a.printStackTrace();
            }
        }
        System.setErr(System.out);
        ParserTester t = new ParserTester();
        ArrayList<File> files = new ArrayList<>();
        t.listf(dirName, files);
        CharStream input;
        KotlinLexer lexer = null;
        CommonTokenStream tokens;
        KotlinParser parser = null;
        int testCounter = 0;
        ArrayList<Integer> failedTests = new ArrayList<>();
        try(FileWriter mismatchedOut = new FileWriter(new File("mismatched.txt"))) {;
            for (File f : files) {
                input = CharStreams.fromStream(new FileInputStream(f));
                if (lexer == null) {
                    lexer = new MyLexer(input);
                }
                else
                    lexer.setInputStream(input);
                tokens = new CommonTokenStream(lexer);
                if (parser == null) {
                    parser = new KotlinParser(tokens);
                    parser.setErrorHandler(new MyErrorStrategy());
                }
                else
                    parser.setTokenStream(tokens);
                testCounter++;
                try {
                    System.out.println("\nFile: " + f.getName() + "\nPath: " + f.getCanonicalPath() + "\nTest: " + testCounter + " of " + files.size());
                    parser.kotlinFile();
                    if (!exceptions.contains(f.getName()) && !exceptions.contains(f.getCanonicalPath()))
                        System.out.println("Test passed!");
                    else {
                        failedTests.add(testCounter);
                        System.out.println("Test failed! This test was meant to be erroneous, but it passed");
                        mismatchedOut.append(f.getCanonicalPath() + " Not valid file, but Parser passed" +  System.lineSeparator());
                    }
                } catch (RuntimeException e) {
                    if (exceptions.contains(f.getName()) || exceptions.contains(f.getCanonicalPath()))
                        System.out.println("Test passed! This test was meant to be erroneous");
                    else {
                        failedTests.add(testCounter);
                        System.out.println("Test failed!");
                        mismatchedOut.append(f.getCanonicalPath() + " Valid file, but Parser failed" +  System.lineSeparator());
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("\nTests passed: " + (files.size() - failedTests.size()) + " out of " + files.size());
        if (failedTests.size() > 0) {
            System.out.print("Number of failed tests: ");
            for (Integer i : failedTests)
                System.out.print(i + " ");
            System.out.println();
        }
    }
}

class MyErrorStrategy extends DefaultErrorStrategy {
    @Override
    public void recover(Parser recognizer, RecognitionException e) throws RuntimeException {
        throw new RuntimeException(e);
    }

    @Override
    public Token recoverInline(Parser recognizer) throws RuntimeException {
        reportUnwantedToken(recognizer);
        reportMissingToken(recognizer);
        throw new RuntimeException(new InputMismatchException(recognizer));
    }

    @Override
    public void sync(Parser recognizer) {}
}

class MyLexer extends KotlinLexer {
    public MyLexer(CharStream input) { super(input); }
    public void recover(LexerNoViableAltException e) {
        throw new RuntimeException(e);
    }
}