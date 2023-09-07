package com.hobbyfield.app.fnd.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hobbyfield.app.fnd.service.FundingGoodsService;
import com.hobbyfield.app.fnd.service.FundingGoodsVO;
import com.hobbyfield.app.fnd.service.FundingPostService;
import com.hobbyfield.app.fnd.service.FundingPostVO;
import com.hobbyfield.app.fnd.service.FundingSupportService;
import com.hobbyfield.app.fnd.service.FundingSupportVO;
//2023-08-22 신영환 펀딩결제 컨트롤러
@RequestMapping("/fundingPost/*")
@Controller
public class FundingPaymentController {
	
	@Autowired
	FundingPostService fundingPostService;
	@Autowired
	FundingGoodsService fundingGoodsService;
	@Autowired
	FundingSupportService fundingSupportService;
	
	//펀딩 결제 페이지
	@GetMapping("/fundingPayment")
	public String FundingPaymentForm(String GoodsAmount, FundingPostVO fundingPostVO, FundingGoodsVO fundingGoodsVO, Model model) {
		FundingPostVO findVO = fundingPostService.getFundingPostInfo(fundingPostVO);
		FundingGoodsVO FgVO = fundingGoodsService.getFundingGoodsInfo(fundingGoodsVO);
		model.addAttribute("GoodsAmount",GoodsAmount);
		model.addAttribute("fundingPostInfo", findVO);
		model.addAttribute("fundingGoodsInfo", FgVO);
		return "fundingPost/fundingPayment";
	}
	
	//펀딩 후원 목록 등록
	@PostMapping("/supportInsert")
	public String supportInsert(FundingSupportVO fundingSupportVO, FundingPostVO fundingPostVO, Model model) {
		fundingSupportService.isertFundingSupportInfo(fundingSupportVO);
		fundingPostService.updateFundingPostPayment(fundingPostVO);
		return "fundingPost/fundingPostList";
	}
}
