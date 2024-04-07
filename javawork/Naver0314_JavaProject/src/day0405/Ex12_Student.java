package day0405;

import oracle.jdbc.proxy.annotation.Pre;

import java.sql.*;
import java.util.Scanner;

public class Ex12_Student {

    static  final String MYSQL_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String MYSQL_URL = "jdbc:mysql://localhost:3306/bit701?serverTime=Asia/Seoul";
    static final String USERNAME = "root";
    static final String PASSWORD = "1234";

    public Ex12_Student() {
        try {
            Class.forName(MYSQL_DRIVER);
            System.out.println("mysql8 드라이버 성공 ");
        } catch (ClassNotFoundException e) {
            System.out.println("mysql8 드라이버 오류 : " + e.getMessage());
        }
    }

    public void insertStudent(String name, int java, int html, int spring) {
        String sql = "insert into student (name, java, html, spring, testday) values (?, ?, ?, ?, now())";
        // db 저장하는 코드 추가
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DriverManager.getConnection(MYSQL_URL, USERNAME, PASSWORD);
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, name);
            pstmt.setInt(2, java);
            pstmt.setInt(3, html);
            pstmt.setInt(4,spring);
            // pstmt.setString(5, testday);

            pstmt.execute();
            System.out.println(name + "님의 성적을 등록하였습니다.");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void deleteStudent(String name) {
        String sql = "delete from student where name = ?";

        // 삭제하는 db 코드 추가
        // 해당 학생이 없을 경우 name + "님은 명단에 없어요"
        // 해당 학생이 있을 경우 name + "님의 성적정보를 삭제하였습니다"

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DriverManager.getConnection(MYSQL_URL, USERNAME, PASSWORD);
            pstmt  = conn.prepareStatement(sql);

            pstmt.setString(1, name);

            int n = pstmt.executeUpdate();

            if (n == 0)
                System.out.println(name + "님은 명단에 없습니다");
            else
                System.out.println(name + "님의 성적 정보를 삭제했습니다");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void writeStudent() {

        String sql = """
                select num, name, java, html, spring, java+html+spring tot, round((java+html+spring)/3,1) avg,
                       date_format(testday, '%Y-%m-%d %H:%i') testday
                from student
                """;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(MYSQL_URL, USERNAME, PASSWORD);
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            System.out.println("=".repeat(80));
            System.out.println("시퀀스 \t 이름 \t java \t html \t spring total \t avg \t testday");
            System.out.println("=".repeat(80));

            while (rs.next()) {
                int num = rs.getInt("num");
                String name = rs.getString("name");
                int java = Integer.parseInt(rs.getString("java"));
                int html = Integer.parseInt(rs.getString("html"));
                int spring = Integer.parseInt(rs.getString("spring"));
                int tot = Integer.parseInt(rs.getString("tot"));
                double avg = Double.parseDouble(rs.getString("avg"));
                String testday = rs.getString("testday");

                System.out.println(num+" \t\t "+name+" \t "+java+" \t "+html+" \t "+spring+" \t "+tot+" \t "+avg+" \t "+testday);
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
        Ex12_Student ex12 = new Ex12_Student();
        Scanner sc = new Scanner(System.in);

        int menu = 0;
        String name;
        int java, html, spring;

        while (true) {
            System.out.println("1. 학생정보 추가   2. 이름으로 삭제   3. 전체출력   4. 종료");
            menu = Integer.parseInt(sc.nextLine());

            if(menu == 1) {
                System.out.println("추가할 이름을 입력하세요 ");
                name = sc.nextLine();
                System.out.println("java 점수는 ?");
                java = Integer.parseInt(sc.nextLine());
                System.out.println("html 점수는 ?");
                html = Integer.parseInt(sc.nextLine());
                System.out.println("spring 점수는 ?");
                spring = Integer.parseInt(sc.nextLine());

                ex12.insertStudent(name, java, html, spring);
            } else if (menu == 2) {
                System.out.println("삭제할 학생의 이름을 입력하세요 ");
                name = sc.nextLine();
            } else if (menu == 3) {
                ex12.writeStudent();
            } else {
                System.out.println("프로그램 종료");
                break;
            }
            System.out.println("=".repeat(80));
        }
    }
}

