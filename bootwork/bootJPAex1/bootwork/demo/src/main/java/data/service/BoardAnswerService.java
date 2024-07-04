package data.service;

import data.dto.BoardAnswerDto;
import data.mapper.BoardAnswerMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardAnswerService {
    @Autowired
    private BoardAnswerMapperInter anInter;

    public void insertAnswer(BoardAnswerDto dto) {
        anInter.insertAnswer(dto);
    }
    public List<BoardAnswerDto> getAnswerData(int num) {
        return anInter.getAnswerData(num);
    }
    public void deleteAnswer(int aidx) {
        anInter.deleteAnswer(aidx);
    }

}
