package com.hobbyfield.app.club.profile.service;

import java.util.List;
import java.util.Map;

public interface ClubProfileService {
	
	//프로필 단건조회
	public ClubProfileVO getProfile(ClubProfileVO clubProfileVO);
	
	//프로필 등록
	public int insertProfile(ClubProfileVO clubProfileVO);
	
	//프로필화면 : 개인정보 조회
	public List<ClubProfileVO> getNomalMypage(ClubProfileVO clubprofileVO);
	
	// 자신의 프로필 모두 가져오기
	public List<ClubProfileVO> getMyProfile(ClubProfileVO clubprofileVO);
	
	//닉네임 유효성검사
	public int nickChk(String profileNickname);
	
	//프로필 수정
	public Map<String, String> updateProfile(ClubProfileVO clubProfileVO);
	
	// 소모임에 맞는 프로필 가져오기
	public ClubProfileVO insertSession();
	
}
