package day0411;


import java.sql.*;

public class BankJdbc {
    static final String MYSQL_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String MYSQL_URL = "jdbc:mysql://localhost:3306/bit701?serverTime=Asia/Seoul";
    static final String USERNAME = "root";
    static final String PASSWORD = "1234";

    public BankJdbc() {
        try {
            Class.forName(MYSQL_DRIVER);
            System.out.println("mysql8 드라이버 성공 ");
        } catch (ClassNotFoundException e) {
            System.out.println("mysql8 드라이버 오류 : "  + e.getMessage());
        }
    }

    public void creatBankBank(String name, int balance) throws SQLException { // 계좌 생성
        String sql = "insert into bank (bankNum, name, balance) values (null, ?,?)";
        Connection conn = null;
        PreparedStatement pstmt = null;

        conn = DriverManager.getConnection(MYSQL_URL, USERNAME, PASSWORD);
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, String.valueOf(balance));
        pstmt.executeUpdate();
    }


    public void deposite(String name, int balance )throws SQLException { // 입금
        String sql = "select * from bank where name = ?";
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        conn = DriverManager.getConnection(MYSQL_URL, USERNAME, PASSWORD);
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        rs = pstmt.executeQuery();
        rs.next();

        String bkName = rs.getString("name");
        int bkBal = rs.getInt("balance");

        rs.close();
        pstmt.close();

        if(bkName.equals(name)) {
            if(balance<=0)
                System.out.println(">> 0원 이하의 금액은 입금할 수 없음");
            else {
                sql = "update bank set balance = ? where name =?";
                pstmt = conn.prepareStatement(sql);
                bkBal += balance;
                pstmt.setInt(1, bkBal);
                pstmt.setString(2, bkName);
                pstmt.executeUpdate();
                System.out.println(">> " + balance + "원이 입금됐음");
                pstmt.close();
                conn.close();
            }
        }
        else
            System.out.println(">> 계좌 없음");


    }
    public void withdraw(String name, int balance) throws SQLException { // 출금
        String sql = "select * from bank where name  = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        conn = DriverManager.getConnection(MYSQL_URL, USERNAME, PASSWORD);
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        rs = pstmt.executeQuery();
        rs.next();

        String bkName = rs.getString("name");
        int bkBal = rs.getInt("balance");

        rs.close();
        pstmt.close();

        if(bkName.equals(name)) {
            if(balance <=0)
                System.out.println("0 이하의 금액은 출금할 수 없습니다");
            else if (bkBal < balance) {
                System.out.println("잔액이 부족합니다");
            } else {
                sql = "update bank set balance = ? where name =?";
                pstmt = conn.prepareStatement(sql);
                bkBal -= balance;
                pstmt.setInt(1, bkBal);
                pstmt.setString(2, bkName);
                pstmt.executeUpdate();
                System.out.println(">> " + balance + "원이 출금됐음");
                pstmt.close();
                conn.close();
            }
        } else
            System.out.println(">> 계좌 없음");
    }
    public void printBank(String name) throws SQLException { // 계좌 조회
        String sql = "select * from bank where name = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        conn = DriverManager.getConnection(MYSQL_URL, USERNAME, PASSWORD);
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        rs = pstmt.executeQuery();
        rs.next();
        System.out.println(">> 이름 : " + rs.getString("name") + ", 계좌번호 : " + rs.getString("bankNum") + ", 잔액 :" + rs.getInt("balance"));

        rs.close();
        pstmt.close();
        conn.close();
    }

}
