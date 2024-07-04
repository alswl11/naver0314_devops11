package day0405;

import day0404db.Ex1_MysqlSawon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Ex7_SawonDelete {

    static  final String MYSQL_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String MYSQL_URL = "jdbc:mysql://localhost:3306/bit701?serverTime=Asia/Seoul";
    static final String USERNAME = "root";
    static final String PASSWORD = "1234";

    public Ex7_SawonDelete() {
        try {
            Class.forName(MYSQL_DRIVER);
            System.out.println("mysql8 드라이버 성공 ");
        } catch (ClassNotFoundException e) {
            System.out.println("mysql8 드라이버 오류 : " + e.getMessage());
        }
    }

    public void deleteSawon() {
        Scanner sc = new Scanner(System.in);
        String delName = "";
        System.out.println("삭제할 이름을 입력하세요 : ");
        delName = sc.nextLine();

        String sql = "delete from sawon where name = '"+delName+"'";
        System.out.println(sql);

        Connection conn = null;
        Statement stmt = null;

        try {
            conn = DriverManager.getConnection(MYSQL_URL, USERNAME, PASSWORD);
            stmt = conn.createStatement();
            // executeUpdate : sql문을 실행 후 실행한 레코드의 갯수를 반환
            // ndl 0이면 삭제할 데이터가 없다는 의미
            int n = stmt.executeUpdate(sql);
            if(n==0)
                System.out.println(delName +"님은 명단에 없습니다");
            else
                System.out.println(n + "명의 " + delName+"님을 삭제했습니다");

            // 매번 워크벤치가서 확인하기 싫으면
            Ex1_MysqlSawon sawon = new Ex1_MysqlSawon();
            sawon.writeSawon();

        } catch (SQLException e) {
          e.printStackTrace();
        } finally {
            try {
                stmt.close();
                conn.close();
            } catch (SQLException | NullPointerException e) {
                e.printStackTrace();
            }
        }

    }

    public static void main(String[] args) {
        Ex7_SawonDelete ex7 = new Ex7_SawonDelete();
        ex7.deleteSawon();
    }
}
