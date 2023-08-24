package com.hobbyfield.app.club.profile.service;

import java.util.List;
import java.util.Map;

public interface ClubProfileService {
//	//프로필이미지 등록
//	public int insertImgInfo(CreateclubVO createclubVO);
	
	//프로필 등록
	public int insertProfile(ClubProfileVO clubProfileVO);
	
	//프로필화면 : 개인정보 조회
	public List<ClubProfileVO> getNomalMypage(ClubProfileVO clubprofileVO);
	
	//닉네임 유효성검사
	public int nickChk(String profileNickname);
	
	//프로필 수정
	public Map<String, String> updateProfile(ClubProfileVO clubProfileVO);
	
}
