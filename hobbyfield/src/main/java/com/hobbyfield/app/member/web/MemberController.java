package com.hobbyfield.app.member.web;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hobbyfield.app.club.service.CreateclubService;
import com.hobbyfield.app.member.service.MemberService;
import com.hobbyfield.app.member.service.MemberVO;
import com.hobbyfield.app.member.service.MyitemService;
import com.hobbyfield.app.pointrecord.service.PointRecordService;
import com.hobbyfield.app.pointrecord.service.PointRecordVO;
import com.hobbyfield.app.prdt.service.PrdtService;
import com.hobbyfield.app.security.CustomUser;

@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	PointRecordService pointRecordService;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	MyitemService myitemService;
	
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
		
		int result = memberService.chkMemberEmail(memberEmail);
		
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
		MemberVO kakaoMember = memberService.loginMember(member);
		
		if (kakaoMember != null) {
			
			CustomUser user = new CustomUser(kakaoMember);
			Collection<? extends GrantedAuthority> roles = user.getAuthorities();
			Authentication auth = new UsernamePasswordAuthenticationToken(user, null, roles);
			SecurityContextHolder.getContext().setAuthentication(auth);
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			
			if ((member.getMemberLtstconn() == null) || !(dateFormat.format(new Date()).equals(dateFormat.format(member.getMemberLtstconn())))) {
				memberService.updateMemberLtst(member);
				memberService.updateMemberPnt(member);
				
				PointRecordVO pointRecord = new PointRecordVO();
				pointRecord.setMemberEmail(member.getMemberEmail());
				pointRecordService.insertLoginPoint(pointRecord);
				
			}
		
			session.setAttribute("member", kakaoMember);
			return "home";
		} else {
			rttr.addFlashAttribute("result", 1);
			return "redirect:/member/login";
		}
		
	}
	
	// 마이페이지
	@GetMapping("/myPage")
	public String myPage(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		model.addAttribute("info", memberService.loginMember(member));
		return "member/myPage";
	}
	
	// 회원 정보 수정 페이지로 이동
	@GetMapping("/memberUpdate")
	public String memberUpdateForm(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		model.addAttribute("info", memberService.loginMember(member));
		return "member/memberUpdate";
	}
	
	// 회원 정보 수정 수행
	@PostMapping("/memberUpdate")
	@ResponseBody
	public boolean memberUpdate(MemberVO memberVO) {
		
		int result = memberService.updateMember(memberVO);
		
		if (result == 0) {
			return false;
		}
		
		return true;
	}
	
	// 비밀번호 수정 페이지로 이동
	@GetMapping("/memberPwdUpdate")
	public String memberPwdUpdateForm(HttpSession session, Model model) {
		return "member/memberPwdUpdate";	
	}
	
	// 비밀번호 확인
	@ResponseBody
	@PostMapping("/memberPwdChk")
	public int memberPwdChk(MemberVO memberVO) {
		String memberPwd = memberService.chkMemberPwd(memberVO.getMemberEmail());
		if (memberVO == null || !pwEncoder.matches(memberVO.getMemberPwd(), memberPwd)) {
			return 0;
		}
		
		return 1;
	}

	
	
	// 비밀번호 수정 수행
	@PostMapping("/memberPwdUpdate")
	public String memberPwdUpdate(String memberEmail, String newMemberPwd, HttpSession session) {
		String encodePwd = pwEncoder.encode(newMemberPwd);
		memberService.updateMemberPwd(memberEmail, encodePwd);
		session.invalidate();
		
		return "redirect:/member/login";
	}
	

	// 회원 탈퇴 페이지 이동
	@GetMapping("/memberDelete")
	public String memberDeleteView() {
		return "member/memberDelete";
	}
	
	// 회원 탈퇴 수행
	@PostMapping("/memberDelete")
	public String memberDelete(String memberEmail, HttpSession session) {
		memberService.deleteMember(memberEmail);
		session.invalidate();
		
		return "redirect:/member/login";
	}
	
	// 마이 페이지 - 나의 아이템 전체조회
	@GetMapping("/myitemList")
	public String getMyitemAllList(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		model.addAttribute("myitemList", myitemService.selectMyItemAllList(member));
		
		return "member/myitemList";
	}
	
	// 마이 페이지 - 가입한 소모임 조회
	@GetMapping("/selectJoinClub")
	public String selectJoinClub(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		model.addAttribute("clubList", memberService.selectJoinClub(member));
		
		return "member/selectJoinClub"; 
		
	}
	
	// 마이 페이지 - 기업회원의 판매 중인 상품 조회	
	@GetMapping("/selectSellList")
	public String selectSellList(HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		model.addAttribute("sellList", memberService.selectSellList(member));
		
		return "member/selectSellList";
	}
	
	
	
	

}
