package com.hobbyfield.app.fnd.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hobbyfield.app.fnd.service.FundingGoodsService;
import com.hobbyfield.app.fnd.service.FundingGoodsVO;
import com.hobbyfield.app.fnd.service.FundingPostService;
import com.hobbyfield.app.fnd.service.FundingPostVO;
@RequestMapping("/fundingPost/*")
@Controller
public class FundingGoodsController {

	@Autowired
	FundingGoodsService fundingGoodsService;
	
	@Autowired
	FundingPostService fundingPostService;
	
	//펀딩 옵션 등록
			@GetMapping("/fundingPostGoods")
			public String fundingPostGoods(FundingPostVO fundingPostVO, Model model) {
				FundingPostVO findVO = fundingPostService.getFundingPostInfo(fundingPostVO);
				model.addAttribute("fundingPostGoods",findVO);
				model.addAttribute("fundingGoodsInfo",fundingGoodsService.getFundingGoods(fundingPostVO));
				return "fundingPost/fundingPostGoods";
			}
			
			@PostMapping("/fundingPostInsertGoods")
			public String fundingPostInsertGoods(FundingPostVO fundingPostVO, FundingGoodsVO fundingGoodsVO, Model model) {
				fundingGoodsService.insertFundingGoodsInfo(fundingGoodsVO);
				model.addAttribute("fundingPostGoods",fundingGoodsVO);
				model.addAttribute("fundingGoodsInfo",fundingGoodsService.getFundingGoods(fundingPostVO));
				return "fundingPost/fundingPostGoods";
		}
	
	//펀딩 옵션 정보 가져오기
			@GetMapping("/fundingGoodsInfo")
			public String fundingGoodsInfo(FundingGoodsVO fundingGoodsVO, Model model) {
				FundingGoodsVO findVO = fundingGoodsService.getFundingGoodsInfo(fundingGoodsVO);
				model.addAttribute("fundingGoosInfo", findVO);
				return "fundingGoods/fundingGoodsInfo";
			}
	
	//펀딩 옵션 삭제
			@PostMapping("/goodsDelete")
			public String fundingDeleteGoods(FundingGoodsVO fundingGoodsVO,FundingPostVO fundingPostVO, RedirectAttributes redirectAttributes) {
				fundingGoodsService.deleteGoods(fundingGoodsVO);
				redirectAttributes.addAttribute("fundingPostNumber", fundingPostVO.getFndPostNumber());
				return "redirect:/fundingPostGoods";
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
