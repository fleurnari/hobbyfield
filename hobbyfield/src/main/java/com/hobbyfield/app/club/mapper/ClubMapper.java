package com.hobbyfield.app.club.mapper;

import java.util.List;

import com.hobbyfield.app.club.service.ClubVO;

public interface ClubMapper {
	//소모임 전체조회
	public List<ClubVO> selectClubAllList();
	
	//소모임 세부조회
	
	
	//소모임 등록
	public int insertClub(ClubVO createclubVO);
	
	//지역 리스트
	public List<ClubVO> createclubVO();
	
	//소모임 수정
	
	//소모임 삭제?
	
	//닉네임 중복체크
	public int nickChk(String profileNickname);
	
	//소모임 이름 중복체크
	public int clubnameChk(String clubName);
	
}
