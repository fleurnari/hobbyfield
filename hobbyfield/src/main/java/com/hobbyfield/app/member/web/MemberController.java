package com.hobbyfield.app.member.web;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobbyfield.app.member.service.MemberService;
import com.hobbyfield.app.member.service.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	StandardPBEStringEncryptor encryptor;

	// 회원 가입 페이지
	@GetMapping("/memberJoinSelect")
	public String memberJoinSelect() {
		return "member/memberJoinSelect";
	}
	
	// 일반 회원 가입 페이지
	@GetMapping("/generalMemberJoin")
	public String generalMemberJoinForm() {
		return "member/generalMemberJoin";
	}
	
	
	// 기업 회원 가입 페이지
	@GetMapping("/companyMemberJoin")
	public String companyMemberJoinForm() {
		return "member/companyMemberJoin";
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@PostMapping("/idChk")
	public int idChk(MemberVO memberVO) {
		int result = memberService.idChk(memberVO);
		return result; 
	}
	
	// 회원 가입 수행
	@PostMapping("/memberInsert")
	public String memberInsert(MemberVO memberVO) {
		int result = memberService.idChk(memberVO);
		if (result == 1) {
			return "member/memberJoinSelect";
		} else {
			String rawPwd = memberVO.getMemberPwd();
			String encryptedPwd = encryptor.encrypt(rawPwd);
			memberVO.setMemberPwd(encryptedPwd);
			memberService.insertMember(memberVO);
		}
		return "home";
	}
	
}
