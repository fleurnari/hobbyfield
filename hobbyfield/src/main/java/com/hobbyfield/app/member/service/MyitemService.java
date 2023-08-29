package com.hobbyfield.app.member.service;

import java.util.List;


public interface MyitemService{
	
	public List<MyitemVO> selectMyItemAllList(MemberVO memberVO);
	
	// 포인트 차감 
	public int decreasePoint(MyitemVO myitemVO);
	
	//마이아이템 등록
	public int insertMyitem(MyitemVO myitemVO);
	
	
}
