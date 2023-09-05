package com.hobbyfield.app.club.like.service;

import java.util.List;

import com.hobbyfield.app.club.board.service.ClubBoardVO;

public interface ClubBoardLikeService {
	
	// 좋아요 추가
	public int insertBoardLike(int clubNumber);
	
	// 좋아요 삭제
	public int deleteBoardLike(int clubNubmer);
	
	// 좋아요 좋아요 총합(게시글기준)
	public int countBoardLike(int clubNumber);
	
	// 좋아요 불러오기(계정기준)
	public List<ClubBoardVO> getMyLikeBoard(String memberEmail);
}
