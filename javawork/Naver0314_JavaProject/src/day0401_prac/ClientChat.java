package day0401_prac;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

public class ClientChat extends JFrame implements Runnable {

    JButton btnConnect, btnSend;
    JLabel age, lblMessage;
    JTextArea area;
    JTextField tfMessage;
    BufferedReader br;
    PrintWriter pw;
    String nickName;
    Socket socket;

    public ClientChat(String title) {
        super(title);
        this.setLocation(100,100); // 시작위치
        this.setSize(500,500);
        this.getContentPane().setBackground(Color.LIGHT_GRAY);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 프레임 종료
        this.initDesign();
        this.setVisible(true);
    }

    public void initDesign() {
        this.setLayout(null); // 기본 레이아웃 없애고 직접 좌표
        btnConnect = new JButton("서버 접속");
        btnConnect.setBounds(50,10,150,30);
        this.add(btnConnect);

        lblMessage = new JLabel("접속 여부 : 접속 안함");
        lblMessage.setBounds(220,10,150,30);
        this.add(lblMessage);

        area = new JTextArea();
        area.setBounds(10,140,400,400);
        JScrollPane pane = new JScrollPane(area);
        pane.setBounds(10,50,450,350);
        this.add(pane);

        tfMessage = new JTextField(30);
        tfMessage.setBounds(10,410,350,30);
        this.add(tfMessage);

        btnSend = new JButton("전송");
        btnSend.setBounds(370,410,100,30);
        this.add(btnSend);


        btnConnect.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String serverIp = JOptionPane.showInputDialog("접속할 서버 아이피를 입력하세요 : ","192.168.0.59");
                nickName = JOptionPane.showInputDialog("접속할 닉네임을 입력하세요", "박민지");

                try {
                    socket = new Socket(serverIp, 6000);
                    System.out.println("서버 접속 성공");

                    // io class
                    br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                    pw = new PrintWriter(socket.getOutputStream());

                    // 창 제목 닉네임으로 변경
                    ClientChat.this.setTitle(nickName + "님의 채팅창");

                    // 메세지 변경
                    lblMessage.setText("서버 접속 중 ..." + nickName);

                    // thread 시작
                    Thread th = new Thread(ClientChat.this);
                    th.start();

                    // 서버로 "1| 닉네임 형태로 보내기
                    pw.write("1| " + nickName + "\n");
                    pw.flush();

                } catch (IOException ex) {
                    System.out.println("서버 접속 오류 : " + ex.getMessage());
                }

            }
        });

    }

    public void actionPerformed(ActionEvent e) {
        Object ob = e.getSource();

        if(ob == tfMessage || ob == btnConnect) {
            pw.write("2|"+tfMessage.getText() + "\n");
            pw.flush();

            tfMessage.setText("");
            tfMessage.requestFocus();
        }
    }

    public static void main(String[] args) {

        ClientChat c = new ClientChat("client");

    }


    @Override
    public void run() {
        System.out.println("Client Run");

        // 서버가 보내는 메세지 항상 대기하고 있다가 바로 받아서 채팅창에 출력
        while(true) {
            try {
                String msg = br.readLine();
                area.append(msg + "\n");
                this.autoScroll();
            }catch (IOException e) {
                e.printStackTrace();
            }
        }
    }



    private void autoScroll() {
        int n = area.getDocument().getLength();
        area.setCaretPosition(n);
    }
}
