package com.hobbyfield.app.fnd.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hobbyfield.app.fnd.service.FundingPostService;
import com.hobbyfield.app.fnd.service.FundingPostVO;

@Controller
public class FundingPostController {

	@Autowired
	FundingPostService fundingPostService;

	//전체조회
	@GetMapping("fundingPostList")
	public String FundingPostList(Model model) {
		model.addAttribute("fundingPostList", fundingPostService.getFundingPostList());
			
			
		return "fundingPost/fundingPostList";
	}
	
	@GetMapping("fundingPostInfo")
	public String fundingPostInfo(FundingPostVO fundingPostVO, Model model) {
		FundingPostVO findVO = fundingPostService.getFundingPostInfo(fundingPostVO);
		model.addAttribute("fundingPostInfo",findVO);
		return "fundingPost/fundingPostInfo";
	}
	
	
	@GetMapping("fundingPostInsertForm")
	public String fundingPostInsertForm() {
		return "fundingPost/fundingPostInsertForm";
	}
		
	@GetMapping("fundingPostInsert")
	public String fundingPostInsert() {
		return "fundingPost/fundingPostInsert";
	}
		
	@PostMapping("fundingPostInsert")
	public String fundingPostInsertProcess(FundingPostVO fundingPostVO) {
		fundingPostService.insertFundingPostInfo(fundingPostVO);
			
		return "redirect:fundingPostList";
	}
}

