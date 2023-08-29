package com.hobbyfield.app.member.mapper;

import java.util.List;

import com.hobbyfield.app.member.service.MemberVO;
import com.hobbyfield.app.member.service.MyitemVO;

public interface MyitemMapper {

	public List<MyitemVO> selectMyItemAllList(MemberVO memberVO);
	
	
}
