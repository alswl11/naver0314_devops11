package day0326;

abstract class Hello {
	abstract public void study();
}

interface Happy {
	public void insert();
	public void delete();
}

class Kiwi {
	
	// 익명 내부 클래스 형태 
	Hello h = new Hello() {
		
		@Override
		public void study() {
			// TODO Auto-generated method stub
			System.out.println("익명 내부 클래스에 대해서 공부중");
		}
	};
	
	Happy ha = new Happy() {
		
		@Override
		public void insert() {
			// TODO Auto-generated method stub
			System.out.println("데이터를 추가 합니다 ");
		}
		
		@Override
		public void delete() {
			// TODO Auto-generated method stub
			System.out.println("데이터를 삭제 합니다 ");
		}
	};
}
public class Ex10_AnomyInner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Kiwi k = new Kiwi();
		k.h.study();
		
		k.ha.delete();
		k.ha.insert();
	}

}
