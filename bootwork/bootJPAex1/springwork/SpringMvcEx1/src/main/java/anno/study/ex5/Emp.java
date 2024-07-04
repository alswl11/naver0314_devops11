package anno.study.ex5;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class Emp {
	@NonNull
	private Sawon sawon;
	@Value("네이버클라우드")
	private String empName;
	@Value("2024-05-17")
	private String ipsaday;
	
	public void sawonInfo() {
		System.out.println(" ** 사원 정보 ** ");
		System.out.println("입사일 : " + ipsaday);
		System.out.println("회사명 : " + empName);
		System.out.println("사원명 : " + sawon.getName());
		System.out.println("주 소 : " + sawon.getAddr());
		System.out.println("나 이 : " + sawon.getAge());
		
	}

}
