package com.hobbyfield.app.createclub.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobbyfield.app.createclub.service.CreateclubService;
import com.hobbyfield.app.createclub.service.CreateclubVO;


@Controller
public class CreateclubController {
	private static final Logger logger = LoggerFactory.getLogger(CreateclubController.class);
	
	@Autowired
	CreateclubService createclubService;
	
	//소모임 전체조회
	@GetMapping("clubList")
	public String clubList(Model model) {
		model.addAttribute("clubList", createclubService.getCreateClubList());
		return "club/clubList";
	}
	
	//소모임 세부조회
	
	
	//소모임 등록 페이지
	@GetMapping("insertClub")
	public String clubInsertForm() {
		return "club/insertClub";
	}
	
	//소모임 등록 처리
	@PostMapping("insertClub")
	public String clubInsertProcess(CreateclubVO createclubVO) {
		createclubService.insertClubInfo(createclubVO);
		return "redirect:clubList";
	}
	
	//닉네임 중복체크
	@RequestMapping(value = "nickChk", method = RequestMethod.POST)
	@ResponseBody
	public String nickChkPOST(String profileNickname) throws Exception{
		
		logger.info("nickChk() 확인");
	
		int result = createclubService.nickChk(profileNickname);
		System.out.println(result);
		
		logger.info("결과값 = " + result);
		
		if(result != 0) {
			
			return "fail";	// 중복 닉네임 존재
			
		} else {
			
			return "success";	// 중복 닉네임 없음
			
		}	
	}
	
	//소모임 이름 중복체크
	
	
	//소모임 수정
	
	//소모임 삭제?
}
