package day0325;

class Animal {
	public void writeAnimal() {
		System.out.println("Animal 부모 클래스 !! ");
	}
}

class Cat extends Animal {
	@Override
	public void writeAnimal() {
		// TODO Auto-generated method stub
		super.writeAnimal();
		System.out.println("나는 야옹!! 고양이입니다");
	}
	
	public void play() {
		System.out.println("야옹 야옹 야옹 !! ");
	}
}

class Dog extends Animal{
	@Override
	public void writeAnimal() {
		// TODO Auto-generated method stub
		super.writeAnimal();
		System.out.println("나는 멍멍!! 강아지입니다");
	}
	
	public void play() {
		System.out.println("멍멍멍!! ");
	}
}
public class Ex9_Inheri {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Animal an = new Animal();
		an.writeAnimal();
		System.out.println();
		
		Cat c = new Cat();
		c.play();
		c.writeAnimal();
		System.out.println();
		
		Dog d = new Dog();
		d.writeAnimal();
		d.play();
		
		System.out.println("===========");
		// 부모 클래스로 선언 + 자식 클래스로 생성 == 다형성 
		// 오버라이드 메서드에서만 호출이 가능하다 
		// writeAnimal은 호출 가는하지만 
		// play는 호출 불가능!
		
		Animal ani = new Animal();
		// 파라미터 받는 변수가 하나만 있으면 된다!
		// ani 하나로 Cat, Dog 둘 다 사용함 
		
		ani = new Cat();
		ani.writeAnimal();
		
		ani = new Dog();
		ani.writeAnimal();

	}

}
