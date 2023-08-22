package com.hobbyfield.app.talent.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.hobbyfield.app.talent.service.TalentService;
import com.hobbyfield.app.talent.service.TalentVO;
//2023.08.21 천혜련 - 재능기부 게시판관리
@Controller
public class TalentController {

	@Autowired
	private TalentService talentService;

	// 메인 페이지
    @GetMapping("/talentMain")
    public String talentMain() {
        return "talent/talentMain"; 
    }
	
	// 전체조회
	@GetMapping("talentList")
	public String getAllTalents(Model model) {
		model.addAttribute("talents", talentService.getAllTalent());
		return "talent/talentList";
	}

	// 단건조회
	@GetMapping("talent/{tlntId}")
	public String getTalentInfo(@PathVariable int tlntId, Model model) {
		TalentVO talent = talentService.getTalentInfo(tlntId);
		talentService.updateTalentView(tlntId);
		model.addAttribute("talent", talent);
		return "talent/talentInfo";
	}

	// 등록 - Form
	@GetMapping("/talent/insert")
	public String insertTalentForm() {
		return "talent/insertTalentForm";
	}

	// 등록 - Process
	@PostMapping("/talent/insert")
	public String insertTalent(TalentVO talentVO) {
		talentService.insertTalent(talentVO);
		return "redirect:/talentList"; // 재능기부 목록 페이지로 리다이렉트
	}

	// 수정 - Form
	@GetMapping("/talent/{tlntId}/update")
	public String updateTalentForm(@PathVariable int tlntId, Model model) {
		TalentVO talent = talentService.getTalentInfo(tlntId);
		model.addAttribute("talent", talent);
		return "talent/updateTalentForm";
	}

	// 수정 - Process
	@PostMapping("/talent/{tlntId}/update")
	public String updateTalent(@PathVariable int tlntId, TalentVO talentVO) {
		talentService.updateTalent(talentVO);
		return "redirect:/talent/" + tlntId; // 수정한 재능기부 글 상세 페이지로 리다이렉트
	}

	// 삭제
	@PostMapping("/talent/{tlntId}/delete")
	public String deleteTalent(@PathVariable int tlntId) {
		talentService.deleteTalent(tlntId);
		return "redirect:/talentList"; // 재능기부 목록 페이지로 리다이렉트
	}
}
