package com.hobbyfield.app.club.like.mapper;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.club.like.service.ClubBoardLikeVO;

public interface ClubBoardLikeMapper {
	// 좋아요 추가
	public int insertBoardLike(ClubBoardLikeVO clubBoardLikeVO);
	// 좋아요 삭제
	public int deleteBoardLike(ClubBoardLikeVO clubBoardLikeVO);
	// 좋아요 총합
	public int countBoardLike(int boardNumber);
	// 좋아요 눌렀는지 확인
	public int selectBoardLike(@Param("boardNumber") int boardNumber, @Param("profileNickname") String profileNickname);

}
