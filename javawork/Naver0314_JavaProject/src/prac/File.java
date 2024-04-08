package prac;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.Buffer;
import java.text.NumberFormat;

public class File {

    static final String FILENAME = "/Users/parkminji/Documents/naver_0314/score1.txt";

//    public static void readFile() {
//        BufferedReader br = null;
//        FileReader fr = null;
//
//        try {
//            fr = new FileReader(FILENAME);
//            System.out.println(">> FILENAME 파일 읽었음 <<");
//            br = new BufferedReader(fr);
//
//            while (true) {
//                String line = br.readLine();
//                if(line == null)
//                    break;
//                System.out.println(line);
//            }
//
//
//        } catch (FileNotFoundException e) {
//            System.out.println(">> 파일이 없음 << ");
//        } catch (IOException e) {
//            // e.printStackTrace();
//            System.out.println("1");
//        } finally {
//            try {
//                br.close();
//                fr.close();
//            } catch (IOException e) {
//               // e.printStackTrace();
//                System.out.println("2");
//            }
//        }
//    }

    public static void scoreRead() throws IOException {
        int score, count = 0, sum = 0;
        double avg;
        FileReader fr = null;
        BufferedReader br = null;

        try {
            fr = new FileReader(FILENAME);
            br = new BufferedReader(fr);

            while (true) {
                String s = br.readLine();
                if(s == null)
                    break;
                try {
                    score = Integer.parseInt(s);
                    count++;
                    sum += score;
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }
            avg = (double)sum/count;
            System.out.println("점수 갯수 : " + count);
            System.out.println("점수 총점: " + sum);
            NumberFormat nf = NumberFormat.getInstance();
            nf.setMaximumFractionDigits(2);
            System.out.println("평균 : " + nf.format(avg));

        } catch (FileNotFoundException e) {
            System.out.println("파일이 없음");
        } finally {
            br.close();
            fr.close();
        }
    }


    public static void main(String[] args) {
        //readFile();
        try {
            scoreRead();
        } catch (IOException e) {
            e.getMessage();
        }
    }
}
