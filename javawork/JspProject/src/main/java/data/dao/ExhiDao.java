package data.dao;

import data.dto.ExhiDto;
import db.common.MySqlConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ExhiDao {

    MySqlConnect db = new MySqlConnect();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    public ExhiDto getExhiData (int num) {
        ExhiDto exhi_dto = new ExhiDto();
        String sql = "select * from exhi where num= ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                exhi_dto.setExhi_name(rs.getString("exhi_name"));
                exhi_dto.setExhi_explain(rs.getString("exhi_explain"));
                exhi_dto.setImg_addr(rs.getString("img_addr"));
                exhi_dto.setPeriod(rs.getString("period"));
                exhi_dto.setAuthor(rs.getString("author"));
                exhi_dto.setSupport(rs.getString("support"));
                exhi_dto.setCount(rs.getString("count"));
                exhi_dto.setFee(rs.getString("fee"));
                exhi_dto.setLocation(rs.getString("location"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs, pstmt, conn);
        }
        System.out.println(exhi_dto);
        return exhi_dto;
    }
}
