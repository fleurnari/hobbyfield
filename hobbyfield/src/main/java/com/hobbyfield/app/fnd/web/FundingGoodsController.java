package com.hobbyfield.app.fnd.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hobbyfield.app.fnd.service.FundingGoodsService;
import com.hobbyfield.app.fnd.service.FundingGoodsVO;
import com.hobbyfield.app.fnd.service.FundingPostService;
import com.hobbyfield.app.fnd.service.FundingPostVO;

@Controller
public class FundingGoodsController {

	@Autowired
	FundingGoodsService fundingGoodsService;
	
	@Autowired
	FundingPostService fundingPostService;
	
	//펀딩 옵션 등록
			@GetMapping("fundingPostGoods")
			public String fundingPostGoods(FundingPostVO fundingPostVO, Model model) {
				FundingPostVO findVO = fundingPostService.getFundingPostInfo(fundingPostVO);
				model.addAttribute("fundingPostGoods",findVO);
				return "fundingPost/fundingPostGoods";
			}
			
			@PostMapping("fundingPostInsertGoods")
			public String fundingPostInsertGoods(FundingGoodsVO fundingGoodsVO, Model model) {
				fundingGoodsService.insertFundingGoodsInfo(fundingGoodsVO);
				model.addAttribute("fundingPostGoods",fundingGoodsVO);
				
				return "fundingPost/fundingPostGoods";
		}
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
