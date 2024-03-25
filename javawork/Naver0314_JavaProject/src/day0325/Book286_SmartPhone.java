package day0325;

public class Book286_SmartPhone extends Book286_Phone{

	public boolean wifi;
	
	public Book286_SmartPhone(String model, String color) {
		this.medel = model;
		this.color = color;
	}
	
	public void setWifi(boolean wifi) {
		this.wifi = wifi;
		System.out.println("와이파이 상태를 변경했습니다.");
	}
	
	public void internet() {
		System.out.println("인터넷에 연결합니다.");
	}
}
