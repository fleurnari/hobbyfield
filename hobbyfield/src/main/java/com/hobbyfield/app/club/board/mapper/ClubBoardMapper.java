package com.hobbyfield.app.club.board.mapper;

import java.util.List;

import com.hobbyfield.app.club.board.service.ClubBoardVO;

public interface ClubBoardMapper {
	
	
	// 전체조회(로그인한 프로필의 가입된소모임 게시글만 가져오게 매개변수)
	public List<ClubBoardVO> getClubBoardList();
		
	// 단건조회
	public ClubBoardVO getClubBoardInfo(ClubBoardVO vo);
		
	// 등록
	public int insertClubBoard(ClubBoardVO vo);
		
	// 수정
	public int updateClubBoard(ClubBoardVO vo);
	
}
