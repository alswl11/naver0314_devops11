package anno.study.ex6;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor // ???
@Component
public class ShopDto {
		
	@NonNull
	private String sang;
	@NonNull
	private int su;
	@NonNull
	private int dan;
	

}
