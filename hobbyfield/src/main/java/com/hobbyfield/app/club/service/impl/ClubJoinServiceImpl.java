package com.hobbyfield.app.club.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.club.mapper.ClubJoinMapper;
import com.hobbyfield.app.club.service.ClubJoinService;
import com.hobbyfield.app.club.service.ClubJoinVO;

@Service
public class ClubJoinServiceImpl implements ClubJoinService {

	@Autowired
	ClubJoinMapper clubJoinMapper;
	
	//소모임 가입신청 : 등록
	@Override
	public int clubJoinInfo(ClubJoinVO joinVO) {
		int result = clubJoinMapper.joinClub(joinVO);
		if(result == 1) {
			return joinVO.getApplyNumber();
		}
		return -1;
	}

}
