package com.hobbyfield.app.talent.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hobbyfield.app.talent.service.TalentService;

@Controller
@RequestMapping("talent")
public class TalentController {
	
	@Autowired
	TalentService talentService;
	
	// 전체조회
	@GetMapping("/talentList")
	public String getTalentAllList(Model model) {
		model.addAttribute("talentList", talentService.getTalentAllList());
		return "talent/talentList";
	}
	
}
