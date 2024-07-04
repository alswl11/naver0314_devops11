package data.mapper;

import data.dto.BoardAnswerDto;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface BoardAnswerMapperInter {
    @Insert("insert into boardanswer (num, writer, myid, content, writeday) values (#{num}, #{writer}, #{myid}, #{content}, now())")
    public void insertAnswer(BoardAnswerDto dto);
    @Select("select * from boardanswer where num=#{num} order by aidx desc")
    public List<BoardAnswerDto> getAnswerData(int num);
    @Delete("delete from boardanswer where aidx=#{aidx}")
    public void deleteAnswer(int aidx);
}
