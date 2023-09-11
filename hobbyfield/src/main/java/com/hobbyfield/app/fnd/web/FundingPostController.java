package com.hobbyfield.app.fnd.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobbyfield.app.comm.mapper.CommCodeMapper;
import com.hobbyfield.app.common.PageMaker;
import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.fnd.service.FundingCommentService;
import com.hobbyfield.app.fnd.service.FundingCommentVO;
import com.hobbyfield.app.fnd.service.FundingGoodsService;
import com.hobbyfield.app.fnd.service.FundingInterestService;
import com.hobbyfield.app.fnd.service.FundingInterestVO;
import com.hobbyfield.app.fnd.service.FundingPostService;
import com.hobbyfield.app.fnd.service.FundingPostVO;
import com.hobbyfield.app.member.service.MemberVO;

//2023-08-18 신영환 펀딩관련 컨트롤러
@RequestMapping("/fundingPost/*")
@Controller
public class FundingPostController {

	@Autowired
	FundingPostService fundingPostService;
	
	@Autowired
	FundingGoodsService fundingGoodsService;
	
	@Autowired
	CommCodeMapper codeMapper;
	
	@Autowired
	FundingCommentService fundingCommentService;
	
	@Autowired
	FundingInterestService fundingInterestService;
	
	//전체조회
	@GetMapping("/fundingPostList")
	public String FundingPostList(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		scri.setSearchType("status");
		scri.setKeyword("2");
		model.addAttribute("fundingPostList", fundingPostService.getFundingPostList(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(fundingPostService.postCount(scri));
	
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("scri", scri);
		model.addAttribute("category", codeMapper.selectCommCodeList("0O"));
			
		return "fundingPost/fundingPostList";
	}
	

	//펀딩 프로젝트 상세보기
	@GetMapping("/fundingPostInfo")
	public String fundingPostInfo(FundingPostVO fundingPostVO, Model model) {
		FundingPostVO findVO = fundingPostService.getFundingPostInfo(fundingPostVO);
		fundingPostService.updateFundingPostViews(fundingPostVO);
		model.addAttribute("fundingPostInfo",findVO);
		model.addAttribute("fundingGoodsInfo",fundingGoodsService.getFundingGoods(fundingPostVO));
		model.addAttribute("commentList", fundingCommentService.getCommentList(findVO.getFndPostNumber()));
		return "fundingPost/fundingPostInfo";
	}
	
	//펀딩 프로젝트 등록폼
	@GetMapping("/fundingPostInsertForm")
	public String fundingPostInsertForm() {
		
		return "fundingPost/fundingPostInsertForm";
		
	}
	//펀딩 프로젝트 등록	
	@GetMapping("/fundingPostInsert")
	public String fundingPostInsert(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		model.addAttribute("fundingPostList", fundingPostService.getFundingPostList(scri));
		model.addAttribute("category", codeMapper.selectCommCodeList("0O"));
		return "fundingPost/fundingPostInsert";
	}
	//펀딩 프로젝트 등록폼2
		@GetMapping("/fundingPostInsert20")
		public String fundingPostInsert20(String fndPostNumber, FundingPostVO fundingPostVO, Model model) {
			FundingPostVO findVO = fundingPostService.getFundingPostInfo(fundingPostVO);
			model.addAttribute("fndPostNumber",fndPostNumber);
			model.addAttribute("fundingPostInsert20",findVO);
			
			return "fundingPost/fundingPostInsert20";
	}
		@PostMapping("/fundingPostInsert")
		public String fundingPostInsertProcess(HttpSession session, FundingPostVO fundingPostVO, Model model) {
			MemberVO member = (MemberVO) session.getAttribute("member");
			fundingPostVO.setMemberEmail(member.getMemberEmail());
			fundingPostService.insertFundingPostInfo(fundingPostVO);
			model.addAttribute("fundingPostInsert20",fundingPostVO);
			return "fundingPost/fundingPostInsert20";
		}
	//펀딩 프로젝트 임시저장(update)
	//데이터가 돌아와야하므로 post처리
	@PostMapping("/fundingPostUpdate")
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
	
	//관리자 페이지 승인
	@PostMapping("/fundingAdminUpdate")
	public String FundingAdminUpdate(FundingPostVO fundingPostVO, Model model) {
		model.addAttribute(fundingPostService.updateFundingPostInfo(fundingPostVO));
		
		return "fundingPost/adminAccept";
	}
	//펀딩 내 프로젝트
	@GetMapping("/fundingMyProject")
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
	  
	@PostMapping("/fundingPostDelete")
	public String fundingPostDelete(FundingPostVO fndPostNumber, Model model) {
		model.addAttribute(fundingPostService.deleteFundingPost(fndPostNumber));
		model.addAttribute(fundingGoodsService.deletePostGoods(fndPostNumber));
	    
	    return "redirect:/fundingPostInsert"; // 삭제 후 다시 데이터를 리로드하는 GetMapping 페이지로 리다이렉트
	}
	
	//관리자 페이지
	@GetMapping("/adminAccept")
	public String adminAcceptForm(Model model,  @ModelAttribute("scri") SearchCriteria scri) {
		scri.setSearchType("status");
		scri.setKeyword("0");
		model.addAttribute("fundingPostList", fundingPostService.getFundingPostList(scri));
	
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(fundingPostService.postCount(scri));
	
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("scri", scri);
			
		return "fundingPost/adminAccept";
	}
	
	// 댓글 작성
	@ResponseBody
	@PostMapping("fndCommentInsert")
	public int insertFndComment(FundingCommentVO fundingCommentVO) {
		
		int result = fundingCommentService.insertComment(fundingCommentVO);
		
		return result; 
	}
	
	// 댓글 수정 폼
	@GetMapping("fndCommentUpdate")
	public String updateFndCommentForm(Model model, FundingCommentVO fundingCommentVO) {
		FundingCommentVO findVO = fundingCommentService.getComment(fundingCommentVO);
		model.addAttribute("comment", findVO);
		return "comment/fndCommentUpdate";
	}
	
	// 댓글 수정 수행
	@ResponseBody
	@PostMapping("fndCommentUpdate")
	public boolean updateFndComment(FundingCommentVO fundingCommentVO) {
		
		int result = fundingCommentService.updateComment(fundingCommentVO);
	
		if (result == 0) {
			return false;
		}
		
		return true;
	}
	
	// 댓글 삭제
	@ResponseBody
	@PostMapping("fndCommentDelete")
	public boolean deleteFndComment(FundingCommentVO fundingCommentVO) {
		
		int result = fundingCommentService.deleteComment(fundingCommentVO);
		
		if (result == 0) {
			return false;
		}
		
		return true;
		
	}
	
	// 카테고리별 펀딩 조회
	@ResponseBody
	@GetMapping("selectFundingPostCate")
	public List<FundingPostVO> selectFundingPostCate(@RequestParam String fndCategory, Model model) {
		model.addAttribute("category", codeMapper.selectCommCodeList("0O"));
		List<FundingPostVO> category = fundingPostService.selectFundingPostCate(fndCategory);
		return category;
	}
	
	// 관심 목록
	@GetMapping("/fndInterestList")
	public String fndInterestList(Model model, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		model.addAttribute("fndInterestList", fundingInterestService.selectFundingInterestList(member.getMemberEmail()));
		
		return "";
	}
	
	
	
	
	// 관심 목록 추가/삭제
	@ResponseBody
	@PostMapping("fndInterest")
	public int fndLike(FundingInterestVO fndInterestVO, Model model) {
		
		int result;
		int interest = fundingInterestService.selectFundingInterest(fndInterestVO.getFndPostNumber(), fndInterestVO.getMemberEmail());
		
		if (interest == 0) {
			result = 0;
			fundingInterestService.insertFundingInterest(fndInterestVO);
		} else {
			result = 1;
			fundingInterestService.deleteFundingInterest(fndInterestVO);
		}
		
		return result;
		
	}
	

}