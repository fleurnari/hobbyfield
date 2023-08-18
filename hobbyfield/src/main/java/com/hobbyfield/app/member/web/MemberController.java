package com.hobbyfield.app.member.web;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hobbyfield.app.member.service.MemberService;
import com.hobbyfield.app.member.service.MemberVO;
import com.hobbyfield.app.pointrecord.service.PointRecordService;
import com.hobbyfield.app.pointrecord.service.PointRecordVO;
import com.hobbyfield.app.security.CustomUser;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	PointRecordService pointRecordService;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;

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
			String encryptedPwd = pwEncoder.encode(rawPwd);
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
		public String loginForm(@RequestParam(value = "error", required = false) String error,
								@RequestParam(value = "exception", required = false) String exception,
								Model model) {
			model.addAttribute("error", error);
			model.addAttribute("exception", exception);
			return "member/login";
		}
	
	// 카카오 로그인
	@GetMapping("/kakaoLogin")
	public String kakaoLogin(HttpServletRequest request, RedirectAttributes rttr, @RequestParam(value = "code", required = false) String code) throws Exception {
		HttpSession session = request.getSession();
		String access_Token = memberService.getAccessToken(code);
		HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
		
		MemberVO member = new MemberVO();
		member.setMemberEmail(String.valueOf(userInfo.get("email")));
		MemberVO kakaoMember = memberService.memberLogin(member);
		
		if (kakaoMember != null) {
			CustomUser user = new CustomUser(kakaoMember);
			Collection<? extends GrantedAuthority> roles = user.getAuthorities();
			Authentication auth = new UsernamePasswordAuthenticationToken(user, null, roles);
			SecurityContextHolder.getContext().setAuthentication(auth);
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			
			if ((kakaoMember.getMemberLtstconn() == null) || !(dateFormat.format(new Date()).equals(dateFormat.format(kakaoMember.getMemberLtstconn())))) {
				memberService.memberLtstUpdate(kakaoMember);
				memberService.memberPntUpdate(kakaoMember);
				
				PointRecordVO pointRecord = new PointRecordVO();
				pointRecord.setMemberEmail(kakaoMember.getMemberEmail());
				pointRecordService.loginPointInsert(pointRecord);
				
			}
			
			session.setAttribute("member", kakaoMember);
			return "home";
		} else {
			rttr.addFlashAttribute("result", 3);
			return "redirect:/login";
		}
		
	}
	

	// 마이페이지
	@GetMapping("mypage")
	public String myPage(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		model.addAttribute("info", memberService.memberLogin(member));
		return "mypage/myPage";
	}

}

	
