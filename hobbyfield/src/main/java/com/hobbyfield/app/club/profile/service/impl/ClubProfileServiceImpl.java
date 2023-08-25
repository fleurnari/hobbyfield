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

	@Override
	public Map<String, String> updateProfile(ClubProfileVO clubProfileVO) {
		Map<String, String> map = new HashMap<>();
		map.put("닉네임", String.valueOf(clubProfileVO.getProfileNickname()));
		
		int result = clubprofileMapper.updateProfile(clubProfileVO);
		
		if(result > 0) {
			map.put("결과", "success");
		}else {
			map.put("결과", "fail");
		}
		
		return map;
	}

	
}
