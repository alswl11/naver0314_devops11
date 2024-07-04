package member.controller;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import member.dto.MemberDto;
import org.springframework.stereotype.Controller;

import member.service.MemberService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@Controller
public class MemberUpdateController {

    @NonNull
    private MemberService memberService;

    //수정폼-이름,핸드폰,이메일,주소,생년월일 만 폼에 나타나도록
    @GetMapping("/member/updateform")
    public String updateForm(@RequestParam int num, Model model) {

        //db로 부터 dto 얻기
        MemberDto dto = memberService.getData(num);
//        model.addAttribute("dto", memberService.getData(num));
        model.addAttribute("dto", dto);
        return "member/updateform";

    }

    //수정후 디테일 페이지로 이동
    @PostMapping("/member/update")
    public String update(@ModelAttribute MemberDto dto) {
        // 수정
        memberService.updateMember(dto);
        return "redirect:./detail?num=" + dto.getNum();
    }

    // {"status", "success" or "fail"}
    @ResponseBody
    @GetMapping("/member/delete")
    public Map<String, String> delete(@RequestParam int num, @RequestParam String passwd) {
        Map<String, String> map = new HashMap<String, String>();

        // 비번이 맞을경우 데이터 삭제
        boolean b = memberService.isEqualPassCheck(num, passwd);
        if (b) {
             memberService.deleteMember(num);
        }
        map.put("status", b?"success":"fail");
        return map;
    }

}

