package com.hobbyfield.app.fnd.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hobbyfield.app.fnd.service.FundingGoodsService;
import com.hobbyfield.app.fnd.service.FundingPostService;
import com.hobbyfield.app.fnd.service.FundingPostVO;
//2023-08-22 신영환 펀딩결제 컨트롤러
@Controller
public class FundingPaymentController {
	
	@Autowired
	FundingPostService fundingPostService;
	@Autowired
	FundingGoodsService fundingGoodsService;
	
	//펀딩 결제 페이지
	@GetMapping("fundingPayment")
	public String FundingPaymentForm(FundingPostVO fundingPostVo, Model model) {
		FundingPostVO allFundingList = fundingPostService.getFundingPostInfo(fundingPostVo);
		
		model.addAttribute("fundingPostInfo", allFundingList);
		return "fundingPost/fundingPayment";
	}
}
