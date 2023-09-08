package com.hobbyfield.app.prdt.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.common.SearchCriteria;

public interface ReviewService {
	
	//등록된 후기(배송문의)의 수
	public int reviewCount(SearchCriteria scri);
	//리뷰 작성
	public void writeReview(ReviewVO reviewVO);
	
	//카테고리별 후기조회
	List<ReviewVO> getReviewsByCategory(String category, int prdtId);
	
	//후기(문의) 삭제
	void deleteReview(@Param("reviewId") int reviewId);
	
	//후기(문의) 수정
	public void updateReview(ReviewVO reviewVO);
	
	//댓글작성
	public void wrtieComment(CommentVO commentVO);
	
	//댓글목록조회
	public List<CommentVO> readComment(int reviewId);
	 
	
	//댓글삭제
	public void deleteComment(int commentId);
	
	//댓글수정
	public void updateComment(CommentVO commentVO);
	
	//댓글정보 불러오기
	CommentVO getCommentById(int commentId);
	
	//후기글 정보 불러오기
	ReviewVO getReviewById(int reviewId);
}
