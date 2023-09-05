package com.hobbyfield.app.club.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.club.board.service.ClubBoardVO;
import com.hobbyfield.app.club.service.CreateclubVO;
import com.hobbyfield.app.member.service.MemberVO;

public interface ClubBoardMapper {
	
	// 전체 소모임 게시글 가져오기(메인페이지용)
	public List<ClubBoardVO> getAllClubBoardList();
	
	// 소모임 내 조회(로그인한 프로필의 가입된소모임 게시글만 가져오게 매개변수)
	public List<ClubBoardVO> getSelectClubBoardList(CreateclubVO vo);
	
	// 단건조회
	public ClubBoardVO getClubBoardInfo(ClubBoardVO vo);
	
	// 소모임내 게시글 검색
	public List<ClubBoardVO> searchClubBoardList(@Param("clubNumber") int clubNumber , @Param("text") String text);
	
	// 등록
	public int insertClubBoard(ClubBoardVO vo);
		
	// 수정
	public int updateClubBoard(ClubBoardVO vo);
	
	// 조회수
	public int updateViewClubBoard(ClubBoardVO vo);
	
	// 블라인드 처리
	public int updateBlindClubBoard(ClubBoardVO vo);
	
	// 게시글 작성 활동 포인트 적립
	public int updateMemberPnt(MemberVO memberVO);
	
	// 무한스크롤을 위한.
	public List<ClubBoardVO> getClubBoardScroll(Map<String,Integer> map);

}
