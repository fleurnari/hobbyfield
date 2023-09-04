package com.hobbyfield.app.prdt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.prdt.mapper.ReviewMapper;
import com.hobbyfield.app.prdt.service.ReviewService;
import com.hobbyfield.app.prdt.service.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewMapper reviewMapper;

	@Override
	public void writeReview(ReviewVO reviewVO) {
		reviewMapper.writeReview(reviewVO);
	}

	@Override
	public List<ReviewVO> getReviewsByCategory(String category) {
		return reviewMapper.getReviewsByCategory(category);
	}

	@Override
	public void deleteReview(int reviewId) {
		reviewMapper.deleteReview(reviewId);
		
	}

	@Override
	public void updateReview(ReviewVO reviewVO) {
		reviewMapper.updateReview(reviewVO);
	}





	

}
