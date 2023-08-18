package com.hobbyfield.app.fnd.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


import com.hobbyfield.app.fnd.service.FundingGoodsService;

@Controller
public class FundingGoodsController {

	@Autowired
	FundingGoodsService fundingGoodsService;
	
	/*
	 * //펀딩옵션리스트 가져오기
	 * 
	 * @GetMapping("fundingPostInfo") public String FundingGoodsList(Model model) {
	 * model.addAttribute("fundingGoodsInfo",
	 * fundingGoodsService.getFundingGoods());
	 * 
	 * return "fundingPost/fundingPostInfo"; }
	 */
}
