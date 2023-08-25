package com.hobbyfield.app.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.member.mapper.MyitemMapper;
import com.hobbyfield.app.member.service.MyitemService;
import com.hobbyfield.app.member.service.MyitemVO;

@Service
public class MyitemServiceImpl implements MyitemService{

	@Autowired
	MyitemMapper myitemMapper;

	@Override
	public List<MyitemVO> selectMyItemAllList() {
		return myitemMapper.selectMyItemAllList();
	}
	
	// 마이아이템 전체조회

//	// 마이아이템 저장
//	@Override
//	public int getInsertMyitem(MyitemVO myitemVO) {
//		return "0;
//	}


}
