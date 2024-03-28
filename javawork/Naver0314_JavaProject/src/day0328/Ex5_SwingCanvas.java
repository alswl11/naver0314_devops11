package day0328;

import java.awt.Canvas;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;

import javax.swing.ImageIcon;
import javax.swing.JFrame;

public class Ex5_SwingCanvas extends JFrame{

	// 캔버스 변수 선언 
	MyDraw draw = new MyDraw();
	
	String foodImage = "/Users/parkminji/Documents/naver_0314/workall/image/food/6.jpg";
	String foodImage2 = "/Users/parkminji/Documents/naver_0314/workall/image/food/5.jpg";


	public Ex5_SwingCanvas(String title) {
		super(title);
		this.setLocation(100, 100); // 시작 위치 
		this.setSize(500, 500); // 창 크기 
		//this.getContentPane().setBackground(new Color(138, 199, 119)); // 패널.setback 해야 됨 / 배경생 변경 
		//this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 프레임 종료 만 시켜줌 
		this.initDesign(); // 각종 컴포넌트 생성 
		this.setVisible(true); 
	}

	// 캔버스를 상속받는 내부 클래스 
	class MyDraw extends Canvas{
		// 처음 시작 시, 그리고 프레임 크기 변경 시에 자동 호출됨 
		// 그 외에는 강제호출 (repaint)
		@Override
		public void paint(Graphics g) {
			super.paint(g);
			
			// 색상 변경 
			g.setColor(Color.magenta);
			// 타원 그리기 (테두리만 나옴)
			g.drawOval(30, 30, 100, 100);
			// 채워진 타원 
			g.setColor(Color.orange);
			g.fillOval(150, 30, 100, 100);
			
			// 테둘리만 잇는 사각형
			g.setColor(new Color(8,207,7));
			g.drawRect(30, 150,  100, 100);
			
			// 채워진 사각형 
			g.setColor(new Color(239,136,190));
			g.fillRect(150, 150, 100, 100);
			
			// 글꼴 출력
			g.setFont(new Font("Comic Sans MS", Font.BOLD, 30));
			g.drawString("Good day!!",50, 350);
			
			g.setFont(new Font("궁서체", Font.BOLD, 30));
			g.drawString("안녕하세요 !!", 250, 350);
			
			
			// 음식 이미지 그리기 방법 # 1
			Image image1 = new ImageIcon(foodImage).getImage();
			g.drawImage(image1, 300, 20, 130, 130, this);
			
			// 음식 이미지 그리기 방법 # 2
			Image image2 = Toolkit.getDefaultToolkit().getImage(foodImage2);
			g.drawImage(image2, 300, 160, 130, 130, this);			
		}
	}

	public void initDesign() {
		this.add("Center", draw);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Ex5_SwingCanvas a = new Ex5_SwingCanvas("캔버스");
	}

}
