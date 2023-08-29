package com.hobbyfield.app.fnd.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hobbyfield.app.fnd.service.FundingSupportService;
import com.hobbyfield.app.fnd.service.FundingSupportVO;
import com.hobbyfield.app.member.service.MemberService;
import com.hobbyfield.app.member.service.MemberVO;
//2023-08-28 신영환 펀딩 후원 컨트롤러
@Controller
public class FundingSupportController {
	
	@Autowired
	FundingSupportService fundingSupportService;
	@Autowired
	MemberService memberService;
	//펀딩 후원 목록 페이지
	@GetMapping("fundingSupportList")
	public String fundingSupportList(HttpSession session, FundingSupportVO fundingSupportVO, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("member");
	    fundingSupportVO.setMemberEmail(member.getMemberEmail());

	    List<FundingSupportVO> fundingSupportList = fundingSupportService.getFundingSupportInfo(fundingSupportVO);  
	    System.out.println(fundingSupportList);
	    model.addAttribute("fundingSupportList", fundingSupportList);  
	    return "fundingPost/fundingSupportList";
	}
}
