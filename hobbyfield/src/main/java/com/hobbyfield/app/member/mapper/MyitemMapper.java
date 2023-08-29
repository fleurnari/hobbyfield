package com.hobbyfield.app.member.mapper;

import java.util.List;

import com.hobbyfield.app.member.service.MyitemVO;

public interface MyitemMapper {

	//마이아이템 전체조회
	public List<MyitemVO> selectMyItemAllList(String memberEmail);
	
	// 포인트 차감 
	public int decreasePoint(MyitemVO myitemVO);
	
	//마이아이템 등록
	public int insertMyitem(MyitemVO myitemVO);
	
}
