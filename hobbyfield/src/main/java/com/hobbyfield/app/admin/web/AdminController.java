package com.hobbyfield.app.admin.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hobbyfield.app.admin.service.AdminService;
import com.hobbyfield.app.member.service.MemberVO;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	// 관리자 페이지
	@GetMapping("/adminPage")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	// 전체 회원 조회
	@GetMapping("/memberList")
	public String selectMemberList(Model model) {
		model.addAttribute("memberList", adminService.selectMemberList());
		return "admin/memberList";
	}
	
	// 가입 대기 중 / 거부된 기업 회원 목록 조회
	@GetMapping("/comMemberList")
	public String selectComMemberList(Model model) {
		model.addAttribute("comMemberList", adminService.selectComMemberList());
		return "admin/comMemberList";
	}
	
	// 회원 상세 조회
	@GetMapping("/memberInfo")
	public String selectMember(MemberVO memberVO, Model model) {
		MemberVO findVO = adminService.selectMember(memberVO);
		model.addAttribute("memberInfo", findVO);
		return "admin/adminInfo";
	}
	
	// 기업 회원 승인
	
	
	// 회원 강제 탈퇴

}