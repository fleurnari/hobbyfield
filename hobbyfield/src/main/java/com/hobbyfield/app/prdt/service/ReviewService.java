package com.hobbyfield.app.prdt.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ReviewService {
	
	//리뷰 작성
	public void writeReview(ReviewVO reviewVO);
	
	//카테고리별 후기조회
	List<ReviewVO> getReviewsByCategory(String category);
	
	//후기(문의) 삭제
	void deleteReview(@Param("reviewId") int reviewId);
	
	//후기(문의) 수정
	public void updateReview(ReviewVO reviewVO);
	 
}
