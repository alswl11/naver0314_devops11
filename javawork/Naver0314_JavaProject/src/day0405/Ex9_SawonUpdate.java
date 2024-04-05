package day0405;

import day0404db.Ex1_MysqlSawon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Ex9_SawonUpdate {

    static  final String MYSQL_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String MYSQL_URL = "jdbc:mysql://localhost:3306/bit701?serverTime=Asia/Seoul";
    static final String USERNAME = "root";
    static final String PASSWORD = "1234";

    public Ex9_SawonUpdate() {
        try {
            Class.forName(MYSQL_DRIVER);
            // System.out.println("mysql8 드라이버 성공 ");
        } catch (ClassNotFoundException e) {
            System.out.println("mysql8 드라이버 오류 : " + e.getMessage());
        }
    }

    public void UpdateSawon() {

        Ex1_MysqlSawon sawon = new Ex1_MysqlSawon();
        sawon.writeSawon();
        System.out.println("=".repeat(40));

        Scanner sc = new Scanner(System.in);
        String updateName, updateBuseo;
        int updateScore;

        System.out.println("수정할 사람의 이름은?");
        updateName = sc.nextLine();

        System.out.println("수정할 점수는?");
        updateScore = Integer.parseInt(sc.nextLine());

        System.out.println("수정할 부서는 ? ");
        updateBuseo = sc.nextLine();

        String sql = "update sawon set score= "+updateScore+ ",buseo='"+updateBuseo+"' where name='"+updateName+"'";
        System.out.println(sql);

        Connection conn = null;
        Statement stmt = null;

        try {
            conn = DriverManager.getConnection(MYSQL_URL, USERNAME, PASSWORD);
            stmt = conn.createStatement();
            int n = stmt.executeUpdate(sql);
            if(n==0)
                System.out.println(updateName + "님이 존재하지 않습니다");
            else {
                System.out.println(updateName + "님의 정보가 수정되었습니다 ");
                // 수정 됐는지 확인
                sawon.writeSawon();
            }
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
        Ex9_SawonUpdate ex9 = new Ex9_SawonUpdate();
        ex9.UpdateSawon();
    }
}
