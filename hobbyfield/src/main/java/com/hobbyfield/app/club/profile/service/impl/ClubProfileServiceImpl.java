package com.hobbyfield.app.club.profile.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.club.profile.mapper.ClubProfileMapper;
import com.hobbyfield.app.club.profile.service.ClubProfileService;
import com.hobbyfield.app.club.profile.service.ClubProfileVO;

@Service
public class ClubProfileServiceImpl implements ClubProfileService {

	@Autowired
	ClubProfileMapper clubprofileMapper;
	
	//프로필 단건조회
	@Override
	public ClubProfileVO getProfile(ClubProfileVO clubProfileVO) {
		return clubprofileMapper.selectProfileInfo(clubProfileVO);
	}
	
	//프로필 등록
	@Override
	public int insertProfile(ClubProfileVO clubProfileVO) {
		return clubprofileMapper.insertProfile(clubProfileVO);
	}
	
	//개인 프로필 조회
	@Override
	public List<ClubProfileVO> getNomalMypage(ClubProfileVO clubprofileVO) {
		return clubprofileMapper.getNomalMypage(clubprofileVO);
	}

	
	//닉네임 중복체크
	@Override
	public int nickChk(String profileNickname) {
		return clubprofileMapper.nickChk(profileNickname);
		}

	//프로필 생성 3개제한
	@Override
    public int getProfileCountByEmail(String email) {
        return clubprofileMapper.getProfileCountByEmail(email);
    }
	
	//프로필 수정
	@Override
	public Map<String, String> updateProfile(ClubProfileVO clubProfileVO) {
	    int updatedRows = clubprofileMapper.updateProfile(clubProfileVO);
	    Map<String, String> result = new HashMap<>();
	    if (updatedRows > 0) {
	        result.put("status", "success");
	        result.put("message", "Profile updated successfully.");
	    } else {
	        result.put("status", "fail");
	        result.put("message", "No rows updated.");
	    }
	    return result;
	}


	//프로필 생성 3개 제한
	@Override
	public List<ClubProfileVO> getMyProfile(ClubProfileVO clubprofileVO) {
		
		return clubprofileMapper.getMyProfile(clubprofileVO);
	}

	//프로필 조회
	@Override
	public List<ClubProfileVO> getClubProfileVO(ClubProfileVO clubProfileVO) {
		System.out.println(clubProfileVO);
		return clubprofileMapper.getClubProfileVO(clubProfileVO);
	}

}
