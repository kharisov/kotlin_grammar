import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by dkharisov on 06.07.2017.
 */
public class Tester {
    /*FilenameFilter f = new FilenameFilter() {
        @Override
        public boolean accept(File dir, String name) {
            return name.endsWith(".kt");
        }
    };*/

    public void listf(String directoryName, ArrayList<File> files) {
        File directory = new File(directoryName);

        // get all the files from a directory
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
        Tester t = new Tester();
        ArrayList<File> files = new ArrayList<>();
        t.listf(".", files);
        String out = null;
        ProcessBuilder pb;
        try {
            for (File s : files) {
                out = (s.getAbsolutePath().split("\\.kt"))[0];
                out = out + ".txt";
                pb = new ProcessBuilder("D:\\Program Files\\Java\\bin\\java", "org.antlr.v4.gui.TestRig", "Kotlin_Lexer", "tokens", "-tokens");
                pb.redirectInput(s);
                pb.redirectOutput(new File(out));
                pb.redirectErrorStream(true);
                pb.start();
                System.out.println(out);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
