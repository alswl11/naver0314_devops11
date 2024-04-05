package day0404db;

import java.sql.*;

public class Ex2_OraclePerson {

    static final String ORACLE_DRIVER = "oracle.jdbc.OracleDriver";
    static final String ORACLE_URL = "jdbc:oracle:thin:@db.bmops.kro.kr:1521/xe";
    static final String USERNAME = "angelminji";
    static final String PASSWORD = "a1234";

    public Ex2_OraclePerson() {
        try {
            Class.forName(ORACLE_DRIVER);
            System.out.println("oracle driver 성공");
        } catch (ClassNotFoundException e) {
            System.out.println("oracle driver 실패 :" + e.getMessage());
        }

    }
    static public void showTitle() {
        System.out.println("=".repeat(40));
        System.out.println("시퀀스\t이름\t혈액형\t나이\t입사일");
        System.out.println("=".repeat(40));
    }

    public void writePerson() {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null; // select문 일경우에만 필요한 클래스

        String sql = "select pnum, pname, upper(pblood) pblood, page, to_char(ipsaday, 'yyyy-mm-dd') ipsaday from person";

        // sql 문장이 길 경우 """ 블라블라 """ 로 처리할 수 잇음
        try {
            conn = DriverManager.getConnection(ORACLE_URL, USERNAME, PASSWORD);
            System.out.println("oracle 서버에 연결 성공");
            showTitle();

            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                String pnum = rs.getString("pnum");
                String pname = rs.getString("pname");
                String pblood = rs.getString("pblood");
                int page = rs.getInt("page");
                String ipsaday = rs.getString("ipsaday");

                System.out.println(pnum + "\t" + pname+ "\t" +pblood+ "\t" + page + "\t" +ipsaday );
            }
        } catch (SQLException e) {
            System.out.println("oracle 서버 연결 실패 : "+ e.getMessage());
        }finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                //e.printStackTrace();
            }
        }
    }
    public static void main(String[] args) {
        Ex2_OraclePerson ex2 = new Ex2_OraclePerson();
        ex2.writePerson();
    }
}
