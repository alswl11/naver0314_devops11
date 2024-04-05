package day0405;

import java.sql.*;
import java.util.Scanner;

public class Ex3_SawonSearchName {
    static  final String MYSQL_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String MYSQL_URL = "jdbc:mysql://localhost:3306/bit701?serverTime=Asia/Seoul";
    static final String USERNAME = "root";
    static final String PASSWORD = "1234";

    public Ex3_SawonSearchName() {
        try {
            Class.forName(MYSQL_DRIVER);
            System.out.println("mysql8 드라이버 성공 ");
        } catch (ClassNotFoundException e) {
            System.out.println("mysql8 드라이버 오류 : " + e.getMessage());
        }
    }

    public void searchSawon(String searchName) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String sql = "select * from sawon where name like concat('%', '"+searchName+"','%')";

        boolean find = false;

        try {
            conn = DriverManager.getConnection(MYSQL_URL, USERNAME, PASSWORD);
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            System.out.println("** " + searchName + " 검색 결과 **");
            System.out.println("=".repeat(40));
            System.out.println("시퀀스\t이름\t성별\t부서\t점수");
            System.out.println("=".repeat(40));

            while(rs.next()) {
                int num = rs.getInt("num");
                String name = rs.getString("name");
                String gender = rs.getString("gender");
                String buseo = rs.getString("buseo");
                int score = rs.getInt("score");
                System.out.println(num + "\t" + name + "\t" + gender +"\t" + buseo + "\t" + score);

                find = true;

                if(!find)
                    System.out.println(searchName + "을 포함하는 사원은 없습니다");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException | NullPointerException e) {
                e.printStackTrace();
            }
        }


    }
    public static void main(String[] args) {
        Ex3_SawonSearchName ex3 = new Ex3_SawonSearchName();
        Scanner sc = new Scanner(System.in);
        String searchName = "";
        while(true) {
            System.out.println("검색할 이름을 입력해주세요 (종료 :0) ");
            searchName = sc.nextLine();
            if(searchName.equalsIgnoreCase("x")) {
                System.out.println("종료합니다");
                break;
            }
            ex3.searchSawon(searchName);
            System.out.println();
        }

    }
}
