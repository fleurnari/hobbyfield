package com.hobbyfield.app.club.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.club.mapper.CreateclubMapper;
import com.hobbyfield.app.club.service.CreateclubService;
import com.hobbyfield.app.club.service.CreateclubVO;

@Service
public class CreateclubServiceImpl implements CreateclubService {

	@Autowired
	CreateclubMapper createclubMapper;
	
	//소모임 전체조회 
	@Override
	public List<CreateclubVO> getCreateClubList() {
		return createclubMapper.selectClubAllList();
	}
	
	
	//소모임 등록
	@Override
	public int insertClubInfo(CreateclubVO createclubVO) {
		int result = createclubMapper.insertClub(createclubVO);
		
		if(result == 1) {
			return createclubVO.getClubNumber();
		}else {
			return -1;
		}
	
	}
	
	//소모임 수정
	@Override
	public Map<String, String> updateClub(CreateclubVO createclubVO) {
		Map<String, String> map = new HashMap<>();
		map.put("소모임이름", String.valueOf(createclubVO.getClubName()));
		
		int result = createclubMapper.updateClub(createclubVO);
		
		if(result > 0) {
			map.put("결과", "Success");
		}else {
			map.put("결과", "Fail");
		}
		return map;
	}

	//닉네임 중복체크
	@Override
	public int nickChk(String profileNickname) {
		return createclubMapper.nickChk(profileNickname);
	}

	//모임 이름 중복체크 
	@Override
	public int clubnameChk(String clubName) {
		return createclubMapper.clubnameChk(clubName);
	}

	/*==== 마이페이지	===============================	*/
	//프로필 이미지 등록
	@Override
	public int insertImgInfo(CreateclubVO createclubVO) {
		return createclubMapper.profileImg(createclubVO);
	}

	//프로필 내정보 조회
	@Override
	public List<CreateclubVO> getNomalMypage() {
		return createclubMapper.getNomalMypage();
	}

	//프로필 이미지 저장
	@Override
	public void saveProfileImagePath(CreateclubVO vo) {
		createclubMapper.profileImg(vo);
		
	}

	@Override
	public void insertProfileImage(CreateclubVO vo) throws Exception {
		try {
			createclubMapper.profileImg(vo);
		} catch (Exception e) {
			// 예외를 다시 throw하여 컨트롤러에서 처리하도록 합니다.
            throw new Exception("Failed to insert profile image. Check member details.", e);
		}
	}




}
