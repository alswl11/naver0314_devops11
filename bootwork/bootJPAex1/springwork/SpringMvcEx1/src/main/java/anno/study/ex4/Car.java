package anno.study.ex4;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;

// #1 xml 방식

//public class Car {
//	private String carName;
//	private Tire tire;
//	
//	public Car(Tire tire) {
//		this.tire = tire;
//	}
//	public void setCarName(String carName) {
//		this.carName = carName;
//	}
//	
//	public void carInfo() {
//		System.out.println("자동차명 : "+ carName);
//		System.out.println("타이어 : " + tire.getTireName());
//	}
//
//}


// #2 annotation으로 수정 

//@Component // car
//public class Car {
//	@Value("아우디")
//	private String carName;
//	
//	@Autowired // 자동으로 찾아서 주입해줌, 이번에는 Tire를 구현한 class가 2개이므로 모호성으로 인해 오류 발생 
//	// private Tire tire;
//	private KoreaTire tire;
//	
//	
//	public void carInfo() {
//		System.out.println("자동차명 : "+ carName);
//		System.out.println("타이어 : " + tire.getTireName());
//	}
//
//}

// #3 tire를 lombok을 이용해서 주입해보자
@Component // car
@RequiredArgsConstructor // nonnull이붙은것만 생성자로 주입됨 

public class Car {
	@Value("아우디")
	private String carName;
	
	@NonNull
	private CanadaTire tire;

	public void carInfo() {
		System.out.println("자동차명 : "+ carName);
		System.out.println("타이어 : " + tire.getTireName());
	}

}
