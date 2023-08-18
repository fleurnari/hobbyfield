package com.hobbyfield.app.club.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobbyfield.app.club.service.ClubVO;
import com.hobbyfield.app.club.service.ClubService;



@Controller
public class ClubController {
	private static final Logger logger = LoggerFactory.getLogger(ClubController.class);
	
	@Autowired

	ClubService createclubService;
	
	//소모임 전체조회
	@GetMapping("clubList")
	public String clubList(Model model) {
		model.addAttribute("clubList", createclubService.getCreateClubList());
		return "club/clubList";
	}
	
	//소모임 세부조회
	
	
	//소모임 등록 페이지

	@GetMapping("/insertClub")
	public String clubInsertForm() {
		return "club/insertClub";
	}
	
	//소모임 등록 처리

	@PostMapping("insertClub")
	public String clubInsertProcess(ClubVO createclubVO) {
		createclubService.insertClubInfo(createclubVO);
		return "redirect:clubList";
	}
	
	//닉네임 중복체크

	/* @RequestMapping(value = "nickChk", method = RequestMethod.POST) */
	@ResponseBody
	@PostMapping("/nickChk")
	public String nickChkPOST(String profileNickname){
	
		int result = createclubService.nickChk(profileNickname);

		if(result != 0) {
			
			return "fail";	// 중복 닉네임 존재
			
		} else {
			
			return "success";	// 중복 닉네임 없음
			
		}	
	}
	
	//소모임 이름 중복체크

	@ResponseBody
	@PostMapping("/clubnameChk")
	public String clubnameChkPOST(String clubName) {
		
		int result = createclubService.clubnameChk(clubName);
		
		if(result !=0) {
			
			return "fail"; //중복 모임 이름 존재
					
		} else {
			
			return "success";  //중복 모임 이름 없음
		}
	}
	
	//소모임 수정
	
	
	//소모임 삭제?
	
	
	//프로필 이미지 등록
	@GetMapping("/profileImg")
	public String img() {
		return "club/profileImg";
	}
		
	//프로필 이미지 등록 과정
	@PostMapping("/profileImg")
	public String ImgProcess(CreateclubVO createclubVO) {
		createclubService.insertClubInfo(createclubVO);
		return "redirect:clubList";
	}
	
	//프로필 이미지 수정
  
	
	//소모임 게시글 생성 
	@GetMapping("clubBoardInsert")
	public String clubBoardInsertForm() {
		return "club/clubBoardInsert";
	}
	

	// 이미지 테스트
	@GetMapping("TESTIMG")
	public String TestImg() {
		return "club/TESTIMG";
	}

}
