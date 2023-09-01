package com.hobbyfield.app.prdt.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ReviewService {
	
	//리뷰 작성
	public void writeReview(ReviewVO reviewVO);
	
	List<ReviewVO> getReviewsByCategory(String category);
	
	
	

}
