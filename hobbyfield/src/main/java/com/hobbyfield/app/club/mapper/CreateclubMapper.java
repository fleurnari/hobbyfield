package com.hobbyfield.app.club.mapper;

import java.util.List;

import com.hobbyfield.app.club.service.CreateclubVO;

public interface CreateclubMapper {
	
	//소모임 전체조회
	public List<CreateclubVO> selectClubAllList();
	
	//소모임 세부조회
	
	
	//소모임 등록
	public int insertClub(CreateclubVO createclubVO);
	
	//지역 리스트
	public List<CreateclubVO> clubLocationVO();
	
	//소모임 수정
	
	//소모임 삭제?
	
	//닉네임 중복체크
	public int nickChk(String profileNickname);
	
	//소모임 이름 중복체크
	public int clubnameChk(String clubName);
	
	//프로필 이미지등록
	public int insertImg(CreateclubVO createclubVO); 
	
}
