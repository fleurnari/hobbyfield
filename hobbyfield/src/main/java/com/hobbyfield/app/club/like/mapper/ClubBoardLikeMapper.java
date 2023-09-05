package com.hobbyfield.app.club.like.mapper;

public interface ClubBoardLikeMapper {
	//좋아요 추가
	public int insertBoardLike(int boardNumber);
	//좋아요 삭제
	public int deleteBoardLike(int boardNumber);
	//좋아요 총합
	public int countBoardLike(int boardNumber);
	// 좋아요 불러오기(계정기준)
	
}