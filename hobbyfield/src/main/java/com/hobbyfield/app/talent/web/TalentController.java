package com.hobbyfield.app.talent.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hobbyfield.app.talent.service.TalentService;
import com.hobbyfield.app.talent.service.TalentVO;

@Controller
@RequestMapping("talent")
public class TalentController {
	
	@Autowired
	TalentService talentService;
	
	//후기, 카테고리 보이는 페이지
//	@GetMapping("/talentMain")
	
	// 카테고리 전체조회
	@GetMapping("/talentList")
	public String getTalentAllList(Model model, TalentVO talentVO) {
		//model.addAttribute("talentList", talentService.getTalentAllList());
		//재능기부 등록
		// talentService.insertTalent(talentVO);
		//재능기부 조회수 업데이트
		//talentService.updateTlntView(talentVO);
		//model.addAttribute("talent", talentVO);
		return "talent/talentList";
	}
	
	// 단건조회
	@GetMapping("/talentInfo")
	public TalentVO getTalentInfo(TalentVO talentVO, Model model) {
		talentVO  = talentService.getTalentInfo(talentVO);
		return talentService.getTalentInfo(talentVO);
	}

//	@PostMapping("/talentInsert")
	
//	@PostMapping("/talentUpdate")
	
}
