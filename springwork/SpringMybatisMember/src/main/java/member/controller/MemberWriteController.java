package member.controller;

import member.dto.MemberDto;
import member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/member")
public class MemberWriteController {

    @Autowired
    private MemberService memberService;
    @GetMapping("/form")
    public  String form() {
        return "member/writeform";
    }

    // 반환타입이 json 형태로 {"count" : 0} 일케 나와야 하나봄
    @ResponseBody
    @GetMapping("/idcheck")
    public Map<String, Integer> searchId(@RequestParam String searchid) {
        Map<String, Integer> map = new HashMap<>();

        // db에 해당 아이디 있는지 체크 (0: 잇음  / 1: 없음)
        int count = memberService.getSearchId(searchid);
        map.put("count", count);
        return  map;
    }

    @PostMapping("/insert")
    public String insert(@ModelAttribute MemberDto dto, @RequestParam("myfile")MultipartFile myfile, HttpServletRequest request){

        // 업로드경로 구하기
        String uploadPath = request.getSession().getServletContext().getRealPath("/resources");
        System.out.println(uploadPath);

        // 업로드된 파일명을 dto의 photo에 저장
        String photo = myfile.getOriginalFilename();
        dto.setPhoto(photo);

        // 업로드
        try {
            myfile.transferTo(new File(uploadPath + "/" + photo));
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }

        // db에 insert
        memberService.insertMember(dto);
        
        return "redirect:./list";
    }
}
