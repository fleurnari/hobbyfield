package com.hobbyfield.app.member.service;

import java.util.List;

import com.hobbyfield.app.club.service.CreateclubVO;


public interface MyitemService{
	

	// 마이아이템 전체조회

	public List<MyitemVO> selectMyItemAllList(MemberVO memberVO);
	
	// 포인트 차감 
	public int decreasePoint(MyitemVO myitemVO);
	
	//마이아이템 등록
	public int insertMyitem(MyitemVO myitemVO);
	
	//소모임 증원권 사용
	public int updateUseterm(MyitemVO myitemVO);
	
	//소모임 증원권 적용
	public int updateClubTotal(CreateclubVO createclubVO);
}
