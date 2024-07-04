package member.controller;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import member.dto.MemberDto;
import member.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/member") // 공통 매핑
@RequiredArgsConstructor
public class MemberListController {
    // @Autowired
    @NonNull
    private MemberService memberService;

    @GetMapping("/list")
    public String list(Model model) {

        int totalCount; // 총 갯수
        // 전체 목록 가져오기
        List<MemberDto> list = memberService.getAllMembers();
        totalCount = memberService.getTotalCount();
        // 모델에다가 저장하고
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("list", list);
        
        // 이곳으로 forward
        return "member/memberlist";
    }

}
