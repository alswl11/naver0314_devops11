package data.dao;

import data.dto.UserDto;
import db.common.MySqlConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    MySqlConnect db = new MySqlConnect();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;


    // sing up
    public void signupUser(UserDto dto) {

        String sql = "insert into user (userID, userPW, name, ph, email) values (?,?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);

            // 바인딩
            pstmt.setString(1, dto.getUserID());
            pstmt.setString(2, dto.getUserPW());
            pstmt.setString(3, dto.getName());
            pstmt.setString(4, dto.getPh());
            pstmt.setString(5, dto.getEmail());

            // 실행
            pstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

     // login
    public  int loginUser(String userID, String userPW) {

        String sql = "select userPW from user where userID =?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                String storedPW = rs.getString("userPW");
                if (storedPW.equals(userPW)) {

                    return 1;
                }
                else
                    return 0;
            }else {
                return -1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs, pstmt, conn);
        }
        return -2;
    }

    public UserDto getUserData (String userID) {
        UserDto dto = new UserDto();

        String sql = "select * from user where userID = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            rs= pstmt.executeQuery();

            if (rs.next()) {
                dto.setUserID(rs.getString("userID"));
                dto.setUserPW(rs.getString("userPW"));
                dto.setName(rs.getString("name"));
                dto.setPh(rs.getString("ph"));
                dto.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs, pstmt, conn);
        }
        System.out.println(dto);
        return dto;
    }
    public void updeteUserInfo(UserDto dto) {

        String sql = "update user set name = ?, ph = ?, email =? where userID = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            // 바인딩
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getPh());
            pstmt.setString(3, dto.getEmail());
            pstmt.setString(4, dto.getUserID());

            pstmt.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(pstmt, conn);
        }
    }
    public void deleteUser(String userID) {
        String sql = "delete from user where userID = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            pstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(pstmt, conn);
        }
    }
}
