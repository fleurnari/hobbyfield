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
	
	@Autowired
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
	@PostMapping("/memberEmailChk")
	public String memberEmailChk(String memberEmail) {
		
		int result = memberService.idCheck(memberEmail);
		
		if (result == 1) {
			
			return "fail";
		} else {
			
			return "success";
		}

	}
	
	// 회원 가입 수행
	@PostMapping("/memberInsert")
	public String memberInsert(MemberVO memberVO) {
			String rawPwd = memberVO.getMemberPwd();
			String encryptedPwd = encryptor.encrypt(rawPwd);
			memberVO.setMemberPwd(encryptedPwd);
			if (memberVO.getMemberBizno().equals("")) {
				memberVO.setMemberGrd("A1");
			} else {
				memberVO.setMemberGrd("A2");
			}
			memberService.insertMember(memberVO);
		return "member/loginForm";
	}
	
}
