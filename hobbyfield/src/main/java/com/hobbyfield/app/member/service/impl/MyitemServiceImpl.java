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


	// 마이아이템 전체조회
		@Override
		public List<MyitemVO> selectMyItemAllList(String memberEmail) {
			return myitemMapper.selectMyItemAllList(memberEmail);
		}

		//포인트 차감
		@Override
		public int decreasePoint(MyitemVO myitemVO) { 
			return myitemMapper.decreasePoint(myitemVO);
		}

		//구매내역에 등록
		@Override
		public int insertMyitem(MyitemVO myitemVO) { 
			return myitemMapper.insertMyitem(myitemVO);
		}
	
}
