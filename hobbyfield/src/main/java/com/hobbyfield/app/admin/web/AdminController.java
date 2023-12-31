package com.hobbyfield.app.admin.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobbyfield.app.admin.service.AdminService;
import com.hobbyfield.app.comm.mapper.CommCodeMapper;
import com.hobbyfield.app.common.PageMaker;
import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.member.service.MemberVO;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	CommCodeMapper codeMapper;
	
	// 전체 회원 조회
	@GetMapping("/memberList")
	public String selectMemberList(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		model.addAttribute("memberList", adminService.selectMemberList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.countMember(scri));
	
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("scri", scri);
		
		return "admin/memberList";
	}
	
	// 가입 대기 중 / 거부된 기업 회원 목록 조회
	@GetMapping("/comMemberList")
	public String selectComMemberList(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		model.addAttribute("comMemberList", adminService.selectComMemberList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.countComMember(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("scri", scri);
		
		return "admin/comMemberList";
	}
	
	// 회원 상세 조회
	@GetMapping("/memberInfo")
	public String selectMember(MemberVO memberVO, @ModelAttribute("scri") SearchCriteria scri, Model model) {
		MemberVO findVO = adminService.selectMember(memberVO);
		model.addAttribute("memberInfo", findVO);
		model.addAttribute("scri", scri);
		model.addAttribute("AJ", codeMapper.selectCommCodeList("0AJ"));
		
		return "admin/memberInfo";
	}
	
	// 기업 회원 승인
	@PostMapping("/updateComMember")
	@ResponseBody
	public boolean updateComMember(MemberVO memberVO) {
		
		int result = adminService.updateComMember(memberVO);
		
		if (result == 0) {
			return false;
		}
		
		return true;
	}
	
	
	// 회원 강제 탈퇴
	@PostMapping("/forcedDeleteMember")
	@ResponseBody
	public boolean forcedDeleteMember(String memberEmail) {
		
		int result = adminService.deleteMember(memberEmail);
		
		if (result == 0) {
			return false;
		}
		
		return true;
	}
	

}