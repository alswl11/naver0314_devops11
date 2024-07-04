package day0520.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import day0520.dto.FoodDto;

@Controller
public class Form3WriteController {
	
	@PostMapping("/read3")
	public String read3 (
			/*dto클래스명이 너무 긴경우 간단하게 모델에 저장*/
			@ModelAttribute("fdto") FoodDto dto 
			) {
		
		return "form3/result3";
	}

}
