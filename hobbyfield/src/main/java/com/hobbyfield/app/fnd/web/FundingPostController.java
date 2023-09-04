package com.hobbyfield.app.fnd.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobbyfield.app.comm.mapper.CommCodeMapper;
import com.hobbyfield.app.common.PageMaker;
import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.fnd.service.FundingGoodsService;
import com.hobbyfield.app.fnd.service.FundingPostService;
import com.hobbyfield.app.fnd.service.FundingPostVO;
import com.hobbyfield.app.member.service.MemberVO;

//2023-08-18 신영환 펀딩관련 컨트롤러
@Controller
public class FundingPostController {

	@Autowired
	FundingPostService fundingPostService;
	
	@Autowired
	FundingGoodsService fundingGoodsService;
	
	@Autowired
	CommCodeMapper codeMapper;
	
	//전체조회
	@GetMapping("fundingPostList")
	public String FundingPostList(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		model.addAttribute("fundingPostList", fundingPostService.getFundingPostList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(fundingPostService.postCount(scri));
	
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("scri", scri);
			
		return "fundingPost/fundingPostList";
	}
	

	//펀딩 프로젝트 상세보기
	@GetMapping("fundingPostInfo")
	public String fundingPostInfo(FundingPostVO fundingPostVO, Model model) {
		FundingPostVO findVO = fundingPostService.getFundingPostInfo(fundingPostVO);
		fundingPostService.updateFundingPostViews(fundingPostVO);
		model.addAttribute("fundingPostInfo",findVO);
		model.addAttribute("fundingGoodsInfo",fundingGoodsService.getFundingGoods(fundingPostVO));
		return "fundingPost/fundingPostInfo";
	}
	
	//펀딩 프로젝트 등록폼
	@GetMapping("fundingPostInsertForm")
	public String fundingPostInsertForm() {
		return "fundingPost/fundingPostInsertForm";
	}
	//펀딩 프로젝트 등록	
	@GetMapping("fundingPostInsert")
	public String fundingPostInsert(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		model.addAttribute("fundingPostList", fundingPostService.getFundingPostList(scri));
		return "fundingPost/fundingPostInsert";
	}
	//펀딩 프로젝트 등록폼2
		@GetMapping("fundingPostInsert20")
		public String fundingPostInsert20(String fndPostNumber, FundingPostVO fundingPostVO, Model model) {
			FundingPostVO findVO = fundingPostService.getFundingPostInfo(fundingPostVO);
			model.addAttribute("fndPostNumber",fndPostNumber);
			model.addAttribute("fundingPostInsert20",findVO);
			
			return "fundingPost/fundingPostInsert20";
	}
		@PostMapping("fundingPostInsert")
		public String fundingPostInsertProcess(HttpSession session, FundingPostVO fundingPostVO, Model model) {
			MemberVO member = (MemberVO) session.getAttribute("member");
			fundingPostVO.setMemberEmail(member.getMemberEmail());
			fundingPostService.insertFundingPostInfo(fundingPostVO);
			model.addAttribute("fundingPostInsert20",fundingPostVO);
			return "fundingPost/fundingPostInsert20";
		}
	//펀딩 프로젝트 임시저장(update)
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
		map.put("fundingPostInsert20", fundingPostVO);
		return map;
	}
	
	//펀딩 내 프로젝트
	@GetMapping("fundingMyProject")
	public String FundingMyProjectList(HttpSession session, FundingPostVO fundingPostVO, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		fundingPostVO.setMemberEmail(member.getMemberEmail());
		
		List<FundingPostVO> fundingPostList = fundingPostService.selectMyProjectList(fundingPostVO);
		model.addAttribute("fundingMyProject", fundingPostList);
		return "fundingPost/fundingMyProject";
	}
	/*
	 * @PostMapping("fundingPostDelete") public Map<String, Object>
	 * fundingPostDelete(FundingPostVO fndPostNumber) { boolean result = false;
	 * 
	 * int fundingNO = fundingPostService.deleteFundingPost(fndPostNumber);
	 * 
	 * if(fundingNO > 0) { result = true; } System.out.println(result); Map<String,
	 * Object> map = new HashMap<>(); System.out.println(map); map.put("result",
	 * result); return map; }
	 */
	
	  //펀딩 프로젝트 삭제
	  
	@PostMapping("fundingPostDelete")
	public String fundingPostDelete(FundingPostVO fndPostNumber, Model model) {
		model.addAttribute(fundingPostService.deleteFundingPost(fndPostNumber));
		model.addAttribute(fundingGoodsService.deletePostGoods(fndPostNumber));
	    
	    return "redirect:/fundingPostInsert"; // 삭제 후 다시 데이터를 리로드하는 GetMapping 페이지로 리다이렉트
	}
	 
	  
}