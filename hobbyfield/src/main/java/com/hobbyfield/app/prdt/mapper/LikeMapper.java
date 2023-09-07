package com.hobbyfield.app.prdt.mapper;

import com.hobbyfield.app.prdt.service.LikeVO;

public interface LikeMapper {
	
	//좋아요
	public void likePrdt(LikeVO likeVO);
	//좋아요 취소 
	public void deleteLike(LikeVO likeVO);
	//좋아요 중복체크(한 번만 할 수 있게)
	public int likeCount(int prdtId);
	//상품당 좋아요 갯수
	public int checkLike(LikeVO likeVO);
}
