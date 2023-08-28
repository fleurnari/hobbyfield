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
	
	//소모임 세부조회
	@Override
	public CreateclubVO getClub(CreateclubVO createclubVO) {
		return createclubMapper.selectClubInfo(createclubVO);
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

	//모임 이름 중복체크 
	@Override
	public int clubnameChk(String clubName) {
		return createclubMapper.clubnameChk(clubName);
	}


	// 소모임 검색
	@Override
	public List<CreateclubVO> searchClub(CreateclubVO createclubVO) {
		return null;
	}

	
	
}
