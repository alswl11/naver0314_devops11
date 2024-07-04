package day0408;

import day0404db.Ex1_MysqlSawon;
import de.common.DbConnection;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class Ex2_DbSawon extends JFrame {

    DbConnection db = new DbConnection();
    JTable table;
    DefaultTableModel tableModel;
    JTextField tfName, tfScore;
    JButton btnAdd, btnDelete;
    JComboBox<String> cbGender, cbBuseo, cbBuseo2;
    //JRadioButton rbGender, rbMale, rbFemale;

    int order = 1;

    public Ex2_DbSawon(String title) {
        super(title);
        this.setLocation(100, 100); // 시작 위치
        this.setSize(500, 500); // 창 크기
        this.getContentPane().setBackground(new Color(138, 199, 119)); // 패널.setback 해야 됨 / 배경생 변경
        //		this.getContentPane().setBackground(Color.yellow); // 도 됨
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 프레임 종료 만 시켜줌
        this.initDesign(); // 각종 컴포넌트 생성
        this.setVisible(true);
    }

    public void initDesign() {

        JPanel p1 = new JPanel();
        p1.add(new JLabel("이름"));
        tfName = new JTextField(5);
        p1.add(tfName);
        p1.add(new JLabel("점수"));
        tfScore = new JTextField(3);
        p1.add(tfScore);
        this.add("North", p1);

        String[] title = {"시퀀스", "이름", "점수", "성별", "부서"};
        tableModel = new DefaultTableModel(title, 0);
        table = new JTable(tableModel);
        this.add("Center", new JScrollPane(table));

        JPanel p2 = new JPanel();
        btnAdd = new JButton("추가");
        btnDelete = new JButton("삭제");
        p2.add(btnAdd);
        p2.add(btnDelete);
        this.add("South", p2);

        String[] cb1 = {"여자", "남자"};
        cbGender = new JComboBox<>(cb1);
        p1.add(new JLabel("성별"));
        p1.add(cbGender);
        // this.add("North", p1);

        String[] cb2 = {"인사부", "홍보부", "교육부"};
        cbBuseo = new JComboBox<>(cb2);
        p1.add(new JLabel("부서"));
        p1.add(cbBuseo);
        this.add("North", p1);

        String[] cb3 = {"인사부", "홍보부", "교육부"};
        cbBuseo2 = new JComboBox<>(cb3);
        p2.add(new JLabel("부서"));
        p2.add(cbBuseo2);
        this.add("South", p2);

        ButtonGroup rg = new ButtonGroup();

        JRadioButton rbGender = new JRadioButton("전체");
        JRadioButton rbMale = new JRadioButton("남");
        JRadioButton rbFemale = new JRadioButton("여");
        rbGender.setSelected(true);

        rg.add(rbGender);
        rg.add(rbMale);
        rg.add(rbFemale);

        p2.add(rbGender);
        p2.add(rbMale);
        p2.add(rbFemale);

        cbBuseo2.addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                order = cbBuseo2.getSelectedIndex() + 1;
                writeSawon();
            }
        });

//        ActionListener rl = new ActionListener() {
//            @Override
//            public void actionPerformed(ActionEvent e) {
//                writeSawon();
//            }
//        };
//
        rbGender.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

            }
        });

        btnAdd.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (tfName.getText().length() == 0)
                    return;
                if (tfScore.getText().length() == 0)
                    return;

                Connection conn = db.getConnection();

                PreparedStatement pstmt = null;

                String sql = "insert into sawon values (null, ?, ?, ?, ?)";

                try {
                    pstmt = conn.prepareStatement(sql);

                    pstmt.setString(1, tfName.getText());
                    pstmt.setInt(2, Integer.parseInt(tfScore.getText()));
                    pstmt.setString(3, cbGender.getSelectedItem().toString());
                    pstmt.setString(4, cbBuseo.getSelectedItem().toString());

                    pstmt.executeUpdate();

                    // 입력값 초기화
                    tfName.setText("");
                    tfScore.setText("");

                    writeSawon();

                } catch (SQLException ex) {
                    ex.printStackTrace();
                } finally {
                    db.dbClose(pstmt, conn);
                }
            }
        });

        btnDelete.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int row = table.getSelectedRow();
                if (row == -1) {
                    JOptionPane.showMessageDialog(Ex2_DbSawon.this, "삭제할 행을 선택해주세요");
                    return;
                }
                String num = table.getValueAt(row, 0).toString();

                String sql = "delete from sawon where num = ?";

                Connection conn = db.getConnection();
                PreparedStatement pstmt = null;

                try {
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, num);
                    pstmt.execute();

                    writeSawon();

                } catch (SQLException ex) {
                    ex.printStackTrace();
                } finally {
                    db.dbClose(pstmt, conn);
                }
            }
        });

        writeSawon();

    }

    public void writeSawon() {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "";


        if (order == 1) {
            sql = "select * from sawon where buseo = '인사부'";


        }
        else if (order == 2)
            sql = "select * from sawon where buseo = '홍보부'";
        else if (order == 3)
            sql = "select * from sawon where buseo = '교육부'";

//        if (cbGender.getSelectedItem().equals("남자"))
//            sql += " AND gender = '남자'";
//        else if (cbGender.getSelectedItem().equals("여자"))
//            sql += " AN gender = '여자'";
//        else if (cbGender.getSelectedItem().equals("전체"))
//            sql = "";



        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            tableModel.setRowCount(0);

            while (rs.next()) {
                Vector<String> data = new Vector<String>();
                data.add(rs.getString("num"));
                data.add(rs.getString("name"));
                data.add(rs.getString("score"));
                data.add(rs.getString("gender"));
                data.add(rs.getString("buseo"));

                tableModel.addRow(data);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(pstmt, conn, rs);
        }

    }

    public static void main(String[] args) {
        // TODO Auto-generated method stub

        Ex2_DbSawon a = new Ex2_DbSawon("사원관리");
    }

}
