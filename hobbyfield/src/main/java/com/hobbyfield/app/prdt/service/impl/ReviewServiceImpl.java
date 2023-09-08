package com.hobbyfield.app.prdt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.prdt.mapper.ReviewMapper;
import com.hobbyfield.app.prdt.service.CommentVO;
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
	public List<ReviewVO> getReviewsByCategory(String category, int prdtId) {
		return reviewMapper.getReviewsByCategory(category, prdtId);
	}
	
	@Override
	public void deleteReview(int reviewId) {
		reviewMapper.deleteReview(reviewId);
		
	}

	@Override
	public void updateReview(ReviewVO reviewVO) {
		reviewMapper.updateReview(reviewVO);
	}

	@Override
	public void wrtieComment(CommentVO commentVO) {
		
		reviewMapper.wrtieComment(commentVO);
		
	}

	@Override
	public List<CommentVO> readComment(int reviewId) {
		return reviewMapper.readComment(reviewId);
	}


	@Override
	public void deleteComment(int commentId) {
		
		reviewMapper.deleteComment(commentId);
	}

	@Override
	public void updateComment(CommentVO commentVO) {
		reviewMapper.updateComment(commentVO);
	}

	@Override
	public int reviewCount(SearchCriteria scri) {
		return reviewMapper.reviewCount(scri);
	}

	@Override
	public CommentVO getCommentById(int commentId) {
		
		return reviewMapper.getCommentById(commentId);
	}

	@Override
	public ReviewVO getReviewById(int reviewId) {
		return reviewMapper.getReviewById(reviewId);
	}




	

}
