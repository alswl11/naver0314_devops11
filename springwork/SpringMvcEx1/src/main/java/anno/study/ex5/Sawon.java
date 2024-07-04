package anno.study.ex5;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.NonNull;

@Component 
@Getter
public class Sawon {
	@Value("박민지")
	private String name;
	@Value("오산시")
	private String addr;
	@Value("24")
	private int age;
	
}
