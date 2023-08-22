package com.hobbyfield.app.club.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

public interface CreateclubService {
	
	//소모임 전체조회
	public List<CreateclubVO> getCreateClubList();
	
	//소모임 세부조회
	
	//소모임 등록
	public int insertClubInfo(CreateclubVO createclubVO);
	
	//소모임 수정
	public Map<String, String> updateClub(CreateclubVO createclubVO);
	
	//소모임 삭제?
	
	//닉네임 중복체크
	public int nickChk(String profileNickname);
	
	//소모임 중복체크
	public int clubnameChk(String clubName);
	
	
	
	//프로필이미지 등록
	public int insertImgInfo(CreateclubVO createclubVO);
	
	//프로필화면 : 개인정보 조회
	public List<CreateclubVO> getNomalMypage();
	
	public void saveProfileImagePath(CreateclubVO vo);
	public void insertProfileImage(CreateclubVO vo) throws Exception;;
}
