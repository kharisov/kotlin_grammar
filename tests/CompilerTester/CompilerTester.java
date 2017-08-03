import java.io.*;

import java.util.ArrayList;

/**
 * Created by dkharisov on 06.07.2017.
 */
public class CompilerTester {
    public static void listf(String directoryName, ArrayList<File> files) {
        File directory = new File(directoryName);

        // get all the files from a directory that have .kt extension
        File[] fList = directory.listFiles();
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
        File exceptionsFile = new File("exceptions.txt");
        if (args.length > 2) {
            System.out.println("Wrong number of arguments. Make sure you pass directory name and exceptions file");
            return;
        } else if (args.length == 1) {
            dirName = args[0];
        } else if (args.length == 2) {
            dirName = args[0];
            exceptionsFile = new File(args[1]);
        }
        ArrayList<File> files = new ArrayList<>();
        CompilerTester.listf(dirName, files);
        String out = null;
        ProcessBuilder pb;
        Process process;
        int i = 0;
        BufferedReader in;
        String tmp;
        int excCount = 0;
        try(FileWriter excOut = new FileWriter(exceptionsFile)) {
            for (File s : files) {
                out = (s.getAbsolutePath().split("\\.kt"))[0];
                out = out + ".txt";
                pb = new ProcessBuilder("kotlinc.bat", s.getCanonicalPath());
                pb.redirectInput(s);
                pb.redirectOutput(new File(out));
                pb.redirectErrorStream(true);
                process = pb.start();
                process.waitFor();
                in = new BufferedReader(new FileReader(new File(out)));
                while ((tmp = in.readLine()) != null) {
                    if (tmp.contains("error")) {
                        excOut.append(s.getCanonicalPath() + System.lineSeparator());
                        excCount++;
                        break;
                    }
                }
                in.close();
                System.out.println(s.getCanonicalPath() + " " + ++i);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e1) {
            e1.printStackTrace();
        }
        System.out.println("Failed to compile: " + excCount);
    }
}
