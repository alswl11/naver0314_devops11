package day0520.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class FoodDto {
	private String foodname;
	private String foodphoto;
	private int price;
	private int cnt;
}
