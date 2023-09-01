package com.hobbyfield.app.prdt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.prdt.service.ReviewVO;

public interface ReviewMapper {
	
	 //리뷰 작성
	 public void writeReview(ReviewVO reviewVO);
	 
	 //카테고리별 후기조회
	 List<ReviewVO> getReviewsByCategory(String category);
	 
}
