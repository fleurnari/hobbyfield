package com.hobbyfield.app.talent.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hobbyfield.app.talent.service.TalentService;
import com.hobbyfield.app.talent.service.TalentVO;

@Controller
@RequestMapping("talent")
public class TalentController {
	
	@Autowired
	TalentService talentService;
	
	// 재능기부 후기, 카테고리 보이는 페이지
//	@GetMapping("/talentMain")
	
	// 재능기부 카테고리 전체조회
	@GetMapping("/talentList")
	public String getTalentAllList(Model model, TalentVO talentVO) {
		model.addAttribute("talentList", talentService.getTalentAllList());
		
		return "talent/talentList";
	}
	
	// 재능기부 단건조회
	@GetMapping("/talentInfo")
	public String getTalentInfo(TalentVO talentVO, Model model) {
		TalentVO findVO = talentService.getTalentInfo(talentVO);
		//재능기부 조회수
		talentService.updateTlntView(findVO);
		model.addAttribute("talent", findVO);
		return "talent/talentInfo";
	}
	
	// 재능기부 등록 - Form 
	@GetMapping("/talentInsert")
	public String talentInsertForm(TalentVO talentVO) {
		return "talent/talentInsert";
	}
	
	// 재능기부 등록 - Process
	@PostMapping("/talentInsert")
	public String talentInsertProcess(TalentVO talentVO) {
		return "redirect:talentList";
	}
	
	// 재능기부 수정 - Form
	
	// 재능기부 수정 - Process
	
	// 재능기부 삭제
	
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
//	@PostMapping("/talentUpdate")
	
}
