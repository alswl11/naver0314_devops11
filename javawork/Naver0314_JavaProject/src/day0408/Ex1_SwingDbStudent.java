 package day0408;

 import de.common.DbConnection;
 import oracle.jdbc.proxy.annotation.Pre;

 import javax.swing.*;
 import javax.swing.table.DefaultTableModel;
 import java.awt.*;
 import java.awt.event.ActionEvent;
 import java.awt.event.ActionListener;
 import java.awt.event.ItemEvent;
 import java.awt.event.ItemListener;
 import java.sql.*;
 import java.text.NumberFormat;
 import java.util.Vector;

 public class Ex1_SwingDbStudent extends JFrame{

     DbConnection db = new DbConnection();
     JTable table;
     DefaultTableModel tableModel;
     JTextField tfName, tfJava, tfHtml, tfSpring;
     JButton btnAdd, btnDel;
     JComboBox<String> cbResult;
     int order = 1;

     public Ex1_SwingDbStudent(String title) {
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

         p1.add(new JLabel(("이름")));
         tfName = new JTextField(5);
         p1.add(tfName);

         p1.add(new JLabel(("java")));
         tfJava = new JTextField(5);
         p1.add(tfJava);

         p1.add(new JLabel(("html")));
         tfHtml = new JTextField(5);
         p1.add(tfHtml);

         p1.add(new JLabel(("spring")));
         tfSpring = new JTextField(5);
         p1.add(tfSpring);

         this.add("North", p1);
         String [] title = {"시퀀스", "이름", "java", "html", "spring", "총점", "평균"};
         tableModel = new DefaultTableModel(title, 0);
         table = new JTable(tableModel);
         this.add("Center", new JScrollPane(table));


         JPanel p2 = new JPanel();
         btnAdd = new JButton("추가");
         btnDel = new JButton("삭제");
         p2.add(btnAdd);
         p2.add(btnDel);

         String [] cb = {"추가순", "이름순", "총점 높은순", "총점 낮은순"};
         cbResult = new JComboBox<String>(cb);
         p2.add(new JLabel("출력순서"));
         p2.add(cbResult);
         this.add("South", p2);

         // 콤보박스 이벤트
         cbResult.addItemListener(new ItemListener() {
             @Override
             public void itemStateChanged(ItemEvent e) {
                 order = cbResult.getSelectedIndex()+1;
                 writeStudent();
             }
         });

         // 추가 버튼 이벤트
         btnAdd.addActionListener(new ActionListener() {
             @Override
             public void actionPerformed(ActionEvent e) {
                 // 입력 안했을경우 이벤트 종료
                 if(tfName.getText().length()==0)
                     return;
                 if(tfJava.getText().length()==0)
                     return;
                 if(tfHtml.getText().length()==0)
                     return;
                 if(tfSpring.getText().length()==0)
                     return;

                 // 입력 값을 db에 insert

                 Connection conn = db.getConnection();
                 PreparedStatement pstmt = null;
                 String sql = "insert into student values (null, ?, ?, ?, ?, now())";

                 try {
                     pstmt = conn.prepareStatement(sql);
                     // ? 갯수 만큼 바인딩
                     pstmt.setString(1, tfName.getText());
                     pstmt.setInt(2, Integer.parseInt(tfJava.getText()));
                     pstmt.setInt(3, Integer.parseInt(tfHtml.getText()));
                     pstmt.setInt(4, Integer.parseInt(tfSpring.getText()));

                     // 실행
                     pstmt.execute();

                     // 입력값 초기화
                     tfName.setText("");
                     tfJava.setText("");
                     tfHtml.setText("");
                     tfSpring.setText("");

                     // 다시 출력
                     writeStudent();

                     // System.out.println(tfName + "님의 정보 추가됨");
                 } catch (SQLException ex) {
                     ex.printStackTrace();
                 } finally {
                     db.dbClose(pstmt, conn);
                 }

             }
         });


         btnDel.addActionListener(new ActionListener() {
             @Override
             public void actionPerformed(ActionEvent e) {
                 int row = table.getSelectedRow();
                 if (row == -1) {
                     JOptionPane.showMessageDialog(Ex1_SwingDbStudent.this, "삭제할 행을 선택해주세요");
                     return;
                 }
                 // row 행의 0번째에 있는 시퀀스 값을 얻는다 getValueAt
                 String num = table.getValueAt(row, 0).toString();

                 // 그 시퀀스에 해당하는 db 데이터 삭제하는 sql문
                 String sql = "delete from student where num = ?";

                 // Connection, PreparedStatement 생성 후 sql 문 실행
                 Connection conn = db.getConnection();
                 PreparedStatement pstmt = null;

                 try {
                     pstmt = conn.prepareStatement(sql);
                     pstmt.setString(1,num);
                     pstmt.execute(); // 디비에서 삭제

                     // db 다시 불러오기
                     writeStudent();

                 } catch (SQLException ex) {
                     ex.printStackTrace();
                 } finally {
                     db.dbClose(pstmt, conn);
                 }


             }
         });

         // 출력 메서드 호출
         writeStudent();
     }

     // 출력 메서드
     public void writeStudent() {
         Connection conn = db.getConnection();
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         String sql = "";

         if(order == 1)
             sql = "select *, java+html+spring tot from student order by num asc";
         else  if(order == 2)
             sql = "select *, java+html+spring tot from student order by name asc";
         else if(order ==3)
             sql = "select *, java+html+spring tot from student order by tot desc";
         else if(order == 4)
             sql = "select *, java+html+spring tot from student order by tot asc";

         try {
             pstmt = conn.prepareStatement(sql);
             rs = pstmt.executeQuery();

             // 기존 테이블의 데이터 지운 후 추가
             tableModel.setRowCount(0);

             while (rs.next()) {
                 Vector<String> data = new Vector<String>();
                 data.add(rs.getString("num"));
                 data.add(rs.getString("name"));
                 data.add(rs.getString("java"));
                 data.add(rs.getString("html"));
                 data.add(rs.getString("spring"));
                 data.add(rs.getString("tot"));

                 // avg
                 NumberFormat nf = NumberFormat.getInstance();
                 nf.setMaximumFractionDigits(2); // 소숫점 2자리
                 double avg = rs.getInt("tot")/3.0;

                 data.add(String.valueOf(nf.format(avg)));

                 // table에 추가
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

         Ex1_SwingDbStudent a = new Ex1_SwingDbStudent("학생관리 DB");


     }

 }
