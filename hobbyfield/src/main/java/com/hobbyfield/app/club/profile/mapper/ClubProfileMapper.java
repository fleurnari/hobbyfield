package com.hobbyfield.app.club.profile.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.hobbyfield.app.club.profile.service.ClubProfileVO;

public interface ClubProfileMapper {
	

	//프로필 단건조회
	public ClubProfileVO selectProfileInfo(ClubProfileVO clubProfileVO);

	// 프로필 등록
	public int insertProfile(ClubProfileVO clubProfileVO);
		
	// 프로필 화면 : 개인정보 조회
	public List<ClubProfileVO> getNomalMypage(ClubProfileVO clubProfileVO);
	
	// 프로필 수정
	public int updateProfile(ClubProfileVO clubProfileVO);

	
	// 닉네임 중복체크
	public int nickChk(String profileNickname);
	
	// 나의 프로필 전체 조회
	public List<ClubProfileVO> getMyProfile(ClubProfileVO vo);
	
	// 가입된 소모임일시 프로필에 넣은 이름, 이미지 가져오는 mapper
	public ClubProfileVO getSessionProfile(@Param("memberEmail") String memberEmail, @Param("clubNumber") int clubNumber);
	
	//모임 생성시 프로필 선택
	public List<ClubProfileVO> selectClubProfile(String email);
	
	
}
