package day0520.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Form4WriteController {
	@PostMapping("/read4")
	public String read4(@RequestParam Map<String, String> map, Model model) {
		
		model.addAttribute("foodname", map.get("foodname"));
		model.addAttribute("foodphoto", map.get("foodphoto"));
		model.addAttribute("foodprice", map.get("price"));
		model.addAttribute("foodcount", map.get("cnt"));
		
		return "form4/result4";
	}
}
