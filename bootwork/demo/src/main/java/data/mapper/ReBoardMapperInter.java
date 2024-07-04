package data.mapper;

import data.dto.ReBoardDto;
import org.apache.ibatis.annotations.Mapper;

import javax.swing.plaf.PanelUI;
import java.util.List;
import java.util.Map;

@Mapper
public interface ReBoardMapperInter {
    public int getMaxNum();
    public void updateRestep(Map<String, Integer> map); // regroup, restep이 들어잇어야 함
    public void insertBoard(ReBoardDto dto);
    public int getTotalCount();
    public List<ReBoardDto> getPagingList(Map<String, Integer> map); // start, perpage
    public void updateReadCount(int num);
    public ReBoardDto getData(int num);
    public void updateBoard(ReBoardDto dto);
    public void deleteBoard(int num);

}
