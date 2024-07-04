package day0520.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class Form2WriteController {
	
	@PostMapping("/read2")
	public String read2(String name, String addr, int age, Model model) { 
		// 폼태그의 name과 같은 변수로 읽어올 경우 @RequestParma 생략 
		
		
		model.addAttribute("name", name);
		model.addAttribute("addr", addr);
		model.addAttribute("age", age);
		
		return "form2/result2";
		
	}

}
