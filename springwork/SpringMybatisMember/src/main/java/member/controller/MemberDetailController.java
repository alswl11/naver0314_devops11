package member.controller;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import member.dto.MemberDto;
import member.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class MemberDetailController {
    @NonNull
    private MemberService memberService;

    @GetMapping("/member/detail")
    public String detail(@RequestParam int num, Model model){
        MemberDto dto=memberService.getData(num);
        model.addAttribute("dto",dto);

        return "member/detailpage";
    }

    @ResponseBody //기본으로 이걸 써야 json형식으로 반환
    @PostMapping("/member/upload")
    public Map<String, String> uploadPhoto(
            @RequestParam("upload")MultipartFile upload, //실제 업로드ㄴ 파일명이 들어가고
            @RequestParam int num,
            HttpServletRequest request
    ){
        //업로드할 경로 구하기
        String uploadPath=request.getSession().getServletContext().getRealPath("/resources");
        System.out.println(uploadPath);

        String photo=upload.getOriginalFilename();
        //업로드
        try {
            upload.transferTo(new File(uploadPath+"/"+photo));
        } catch (IllegalStateException|IOException e) {
            e.printStackTrace();
        }

        //db에서 사진 변경
        memberService.updatePhoto(num,photo);

        Map<String, String> map=new HashMap<>();
        System.out.println("num="+num); //num 콘솔로 확인

        map.put("photoname", photo); //들어갈 땐 그 파일명이 photoname에 들어간다
        return map;
    }
}
