package com.hobbyfield.app.club.board.mapper;

import java.util.List;

import com.hobbyfield.app.club.board.service.ClubBoardVO;
import com.hobbyfield.app.club.service.CreateclubVO;

public interface ClubBoardMapper {
	
	// 전체 소모임 게시글 가져오기(메인페이지용)
	public List<ClubBoardVO> getAllClubBoardList();
	
	
	// 해당 소모임의 글만 가져오는 
	public List<ClubBoardVO> getSelectClubBoardList(CreateclubVO vo);
	
	
	// 현재 소모임의 글 검색
	public List<ClubBoardVO> searchClubBoardList(ClubBoardVO vo, String text);
	
	// 단건조회
	public ClubBoardVO getClubBoardInfo(ClubBoardVO vo);
		
	// 등록
	public int insertClubBoard(ClubBoardVO vo);
		
	// 수정
	public int updateClubBoard(ClubBoardVO vo);
	
	// 조회수
	public int updateViewClubBoard(ClubBoardVO vo);
	
	// 블라인드 처리
	public int updateBlindClubBoard(ClubBoardVO vo);

}
