package anno.study.ex4;

import org.springframework.stereotype.Component;

// @Component() // xml에 자동으로 등록해줌, 이 경우는 클래스의 이름이 곧 아이디가 됨 (* 단 첫글자는 소문자로 변경)  
@Component("h") // id = h
public class Hello {
	
	public void showMessage() {
		System.out.println("Hello class가 가진 메소드입니다");
	}

}
