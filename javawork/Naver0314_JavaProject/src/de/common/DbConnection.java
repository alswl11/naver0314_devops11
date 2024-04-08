package de.common;

import java.sql.*;

public class DbConnection {
    static  final String MYSQL_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String MYSQL_URL = "jdbc:mysql://localhost:3306/bit701?serverTime=Asia/Seoul";
    static final String USERNAME = "root";
    static final String PASSWORD = "1234";

    public DbConnection() {
        try {
            Class.forName(MYSQL_DRIVER);
            System.out.println("mysql8 드라이버 성공 ");
        } catch (ClassNotFoundException e) {
            System.out.println("mysql8 드라이버 오류 : " + e.getMessage());
        }
    }

    public Connection getConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(MYSQL_URL, USERNAME, PASSWORD);
        } catch (SQLException e) {
            System.out.println("MYSQL 서버 연결 실패 " + e.getMessage());
        }
        return conn;
    }
    public void dbClose(PreparedStatement pstmt, Connection conn) { // 오버로딩
        try {
            pstmt.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
    }

    public void dbClose(PreparedStatement pstmt, Connection conn, ResultSet rs) { // 오버로딩
        try {
            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {

    }
}
