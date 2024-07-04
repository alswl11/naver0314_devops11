package study.ex1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex1Main {

	   public static void main(String[] args) {
	      // TODO Auto-generated method stub
	      System.out.println("기존의 자바방식으로 호출 #1");
	      MessageInter m=null;
	      m=new Message1();
	      String s=m.sayHello("이영자");
	      System.out.println(s);
	      
	      m=new Message2();
	      s=m.sayHello("강호동");
	      System.out.println(s);
	      
	      System.out.println("\n스프링 방식으로 호출 #2");
	      ApplicationContext context = new ClassPathXmlApplicationContext("appex1.xml");
	      
	      MessageInter m1 = (MessageInter) context.getBean("mes1"); // 반환타입이 object 이므로 형변환 해야 함 
	      s = m1.sayHello("캔디");
	      System.out.println(s);
	      
	      m1 = context.getBean("mes2", Message2.class);
	      s = m1.sayHello("마이클");
	      System.out.println(s);
	      
	     
	   }
	}
