package day0326;


interface Tire {
	void roll();
}

class HankookTire implements Tire {
	@Override
	public void roll() {
		// TODO Auto-generated method stub
		System.out.println("한국타이어 굴러갑니다");
	}
}

class KumhoTire implements Tire {
	@Override
	public void roll() {
		// TODO Auto-generated method stub
		System.out.println("금호타이어 굴러갑니다");
	}
}

class Care {
	Tire tire1 = new HankookTire();
	Tire tire2 = new KumhoTire();
	
	void run() {
		
	}
			
}
public class Ex8_Book376 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
