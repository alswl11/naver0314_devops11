package day0405;

import day0404db.Ex2_OraclePerson;

import java.sql.*;
import java.util.Scanner;

public class Ex11_OraclePerson {

    static final String ORACLE_DRIVER = "oracle.jdbc.OracleDriver";
    static final String ORACLE_URL = "jdbc:oracle:thin:@db.bmops.kro.kr:1521/xe";
    static final String USERNAME = "angelminji";
    static final String PASSWORD = "a1234";

    public Ex11_OraclePerson() {
        try {
            Class.forName(ORACLE_DRIVER);
            // System.out.println("oracle driver 성공");
        } catch (ClassNotFoundException e) {
            System.out.println("oracle driver 실패 :" + e.getMessage());
        }

    }

    public void insertPerson(String name, String blood, int age) {

        String sql = "insert into person valuse (seq_test.nextval, ?,?,?, sysdate)";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD);
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, name);
            pstmt.setString(2, blood);
            pstmt.setInt(3, age);

            pstmt.execute();


            System.out.println("데이터 추가 됐음");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


    public void writePerson() {
        //String sql = "select pnum 순서, PNAME 이름 , PAGE ||'세' 나이 , upper(PBLOOD) || '형' 혈액형 , to_char(IPSADAY, 'yyyy-mm-dd hh:mi') 입사날짜 from PERSON";
        String sql = "select pnum num, pname name, page age, upper(pblood) blood, to_char(ipsaday, 'yyyy-mm-dd hh:mi') ipsaday from person order by pnum asc";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD);
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            System.out.println("\t** PERSON table ** ");
            System.out.println("=".repeat(40));
            System.out.println("시퀀스\t이름\t 혈액형\t나이\t 입사일");
            System.out.println("=".repeat(40));

            while(rs.next()) {
                int pnum = rs.getInt("num");
                String pname = rs.getString("name");
                String page = rs.getString("age");
                String pblood = rs.getString("blood");
                String ipsaday = rs.getString("ipsaday");

                System.out.println(pnum + "\t" + pname + "\t" + pblood + "\t" + page + "\t" + ipsaday);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                pstmt.close();
                conn.close();
            } catch (SQLException | NullPointerException e) {
                e.printStackTrace();
            }
        }

    }

    public static void main(String[] args) {
        Ex11_OraclePerson ex11 = new Ex11_OraclePerson();
        Scanner sc = new Scanner(System.in);
        int menu = 0;
        String name, blood;
        int age;

        while(true) {
            System.out.println("1. 데이터 추가   2. 전체 출력   3. 종료");
            menu = Integer.parseInt(sc.nextLine());
            switch (menu) {
                case 1 :
                    System.out.println("이름 입력");
                    name = sc.nextLine();
                    System.out.println("혈액형 입력");
                    blood = sc.nextLine();
                    System.out.println("나이 입력");
                    age = Integer.parseInt(sc.nextLine());

                    ex11.insertPerson(name, blood, age);
                    break;
                case 2 :
//                {
//                    Ex2_OraclePerson person = new Ex2_OraclePerson();
//                    person.writePerson();
//                }
                    ex11.writePerson();
                    break;
                default :
                    System.out.println("프로그램 종료");
                    System.exit(0);
            }
            System.out.println();
        }
    }
}
