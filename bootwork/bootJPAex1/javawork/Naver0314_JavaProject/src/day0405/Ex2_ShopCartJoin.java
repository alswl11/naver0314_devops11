package day0405;

import java.sql.*;

public class Ex2_ShopCartJoin {
    static  final String MYSQL_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String MYSQL_URL = "jdbc:mysql://localhost:3306/bit701?serverTime=Asia/Seoul";
    static final String USERNAME = "root";
    static final String PASSWORD = "1234";

    public Ex2_ShopCartJoin() {
        try {
            Class.forName(MYSQL_DRIVER);
            System.out.println("mysql8 드라이버 성공 ");
        } catch (ClassNotFoundException e) {
            System.out.println("mysql8 드라이버 오류 : " + e.getMessage());
        }

    }

    public void wrteCartJoin() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

//        String sql = """
//                select cartnum, username, sangpum, price, color, guipday
//                from shop, cart
//                where shop.shopnum = cart.shopnum;
//                """;
        String sql = """ 
                select cartnum, username, sangpum, price, color, date_format(guipday, '%Y-%m-%d %H:%i') guipday
                from shop
                 inner join cart
                on shop.shopnum = cart.shopnum;         
            """;
        try {
            // url, username, pw 모두 맞으면 conntion 얻음
            conn = DriverManager.getConnection(MYSQL_URL, USERNAME, PASSWORD);
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            System.out.println("\t** 나의 장바구니 **\n");
            System.out.println("=".repeat(50));
            System.out.println("시퀀스\t이름\t상품명\t가격\t색상\t구입일");
            System.out.println("=".repeat(50));

            while (rs.next()) {
                int cn = rs.getInt("cartnum");
                String s = rs.getString("sangpum");
                String u = rs.getString("username");
                int p = rs.getInt("price");
                String c = rs.getString("Color");
                String g = rs.getString("guipday");

                System.out.println(cn + "\t" + u + "\t" + s + "\t" + p + "\t" + c + "\t" + g );

            }

        } catch (
                SQLException e) {
            System.out.println("URL, USERNAME, PASSWORD 확인 : "+ e.getMessage());
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
        Ex2_ShopCartJoin ex2 = new Ex2_ShopCartJoin();
        ex2.wrteCartJoin();

    }
}
