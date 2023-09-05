package com.hobbyfield.app.fnd.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hobbyfield.app.common.PageMaker;
import com.hobbyfield.app.common.SearchCriteria;
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
	    model.addAttribute("fundingSupportList", fundingSupportList);  
	    return "fundingPost/fundingSupportList";
	}
	
	@GetMapping("supportManagement")
	public String supportManagement(FundingSupportVO fundingSupportVO, @ModelAttribute("scri") SearchCriteria scri, Model model, HttpServletRequest request) {
	    List<FundingSupportVO> fundingSupportList = fundingSupportService.supportManagement(fundingSupportVO, scri);

	    // HttpSession을 이용하여 세션에 값 저장
	    HttpSession session = request.getSession();
	    session.setAttribute("fndPostNumber", fundingSupportVO.getFndPostNumber());

	    model.addAttribute("supportManagement", fundingSupportList);
	    model.addAttribute("fundingSupport", fundingSupportVO);

	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(scri);
	    pageMaker.setTotalCount(fundingSupportService.supportCount(scri));

	    model.addAttribute("pageMaker", pageMaker);
	    model.addAttribute("scri", scri);
	    return "fundingPost/supportManagement";
	}	
	
	@PostMapping("insertfundingInvoce")
	public String insertfundingInvoce(FundingSupportVO fundingSupportVO, Model model) {
		fundingSupportService.insertfundingInvoce(fundingSupportVO);
		List<FundingSupportVO> fundingSupportList = fundingSupportService.getFundingSupportInfo(fundingSupportVO);
		model.addAttribute("fundingSupportList", fundingSupportList);
		model.addAttribute("fundingSupport", fundingSupportVO);
		return "redirect:/supportManagement";
	}
}
