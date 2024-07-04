package anno.study.ex5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

public class Ex5Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext context = new ClassPathXmlApplicationContext("appex5.xml");

		Emp emp = (Emp)context.getBean("emp"); 
		emp.sawonInfo();
		
	}

}
