package study.ex3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex3Main {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("appex3.xml");
		
		MyCart myCart = (MyCart)context.getBean("mycart");
		myCart.showInfo();
		
		MyCart myCart2 = (MyCart)context.getBean("mycart");
		myCart2.showInfo();
		
		System.out.println("\nsingleton인 경우는 여러번 생성해도 주소가 같고 "
				+ "\nprototype인 경우는 새로 생성할 때마다 새로운 주소에 생성된다 \n");
		
		System.out.println(myCart.hashCode());
		System.out.println(myCart2.hashCode()); // 주소 출력  
	}

}
