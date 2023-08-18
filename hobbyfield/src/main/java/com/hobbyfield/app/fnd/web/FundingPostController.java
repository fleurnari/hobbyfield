package com.hobbyfield.app.fnd.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hobbyfield.app.fnd.service.FundingGoodsService;
import com.hobbyfield.app.fnd.service.FundingPostService;
import com.hobbyfield.app.fnd.service.FundingPostVO;

@Controller
public class FundingPostController {

	@Autowired
	FundingPostService fundingPostService;
	
	@Autowired
	FundingGoodsService fundingGoodsService;

	//전체조회
	@GetMapping("fundingPostList")
	public String FundingPostList(Model model) {
		model.addAttribute("fundingPostList", fundingPostService.getFundingPostList());
				
		return "fundingPost/fundingPostList";
	}
	//펀딩 프로젝트 상세보기
	@GetMapping("fundingPostInfo")
	public String fundingPostInfo(FundingPostVO fundingPostVO, Model model) {
		FundingPostVO findVO = fundingPostService.getFundingPostInfo(fundingPostVO);
		model.addAttribute("fundingPostInfo",findVO);
		//펀딩 옵션
		model.addAttribute("fundingGoodsInfo",fundingGoodsService.getFundingGoods(fundingPostVO));
		System.out.println(model); 
		//리퀘스트파람을 사용해보자~
		return "fundingPost/fundingPostInfo";
	}
	
	//펀딩 프로젝트 등록폼
	@GetMapping("fundingPostInsertForm")
	public String fundingPostInsertForm() {
		return "fundingPost/fundingPostInsertForm";
	}
	//펀딩 프로젝트 등록
	@GetMapping("fundingPostInsert")
	public String fundingPostInsert() {
		return "fundingPost/fundingPostInsert";
	}
	//펀딩 프로젝트 등록
	@PostMapping("fundingPostInsert")
	public String fundingPostInsertProcess(FundingPostVO fundingPostVO) {
		fundingPostService.insertFundingPostInfo(fundingPostVO);
			
		return "redirect:fundingPostList";
	}
}

