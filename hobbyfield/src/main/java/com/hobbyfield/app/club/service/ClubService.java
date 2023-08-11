package com.hobbyfield.app.club.service;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface ClubService {
	
	//소모임 전체조회
	public List<ClubVO> getCreateClubList();
	
	//소모임 세부조회
	
	//소모임 등록
	public int insertClubInfo(ClubVO createclubVO);
	
	//소모임 수정
	
	//소모임 삭제?
	
	//닉네임 중복체크
	public int nickChk(String profileNickname) throws Exception;
	
	//소모임 중복체크
	public int clubnameChk(String clubName) throws Exception;
	
	
}
