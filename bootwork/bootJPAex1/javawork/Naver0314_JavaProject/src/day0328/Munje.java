package day0328;

import java.awt.Canvas;
import java.awt.Color;
import java.awt.FileDialog;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class Munje extends JFrame{

	JButton btnOpen;

	String PHOTO = "/Users/parkminji/Documents/naver_0314/workall/image/food/12.jpg";
	int photoIndext = 1;

	MyDraw draw = new MyDraw(); // 캔버스 내부 클래스 

	public Munje(String title) {
		super(title);
		this.setLocation(100, 100); // 시작 위치 
		this.setSize(400, 500); // 창 크기 
		this.getContentPane().setBackground(new Color(138, 199, 119)); // 패널.setback 해야 됨 / 배경생 변경 
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 프레임 종료 만 시켜줌 
		this.initDesign(); // 각종 컴포넌트 생성 
		this.setVisible(true); 
	}

	// 캔버스를 상속받는 내부 클래스  
	class MyDraw extends Canvas {
		@Override
		public void paint(Graphics g) {
			super.paint(g);

			Image image = new ImageIcon(PHOTO).getImage();
			g.drawImage(image, 50, 80, 300, 300, this);
		}

	}

	public void initDesign() {

		JPanel p = new JPanel();
		btnOpen = new JButton("사진 불러오기");
		p.add(btnOpen);

		this.add("North", p);


		// 캔버스는 center 배치
		this.add("Center", draw);

		// 버튼 이벤트 
		btnOpen.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				FileDialog dlg = new FileDialog(Munje.this, "이미지 불러오기", FileDialog.LOAD);
				dlg.setVisible(true);
				if(dlg.getFile() == null ) {
					return ; // 취소 클릭 시 메서드 종료 
				}
				// 불러올 경로와 파일명 
				PHOTO = dlg.getDirectory()+dlg.getFile();
				draw.repaint();
			}
		});
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Munje a = new Munje("사진 불러오기");
	}

}
