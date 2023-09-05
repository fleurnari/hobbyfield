package com.hobbyfield.app.prdt.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobbyfield.app.common.PageMaker;
import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.csboard.service1.CSReplyVO;
import com.hobbyfield.app.member.service.MemberVO;
import com.hobbyfield.app.prdt.service.CommentVO;
import com.hobbyfield.app.prdt.service.PrdtService;
import com.hobbyfield.app.prdt.service.PrdtVO;
import com.hobbyfield.app.prdt.service.ReviewService;
import com.hobbyfield.app.prdt.service.ReviewVO;


@Controller
@RequestMapping("prdt/")
public class PrdtController {
	
	
	@Autowired
	PrdtService prdtService;
	
	@Autowired
	ReviewService reviewService;
	
	
	//상품목록조회
	@GetMapping("prdtList")
	public String prdtList(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		model.addAttribute("prdtList", prdtService.selectAllPrdt(scri));
		PageMaker pageMaker = new PageMaker(); pageMaker.setCri(scri);
		pageMaker.setTotalCount(prdtService.prdtCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		return "prdt/prdtList";
	}
	
	
	//상품상세보기
	@GetMapping("prdtInfo")
	public String prdtInfo(PrdtVO prdtVO, Model model) {
		model.addAttribute("prdtInfo", prdtService.selectPrdt(prdtVO.getPrdtId()));
		return "prdt/prdtInfo";
	}
	
	
	
	//상품등록폼
	@GetMapping("prdtInsert")
	public String insertPrdtForm() {
		return "prdt/prdtInsert";
	}
	//상품등록
	@PostMapping("prdtInsert")
	public String InsertPrdtProcess(PrdtVO prdtVO) {
		prdtService.insertPrdt(prdtVO);
		return "redirect:prdtList";
	}
	
	//상품수정폼
	@GetMapping("prdtUpdate")
	public String prdtUpdateForm(PrdtVO prdtVO, Model model) {
		model.addAttribute("prdtInfo", prdtService.selectPrdt(prdtVO.getPrdtId()));
		return "prdt/prdtUpdate";
	}
	
	//상품수정하기
	@PostMapping("prdtUpdate")
	public String prdtUpdate(PrdtVO prdtVO) {
		prdtService.updatePrdt(prdtVO);
		return "redirect:prdtList";
	}
	
	//등록상품삭제
	@PostMapping("prdtDelete")
	public String prdtDelete(PrdtVO prdtVO) {
		prdtService.deletePrdt(prdtVO.getPrdtId());
		return "redirect:prdtList";
	}
	
	//상품후기 작성
	@PostMapping("writeReview")
    @ResponseBody
    public void writeComment(@RequestBody ReviewVO reviewVO, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		reviewVO.setMemberEmail(member.getMemberEmail());
		reviewService.writeReview(reviewVO);
        
    }
	
	//상품후기 목록 (카테고리별)
	@PostMapping("getReviewsByCategory")
	@ResponseBody
	public List<ReviewVO> getReviewsByCategory(@RequestParam("category") String category) {
	       return reviewService.getReviewsByCategory(category);
	    }
		
		
	//상품후기(문의) 삭제
	@PostMapping("/deleteReview")
    @ResponseBody
    public String deleteReview(@RequestParam("reviewId") int reviewId) {
        try {
            reviewService.deleteReview(reviewId);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
	
	//상품후기(문의) 수정 
    @PostMapping("/updateReview")
    @ResponseBody
    public String updateReview(@RequestBody ReviewVO reviewVO) {
        reviewService.updateReview(reviewVO);
        return "success";
    }
    
    //댓글 작성
  	@PostMapping("/writeComment")
      @ResponseBody
      public String writeComment(@RequestBody CommentVO commentVO, HttpSession session) {
  		  MemberVO member = (MemberVO)session.getAttribute("member");
  		  commentVO.setMemberEmail(member.getMemberEmail());
          reviewService.wrtieComment(commentVO);
          return "success";
      }
  	
  	
  	//댓글 목록
  	@PostMapping("readComment")
  	@ResponseBody
  	public List<CommentVO> readComment(@RequestParam("reviewId") int reviewId) {
  	    List<CommentVO> comment = reviewService.readComment(reviewId);
  	    return comment;
  	}
  	
  	
 	
}
