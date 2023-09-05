package com.hobbyfield.app.club.profile.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface ClubProfileService {
	
	//프로필 단건조회
	public ClubProfileVO getProfile(ClubProfileVO clubProfileVO);
	
	//프로필 등록
	public int insertProfile(ClubProfileVO clubProfileVO);
	
	//프로필화면 : 개인정보 조회
	public List<ClubProfileVO> getNomalMypage(ClubProfileVO clubprofileVO);
	
	// 자신의 프로필 가져오기
	public List<ClubProfileVO> getMyProfile(ClubProfileVO clubprofileVO);
	
	//닉네임 유효성검사
	public int nickChk(String profileNickname);
	
	//프로필 수정
	public Map<String, String> updateProfile(ClubProfileVO clubProfileVO);
	
	//프로필생성 3개확인
	public int getProfileCountByEmail(String email);

	public List<ClubProfileVO> getClubProfileVO(ClubProfileVO clubProfileVO);
	
}
