package day0328;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class Ex4_SwingButton extends JFrame{

	JButton btn1, btn2;
	JButton [] btnArray = new JButton[6]; // 각 배열의 값은 null로 되어잇음 
	String [] btnLable = {"green", "red", "pink", "orange", "yellow", "randomColor"};


	public Ex4_SwingButton(String title) {
		super(title);
		this.setLocation(100, 100); // 시작 위치 
		this.setSize(300, 300); // 창 크기 
		this.getContentPane().setBackground(new Color(138, 199, 119)); // 패널.setback 해야 됨 / 배경생 변경 
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 프레임 종료 만 시켜줌 
		this.initDesign(); // 각종 컴포넌트 생성 
		this.setVisible(true); 
	}

	public void initDesign() {

		this.setLayout(null); // 기본 레이아웃 없애기 
		// 버튼1 생성 
		btn1 = new JButton("Hello");
		// frame에 추가 
		btn1.setBounds(10, 10, 100, 30); // x, y, w, h
		this.add(btn1);

		// btn1에 이벤트 추가 (1. 익명 내부 클래스 형태로 이벤트 구현)
		btn1.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				JOptionPane.showMessageDialog(Ex4_SwingButton.this , "버튼1을 눌렀어요");
			}
		});

		// btn2 생성 후 프레임 추가해보세요 
		btn2 = new JButton("집 갈 래 ");
		btn2.setBounds(130, 10, 100, 30);
		this.add(btn2);
		btn2.addActionListener(new Button2Event());

		// 이렇게 해도 되지만 
		//		btn2.addActionListener(new ActionListener() {
		//			
		//			@Override
		//			public void actionPerformed(ActionEvent e) {
		//				// TODO Auto-generated method stub
		//				JOptionPane.showMessageDialog(Ex4_SwingButton.this, "밥부터 먹자 ");
		//			}
		//		});

		// btnArray 배열 변수를 생성 후 프레임에 추가 
		int yPos = 50;
		for(int i =0; i<btnArray.length; i++) {
			btnArray[i] = new JButton(btnLable[i]);
			btnArray[i].setBounds(10, yPos, 100, 30); 
			this.add(btnArray[i]);
			yPos += 35;


			// 익명 내부 클래스 형태로 이벤트 구현 
			btnArray[i].addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent e) {
					// TODO Auto-generated method stub
					// Object ob = e.getSource(); // 이벤트가 발생한 오브젝트 
					JButton ob = (JButton)e.getSource();
					System.out.println(ob.getText()); 

					switch (ob.getText()) {
					case "red": 
						Ex4_SwingButton.this.getContentPane().setBackground(Color.red);
						break;
					case "green" :
						Ex4_SwingButton.this.getContentPane().setBackground(Color.green);
						break;
					case "pink" : 
						Ex4_SwingButton.this.getContentPane().setBackground(Color.pink);
						break;
					case "orange" :
						Ex4_SwingButton.this.getContentPane().setBackground(Color.orange);
						break;
					case "yellow" :
						Ex4_SwingButton.this.getContentPane().setBackground(Color.yellow);
						break;
					case "randomColor" :
						// 0~255의 임의의 숫자 r,g,b를 구한 후 new Color 생성자를 통해서 변경 
					{
						int r = (int)(Math.random()*256);
						int g = (int)(Math.random()*256);
						int b = (int)(Math.random()*256);
						Ex4_SwingButton.this.getContentPane().setBackground(new Color(r,g,b));
					}
					break;

					}
				}


			});
		}
	}

	// 새로운 방법 
	class Button2Event implements ActionListener {

		@Override
		public void actionPerformed(ActionEvent e) {
			// TODO Auto-generated method stub
			JOptionPane.showMessageDialog(Ex4_SwingButton.this, "밥부터 먹자 ");
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Ex4_SwingButton a = new Ex4_SwingButton("스윙버튼 ");
	}

}
