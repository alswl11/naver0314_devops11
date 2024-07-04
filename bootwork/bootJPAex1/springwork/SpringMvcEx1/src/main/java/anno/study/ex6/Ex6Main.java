package anno.study.ex6;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex6Main {
	
	public static void main(String[] args) {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("appex6.xml");
		
		ShopController shopCont= (ShopController)context.getBean("shopcont");
		shopCont.insert("청바지", 2, 25000);
		System.out.println("-".repeat(30));
		
		shopCont.delete("청바지");
		System.out.println("-".repeat(30));
		shopCont.update("자켓", 1, 120000);
	}
	


}
