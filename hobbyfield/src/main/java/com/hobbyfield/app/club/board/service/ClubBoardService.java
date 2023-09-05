package com.hobbyfield.app.club.board.service;

import java.util.List;
import java.util.Map;

import com.hobbyfield.app.club.service.CreateclubVO;
import com.hobbyfield.app.member.service.MemberVO;

public interface ClubBoardService {
	
	// 전체조회(전체 소모임 게시글 조회)
	public List<ClubBoardVO> getAllClubBoardList();
	
	// 소모임 상세보기 들어가서 원하는 소모임만 보기(매개변수)
	public List<ClubBoardVO> getSelectClubBoardList(Map<String,Integer> map);
	
	// 게시글 검색 : 사용자 or 내용 
	public List<ClubBoardVO> searchClubBoard(int clubNumber, String text);
	
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
	
	// 게시글 작성 활동 포인트 적립
	public int updateMemberPnt(MemberVO memberVO);
	
}
