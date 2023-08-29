package com.hobbyfield.app.club.mapper;

import com.hobbyfield.app.club.service.ClubJoinVO;

public interface ClubJoinMapper {

	//소모임 가입 신청
	public int joinClub(ClubJoinVO joinVO);
	
}
