package day0401_prac;

import javax.naming.ldap.SortKey;
import javax.swing.*;
import java.awt.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Vector;

public class ServerChat extends JFrame implements Runnable {

    ServerSocket serverSocket;
    JTextArea area;
    Vector<ClientMem> list = new Vector<ServerChat.ClientMem>();


    public ServerChat(String title) {
        super(title);
        this.setLocation(100,100);
        this.setSize(500,100);
        this.getContentPane().setBackground(Color.LIGHT_GRAY);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.initDesign();
        this.setVisible(true);
    }


    class ClientMem extends Thread {

        Socket mySocket;


    }
    public void initDesign() {

        area = new JTextArea();
        this.add(new JScrollPane(area));
    }

    public static void main(String[] args) {
        ServerChat s = new ServerChat("채팅서버");
        Thread th = new Thread(s);
    }

    @Override
    public void run() {

        // client가 보내는 메세지를 언제든지 읽어서 보내줄 수 있어야 함
    }
}
