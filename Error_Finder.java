import java.io.*;
import java.util.ArrayList;

/**
 * Created by dkharisov on 07.07.2017.
 */
public class Error_Finder {
    public void listf(String directoryName, ArrayList<File> files) {
        File directory = new File(directoryName);

        // get all the files from a directory
        File[] fList = directory.listFiles();
        for (File file : fList) {
            if (file.isFile() && file.getAbsolutePath().endsWith(".txt")) {
                files.add(file);
            } else if (file.isDirectory()) {
                listf(file.getAbsolutePath() ,files);
            }
        }
    }

    public static void main(String[] args) {
        Error_Finder t = new Error_Finder();
        ArrayList<File> files = new ArrayList<>();
        t.listf(".", files);
        String tmp;
        BufferedReader in;
        try(FileWriter out = new FileWriter(new File("./ErrLog.txt"))) {
            for (File s : files) {
                in = new BufferedReader(new FileReader(s));
                while ((tmp = in.readLine()) != null) {
                    //System.out.println(tmp);
                    if (tmp.contains("error"))
                        //System.out.println("A");
                        out.append(s.getAbsolutePath() + System.lineSeparator() + tmp + System.lineSeparator());
                }
                in.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
