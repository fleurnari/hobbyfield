package com.hobbyfield.app.createclub.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.createclub.mapper.CreateclubMapper;
import com.hobbyfield.app.createclub.service.CreateclubService;
import com.hobbyfield.app.createclub.service.CreateclubVO;

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

	//닉네임 중복체크
	@Override
	public int nickChk(String profileNickname) throws Exception {
		return createclubMapper.nickChk(profileNickname);
	}

	//모임 이름 중복체크
	@Override
	public int clubnameChk(String clubName) throws Exception {
		return createclubMapper.clubnameChk(clubName);
	}


}
