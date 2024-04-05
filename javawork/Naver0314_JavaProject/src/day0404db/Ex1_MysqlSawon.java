package day0404db;

import day0401_prac.ClientChat;

import java.sql.*;

public class Ex1_MysqlSawon {
    static  final String MYSQL_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String MYSQL_URL = "jdbc:mysql://localhost:3306/bit701?serverTime=Asia/Seoul";
    static final String USERNAME = "root";
    static final String PASSWORD = "1234";



    public Ex1_MysqlSawon() {
        try {
            Class.forName(MYSQL_DRIVER);
            System.out.println("mysql8 드라이버 성공 ");
        } catch (ClassNotFoundException e) {
            System.out.println("mysql8 드라이버 오류 : "  + e.getMessage());
        }

    }

    static public void showTitle() {
        System.out.println("=".repeat(40));
        System.out.println("시퀀스\t이름\t성별\t부서\t점수");
        System.out.println("=".repeat(40));

    }
    public void writeSawon() {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null; // select문 일경우에만 필요한 클래스
        String sql = "select * from sawon order by num";


        try {
            // url, username, pw 모두 맞으면 conntion 얻음
            conn = DriverManager.getConnection(MYSQL_URL, USERNAME, PASSWORD);
            System.out.println("Mysql 서버에 연결 성공");
            showTitle();

            stmt = conn.createStatement(); // sql을 실행하기 위한 statement 얻기
            rs = stmt.executeQuery(sql); // select 문 일 경우 무조건 executeQuery로 실행

            // rs.next : 다음 레코드로 이동하면서 true 반환, 더이상 이동할 데이터가 없으면 false 반환
            while(rs.next()) {
                // 데이터를 가져올 때는 column 번호 or column 명으로 가져오면 됨
//                int num = rs.getInt(1);
//                String name = rs.getString(2);
//                int score = rs.getInt(3);
//                String gender = rs.getString(4);
//                String buseo = rs.getString(5);

                // 컬럼명으로 가져오기 (이걸 더 선호?)
                int num = rs.getInt("num" );
                String name = rs.getString("name");
                int score = rs.getInt("score");
                String gender = rs.getString("gender");
                String buseo = rs.getString("buseo");

                System.out.println(num + "\t" + name + "\t" + gender + "\t" + buseo + "\t" + score);
            }


        } catch (SQLException e) {
            System.out.println("URL, USERNAME, PASSWORD 확인 : "+ e.getMessage());
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
        Ex1_MysqlSawon ex1 = new Ex1_MysqlSawon();
        ex1.writeSawon();
    }
}
