 package day0408;

 import javax.swing.*;
 import java.awt.*;

 public class SwingGibon extends JFrame{

     public SwingGibon(String title) {
         super(title);
         this.setLocation(100, 100); // 시작 위치
         this.setSize(300, 300); // 창 크기
         this.getContentPane().setBackground(new Color(138, 199, 119)); // 패널.setback 해야 됨 / 배경생 변경
 //		this.getContentPane().setBackground(Color.yellow); // 도 됨
         this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 프레임 종료 만 시켜줌
         this.initDesign(); // 각종 컴포넌트 생성
         this.setVisible(true);
     }

     public void initDesign() {

     }

     public static void main(String[] args) {
         // TODO Auto-generated method stub

         SwingGibon a = new SwingGibon("기본창");
     }

 }
