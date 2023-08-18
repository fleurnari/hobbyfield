package com.hobbyfield.app.fnd.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobbyfield.app.fnd.service.FundingPostService;
import com.hobbyfield.app.fnd.service.FundingPostVO;

//2023-08-18 신영환 펀딩관련 컨트롤러
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
	

	//펀딩 프로젝트 상세보기
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

	
	//펀딩 프로젝트 등록폼2
	@GetMapping("fundingPostInsert20")
	public String fundingPostInsert20(FundingPostVO fundingPostVO, Model model) {
		FundingPostVO findVO = fundingPostService.getFundingPostInfo(fundingPostVO);
		model.addAttribute("fundingPostInfo", findVO);
		return "fundingPost/fundingPostInsert20";
	}
	//펀딩 프로젝트 임시저장
	//데이터가 돌아와야하므로 post처리
	@PostMapping("fundingPostUpdate")
	//데이터 돌려주기위함
	@ResponseBody
	//두개의 데이터를 돌려받기위해
	public Map<String, Object>fundingPostUpdate(FundingPostVO fundingPostVO) {
		boolean result = false;
		
		int fundingNo = fundingPostService.updateFundingPostInfo(fundingPostVO);
		if(fundingNo > 0) {
			result = true;
		}
		Map<String, Object> map = new HashMap<>();
		map.put("result", result);
		map.put("fundingPostInfo", fundingPostVO);
		return map;
	}
	
	//펀딩 프로젝트 등록
	@PostMapping("fundingPostInsert")
	public String fundingPostInsertProcess(FundingPostVO fundingPostVO) {
		fundingPostService.insertFundingPostInfo(fundingPostVO);
			
		return "redirect:fundingPostInsert20";
	}
}

