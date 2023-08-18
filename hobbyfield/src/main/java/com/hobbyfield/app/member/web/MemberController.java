package com.hobbyfield.app.member.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hobbyfield.app.member.service.MemberService;
import com.hobbyfield.app.member.service.MemberVO;
import com.hobbyfield.app.pointrecord.service.PointRecordService;
import com.hobbyfield.app.pointrecord.service.PointRecordVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	PointRecordService pointRecordService;
	
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
				memberVO.setMemberComaccp("AJ1");
			}
			memberService.insertMember(memberVO);
		return "member/login";
	}
	
	// 로그인 페이지
	@GetMapping("/login")
		public String loginForm() {
			return "member/login";
		}
	
	// 로그인 수행
	@PostMapping("/login")
		public String login(MemberVO memberVO, HttpServletRequest request, RedirectAttributes rttr) {
			HttpSession session = request.getSession();
			String rawPwd = "";
			String encryptedPwd = "";
			
			MemberVO member = memberService.memberLogin(memberVO);
			
			if (member != null) {
				rawPwd = memberVO.getMemberPwd();
				encryptedPwd = member.getMemberPwd();
				
				if (rawPwd.equals(encryptor.decrypt(encryptedPwd))) {
					if (member.getMemberGrd().equals("A2") && member.getMemberComaccp().equals("AJ1")) {
						rttr.addFlashAttribute("result", 1);
						return "redirect:/login";
					} else if (member.getMemberGrd().equals("A2") && member.getMemberComaccp().equals("AJ3")) {
						rttr.addFlashAttribute("result", 2);
						return "redirect:/login";
						
					} else {
					member.setMemberPwd("");
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
					
					if ((member.getMemberLtstconn() == null) || !(dateFormat.format(new Date()).equals(dateFormat.format(member.getMemberLtstconn())))) {
						memberService.memberLtstUpdate(member);
						memberService.memberPntUpdate(member);
						
						PointRecordVO pointRecord = new PointRecordVO();
						pointRecord.setMemberEmail(member.getMemberEmail());
						pointRecordService.loginPointInsert(pointRecord);
						
					}
					session.setAttribute("member", member);
					return "home";
				  }
				} else {
					rttr.addFlashAttribute("result", 0);
					return "redirect:/login";
				}
				
			} else {
				rttr.addFlashAttribute("result", 0);
				return "redirect:/login";
			}
					
	}
	
	// 로그아웃 수행
	@GetMapping("/logout")
		public String logout(HttpServletRequest request) {
		
			HttpSession session = request.getSession();
			
			session.invalidate();
			
			return "home";
		}
	}
	
