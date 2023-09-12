package com.hobbyfield.app.prdt.web;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobbyfield.app.common.PageMaker;
import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.csboard.service1.CSReplyVO;
import com.hobbyfield.app.member.service.MemberVO;
import com.hobbyfield.app.prdt.order.service.OrderService;
import com.hobbyfield.app.prdt.order.service.OrderVO;
import com.hobbyfield.app.prdt.service.CommentVO;
import com.hobbyfield.app.prdt.service.LikeService;
import com.hobbyfield.app.prdt.service.LikeVO;
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
	
	@Autowired
	LikeService likeService;
	
	@Autowired
	OrderService orderService;
	
	@GetMapping("/getGrd")
	   public String getCurrentUserGrd(HttpSession session, Model model) {
	       String memberGrd = (String) session.getAttribute("memberGrd");
	       model.addAttribute("memberGrd", memberGrd);
	       return "prdt/prdtInfo";
	}
	
	@GetMapping("getMemberEmail")
	   public String getEmail(HttpSession session, Model model) {
			MemberVO memberEmail = (MemberVO) session.getAttribute("memberEmail");
	       model.addAttribute("memberEmail", memberEmail);
	       return "prdt/prdtInfo";
	}
	
	//상품목록조회
	@GetMapping("prdtList")
	public String prdtList(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpSession session) {
		model.addAttribute("prdtList", prdtService.selectAllPrdt(scri));
		PageMaker pageMaker = new PageMaker(); pageMaker.setCri(scri);
		pageMaker.setTotalCount(prdtService.prdtCount(scri));
		
	    MemberVO member = (MemberVO) session.getAttribute("member");
	    String memberGrd = member.getMemberGrd();
	    model.addAttribute("memberGrd", memberGrd);
	    
		model.addAttribute("pageMaker", pageMaker);
		return "prdt/prdtList";
	}
	
	
	//상품상세보기
	@GetMapping("prdtInfo")
	public String prdtInfo(PrdtVO prdtVO, Model model, HttpSession session ) {
		MemberVO member = (MemberVO) session.getAttribute("member");
	    String memberGrd = member.getMemberGrd();
	    model.addAttribute("memberGrd", memberGrd);
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
	public String InsertPrdtProcess(PrdtVO prdtVO,  HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("member");
		prdtVO.setMemberEmail(member.getMemberEmail());
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
	public ResponseEntity<String> writeComment(@RequestBody ReviewVO reviewVO, HttpSession session) {
	    MemberVO member = (MemberVO) session.getAttribute("member");

	    // 후기의 카테고리가 "상품문의"인 경우 바로 작성가능
	    if ("상품문의".equals(reviewVO.getCategory())) {
	        reviewVO.setMemberEmail(member.getMemberEmail());
	        reviewService.writeReview(reviewVO);
	        System.out.println("상품문의 작성 성공: " + reviewVO.toString());
	        return new ResponseEntity<>("success", HttpStatus.OK); // 성공 응답 반환
	    }

	    // 해당 회원의 구매 이력을 조회합니다.
	    List<OrderVO> orderList = orderService.orderList(member.getMemberEmail());

	    Set<Integer> purchasedProducts = new HashSet<>();

	    for (OrderVO order : orderList) {
	        purchasedProducts.add(order.getPrdtId());
	    }

	    // reviewVO에 있는 prdtId를 확인하여 구매한 상품인지 확인
	    if (purchasedProducts.contains(reviewVO.getPrdtId())) {
	        reviewVO.setMemberEmail(member.getMemberEmail());
	        reviewService.writeReview(reviewVO);
	        System.out.println("리뷰 작성 성공: " + reviewVO.toString());
	        return new ResponseEntity<>("success", HttpStatus.OK); 
	    } else {
	        System.out.println("리뷰 작성 실패 - 구매한 상품이 아님: " + reviewVO.toString());
	        return new ResponseEntity<>("구매한 사람만 후기를 작성할 수 있습니다.", HttpStatus.BAD_REQUEST);
	    }
	}

	
	//상품후기 목록 (카테고리별)
	@PostMapping("getReviewsByCategory")
	@ResponseBody
	public List<ReviewVO> getReviewsByCategory(@RequestParam(value = "category") String cate, @RequestParam(value = "prdtId") int id) {
	       return reviewService.getReviewsByCategory(cate,id);
	    }
		
		
	//상품후기(문의) 삭제
	@PostMapping("/deleteReview")
	@ResponseBody
	public ResponseEntity<String> deleteReview(@RequestParam("reviewId") int reviewId, HttpSession session) {
	    MemberVO member = (MemberVO) session.getAttribute("member");


	    String memberEmail = member.getMemberEmail();
	    ReviewVO existingReview = reviewService.getReviewById(reviewId);

	    if (existingReview == null) {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("리뷰를 찾을 수 없습니다.");
	    }

	    // 리뷰 작성자와 현재 사용자 비교
	    if (!memberEmail.equals(existingReview.getMemberEmail())) {
	        return ResponseEntity.status(HttpStatus.FORBIDDEN).body("리뷰 작성자만 삭제할 수 있습니다.");
	    }

	    try {
	        reviewService.deleteReview(reviewId);
	        return ResponseEntity.ok("success");
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("리뷰 삭제에 실패했습니다.");
	    }
	}
	
	//상품후기(문의) 수정 
	@PostMapping("/updateReview")
	@ResponseBody
	public ResponseEntity<String> updateReview(@RequestBody ReviewVO reviewVO, HttpSession session) {
	    MemberVO member = (MemberVO) session.getAttribute("member");


	    String memberEmail = member.getMemberEmail();
	    ReviewVO existingReview = reviewService.getReviewById(reviewVO.getReviewId());

	    if (existingReview == null) {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("리뷰를 찾을 수 없습니다.");
	    }

	    // 리뷰 작성자와 현재 사용자 비교
	    if (!memberEmail.equals(existingReview.getMemberEmail())) {
	        return ResponseEntity.status(HttpStatus.FORBIDDEN).body("리뷰 작성자만 수정할 수 있습니다.");
	    }

	    try {
	        reviewService.updateReview(reviewVO);
	        return ResponseEntity.ok("success");
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("리뷰 수정에 실패했습니다.");
	    }
	}
    
    //댓글 작성
    @PostMapping("/writeComment")
    @ResponseBody
    public String writeComment(@RequestBody CommentVO commentVO, HttpSession session) {
        MemberVO member = (MemberVO) session.getAttribute("member");
        String memberEmail = member.getMemberEmail(); // 세션에서 이메일 값을 가져옴
        System.out.println("값 불러 옴????: " + memberEmail); // 값을 출력
        commentVO.setMemberEmail(member.getMemberEmail());
        
        String memberGrd = member.getMemberGrd();
        commentVO.setMemberGrd(memberGrd);
        
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
  	
  	
  	//댓글삭제
  	@PostMapping("/deleteComment/{commentId}")
  	public ResponseEntity<Map<String, String>> deleteComment(@PathVariable int commentId, HttpSession session) {
  	    Map<String, String> response = new HashMap<>();
  	    MemberVO member = (MemberVO) session.getAttribute("member");
  	    
  	    
  	    String memberEmail = member.getMemberEmail(); // 세션에서 이메일 값을 가져옴

  	    try {
  	        CommentVO comment = reviewService.getCommentById(commentId); // 댓글 정보 가져오기
  	        if (comment == null) {
  	            response.put("error", "댓글을 찾을 수 없습니다.");
  	            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
  	        }

  	        // 댓글 작성자와 현재 사용자 비교
  	        if (!memberEmail.equals(comment.getMemberEmail())) {
  	            response.put("error", "댓글 작성자만 삭제할 수 있습니다.");
  	            return ResponseEntity.status(HttpStatus.FORBIDDEN).body(response);
  	        }

  	        reviewService.deleteComment(commentId); // 댓글 삭제
  	        response.put("message", "댓글이 삭제되었습니다.");
  	        return ResponseEntity.ok(response);
  	    } catch (Exception e) {
  	        response.put("error", "댓글 삭제에 실패했습니다.");
  	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
  	    }
  	}
  	
  	//댓글수정
  	@PostMapping("updateComment")
  	@ResponseBody
  	public ResponseEntity<String> updateComment(@RequestBody CommentVO commentVO, HttpSession session) {
  	    MemberVO member = (MemberVO) session.getAttribute("member");


  	    String memberEmail = member.getMemberEmail();
  	    CommentVO existingComment = reviewService.getCommentById(commentVO.getCommentId());

  	    if (existingComment == null) {
  	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("댓글을 찾을 수 없습니다.");
  	    }

  	    // 댓글 작성자와 현재 사용자 비교
  	    if (!memberEmail.equals(existingComment.getMemberEmail())) {
  	        return ResponseEntity.status(HttpStatus.FORBIDDEN).body("댓글 작성자만 수정할 수 있습니다.");
  	    }

  	    try {
  	        reviewService.updateComment(commentVO);
  	        return ResponseEntity.ok("success"); // 클라이언트와 일치하는 응답 메시지
  	    } catch (Exception e) {
  	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("실패 ㅠ.");
  	    }
  	}
	
  	
  //상품 좋아요
 	@PostMapping("/prdtLike")
    @ResponseBody
    public String handleLikeRequest(@RequestBody LikeVO likeVO, HttpSession session) {
 		 MemberVO member = (MemberVO) session.getAttribute("member");
 	    likeVO.setMemberEmail(member.getMemberEmail());
 	    
 	    // 중복 좋아요 체크
 	    int likeCount = likeService.checkLike(likeVO);
 	    
 	    if (likeCount == 0) {
 	        likeService.likePrdt(likeVO); // 좋아요 추가
 	        prdtService.prdtLikeCount(likeVO.getPrdtId());
 	        return "success";
 	    } else {
 	        // 사용자가 취소 여부를 클라이언트에서 확인하므로 이 부분에서는 취소 처리만 진행
 	        likeService.deleteLike(likeVO); // 좋아요 취소
 	        prdtService.prdtLikeCount(likeVO.getPrdtId());
 	        return "cancelled"; // 취소가 완료되었음을 클라이언트에 반환
 	    }
    }
  
  	
  	
  	//상품 좋아요 취소
  	 @PostMapping("removeLike")
     @ResponseBody
     public String removeLike(@RequestBody LikeVO likeVO) {
         likeService.deleteLike(likeVO);
         return "success";
     }
  	
  	
  	
 	
}
