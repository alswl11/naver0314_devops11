package anno.study.ex4;

import org.springframework.stereotype.Component;

@Component  // koreaTire
public class KoreaTire implements Tire { 
	@Override
	public String getTireName() {
		// TODO Auto-generated method stub
		return "한국타이어";
	}

}
