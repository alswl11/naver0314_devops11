package study.ex1;

public class Message1 implements MessageInter {
	   @Override
	   public String sayHello(String name) {
	      return "안녕하세요"+name+"님!";
	   }
	}
