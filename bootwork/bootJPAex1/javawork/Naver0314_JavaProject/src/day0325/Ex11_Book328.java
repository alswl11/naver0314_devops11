package day0325;


abstract class Animal2 {
	public void breath() {
		System.out.println("숨을 쉽니다");
	}
	public abstract void sound();
}


class Dog2 extends Animal2 {
	@Override
	public void sound() {
		// TODO Auto-generated method stub
		System.out.println("멍멍");
	}
}

class Cat2 extends Animal2 {
	@Override
	public void sound() {
		// TODO Auto-generated method stub
		System.out.println("냐옹");
	}
}


public class Ex11_Book328 {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Dog2 dog = new Dog2();
		dog.sound();
		
		Cat2 cat = new Cat2();
		cat.sound();
		
		
		
		
		animalSound(new Dog2());
		animalSound(new Cat2());

	}
	
	public static void animalSound(Animal2 animal) {
		animal.sound();
	}

}
