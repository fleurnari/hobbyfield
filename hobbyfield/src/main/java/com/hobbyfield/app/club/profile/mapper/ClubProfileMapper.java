package com.hobbyfield.app.club.profile.mapper;

import java.util.List;
import java.util.Map;

import com.hobbyfield.app.club.profile.service.ClubProfileVO;
import com.hobbyfield.app.comm.service.CommCodeVO;

public interface ClubProfileMapper {
	
	//프로필 등록
	public int insertProfile(ClubProfileVO clubProfileVO);
		
	//프로필 화면 : 개인정보 조회
	public List<ClubProfileVO> getNomalMypage(ClubProfileVO clubProfileVO);
	
	//프로필 수정
	public int updateProfile(ClubProfileVO clubProfileVO);
	
	//닉네임 중복체크
	public int nickChk(String profileNickname);
	
	//모임 생성시 프로필 선택
	List<ClubProfileVO> selectClubProfile(String email);
}
