package com.hobbyfield.app.prdt.service;

public interface LikeService {
	
	
	public void likePrdt(LikeVO likeVO);
	
	public void deleteLike(LikeVO likeVO);
	
	public int likeCount(int prdtId);
	
	public int checkLike(LikeVO likeVO);
}
