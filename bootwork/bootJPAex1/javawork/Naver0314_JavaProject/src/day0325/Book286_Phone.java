package day0325;

public class Book286_Phone {
	
	public String medel;
	public String color;
	
	public void bell() {
		System.out.println("벨이 울립니다. ");
	}
	public void sendVoice(String msg) {
		System.out.println("자기 : " + msg);
	}
	public void receiveVoice(String msg ) {
		System.out.println("상대방 : " + msg);
	}
	public void hangUp() {
		System.out.println("전화를 끊습니다.");
	}

}
