package data.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@NoArgsConstructor
@Data
@Alias("GuestPhotoDto")
public class GuestPhotoDto {
    private int photoidx;
    private int guestidx;
    private String photoname;

}
