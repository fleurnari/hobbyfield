package com.hobbyfield.app.fnd.web;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hobbyfield.app.fnd.service.FundingGoodsService;
import com.hobbyfield.app.fnd.service.FundingGoodsVO;
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
	public String FundingPaymentForm(@RequestParam Integer GoodsAmount, FundingPostVO fundingPostVO, FundingGoodsVO fundingGoodsVO, Model model) {
		FundingPostVO findVO = fundingPostService.getFundingPostInfo(fundingPostVO);
		FundingGoodsVO FgVO = fundingGoodsService.getFundingGoodsInfo(fundingGoodsVO);
		model.addAttribute("GoodsAmount",GoodsAmount);
		model.addAttribute("fundingPostInfo", findVO);
		model.addAttribute("fundingGoodsInfo", FgVO);
		return "fundingPost/fundingPayment";
	}
}
