package data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
@Alias("ReBoardDto")
public class ReBoardDto {
    private int num;
    private String writer;
    private String myid;
    private String subject;
    private String uploadphoto;
    private String content;
    private int readcount;
    private int regroup;
    private int restep;
    private int relevel;
    private Timestamp writeday;
    private int recount; // 댓글의 갯수

}
