package data.dao;

import data.dto.SawonDto;
import db.common.MySqlConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class SawonDao {
    MySqlConnect db = new MySqlConnect();

    // 추가
    public void insertSawon(SawonDto dto) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        conn = db.getConnection();
        String sql = "insert into mysawon (name, buseo, age, addr, photo, gender, birthday) values (?,?,?,?,?,?,?)";
        try {
            // 바인딩
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getBuseo());
            pstmt.setInt(3, dto.getAge());
            pstmt.setString(4, dto.getAddr());
            pstmt.setString(5, dto.getPhoto());
            pstmt.setString(6, dto.getGender());
            pstmt.setString(7, dto.getBirthday());
            // 실행
            pstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(pstmt, conn);
        }

    }
    // 전체 출력
    public List<SawonDto> getAllSawon() {
        List<SawonDto> list = new Vector<SawonDto>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from mysawon order by name asc";
        conn = db.getConnection();


        try {
            pstmt =conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                SawonDto dto = new SawonDto();
                dto.setNum(rs.getInt("num"));
                dto.setName(rs.getString("name"));
                dto.setBuseo(rs.getString("buseo"));
                dto.setAge(rs.getInt("age"));
                dto.setAddr(rs.getString("addr"));
                dto.setPhoto(rs.getString("photo"));
                dto.setGender(rs.getString("gender"));
                dto.setBirthday(rs.getString("birthday"));

                list.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs, pstmt, conn);
        }

        return list;
    }

    // 한개 반환
    public SawonDto getData(int num) {
        SawonDto dto = new SawonDto();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from mysawon where num = ?";

        conn = db.getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto.setNum(rs.getInt("num"));
                dto.setName(rs.getString("name"));
                dto.setBuseo(rs.getString("buseo"));
                dto.setAge(rs.getInt("age"));
                dto.setAddr(rs.getString("addr"));
                dto.setPhoto(rs.getString("photo"));
                dto.setGender(rs.getString("gender"));
                dto.setBirthday(rs.getString("birthday"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs, pstmt, conn);
        }

        return dto;
    }
    public void deleteSawon(int num) {

        String sql = "delete from mysawon where num = ?";

        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(pstmt, conn);
        }
    }
    public void updateSawon(SawonDto dto) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "update mysawon set name = ?, age = ?, addr = ?, buseo =?, gender = ?, photo=?, birthday=? where num = ?";

        conn = db.getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getName());
            pstmt.setInt(2, dto.getAge());
            pstmt.setString(3, dto.getAddr());
            pstmt.setString(4, dto.getBuseo());
            pstmt.setString(5, dto.getGender());
            pstmt.setString(6, dto.getPhoto());
            pstmt.setString(7, dto.getBirthday());
            pstmt.setInt(8, dto.getNum());

            pstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(pstmt, conn);
        }

    }

    // 성별 분석 데이터 변환
    public List<Map<String, String>> getGenderAnalysis() {
        List<Map<String, String>> list = new Vector<Map<String, String>>();
        String sql = " select gender, count(*) count, round(avg(age),1) age from mysawon group by gender;";

        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Map<String, String> map = new HashMap<String, String>();
                String gender = rs.getString("gender");
                String count = rs.getString("count");
                String age = rs.getString("age");

                // map에 넣기
                map.put("gender", gender);
                map.put("count", count);
                map.put("age", age);

                // list에 추가
                list.add(map);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs, pstmt, conn);
        }
        return list;
    }

    // 부서 분석 데이터 변환
    public List<Map<String, String>> getBuseoAnalysis() {
        List<Map<String, String>> list = new Vector<Map<String, String>>();
        String sql = "select buseo, count(*) count, round(avg(age),1) age from mysawon group by buseo";

        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Map<String, String> map = new HashMap<String, String>();
                String buseo = rs.getString("buseo");
                String count = rs.getString("count");
                String age = rs.getString("age");

                map.put("buseo", buseo);
                map.put("count", count);
                map.put("age", age);

                list.add(map);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs, pstmt, conn);
        }
        return  list;
    }
}
