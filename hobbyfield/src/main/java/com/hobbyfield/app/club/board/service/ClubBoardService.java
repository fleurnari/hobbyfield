package com.hobbyfield.app.club.board.service;

import java.util.List;

import com.hobbyfield.app.club.service.CreateclubVO;

public interface ClubBoardService {
	
	// 전체조회(전체 소모임 게시글 조회)
	public List<ClubBoardVO> getAllClubBoardList();
	
	// 소모임 상세보기 들어가서 원하는 소모임만 보기(매개변수)
	public List<ClubBoardVO> getSelectClubBoardList(CreateclubVO vo);
	
	// 게시글 검색 : 사용자 or 내용 
	public List<ClubBoardVO> searchClubBoard(ClubBoardVO vo, String text);
	
	// 전체 게시글 검색 : 사용자 or 내용
	public List<ClubBoardVO> AllSearchClubBoard(ClubBoardVO vo);
	
	// 단건조회
	public ClubBoardVO getClubBoardInfo(ClubBoardVO vo);
	
	// 등록
	public int insertClubBoard(ClubBoardVO vo);
	
	// 수정
	public int updateClubBoard(ClubBoardVO vo);
	
	// 조회수 
	public int updateViewClubBoard(ClubBoardVO vo);
	
	// 블라인드처리 
	public int updateBlindClubBoard(ClubBoardVO vo);
}
