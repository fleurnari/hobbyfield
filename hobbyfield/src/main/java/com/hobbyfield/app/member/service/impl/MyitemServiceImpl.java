package com.hobbyfield.app.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.club.service.CreateclubVO;
import com.hobbyfield.app.member.mapper.MyitemMapper;
import com.hobbyfield.app.member.service.MemberVO;
import com.hobbyfield.app.member.service.MyitemService;
import com.hobbyfield.app.member.service.MyitemVO;

@Service
public class MyitemServiceImpl implements MyitemService {

	@Autowired
	MyitemMapper myitemMapper;

	// 마이아이템 전체조회
	@Override
	public List<MyitemVO> selectMyItemAllList(MemberVO memberVO) {

		return myitemMapper.selectMyItemAllList(memberVO);
	}

	// 포인트 차감
	@Override
	public int decreasePoint(MyitemVO myitemVO) {
		return myitemMapper.decreasePoint(myitemVO);
	}

	// 구매내역에 등록
	@Override
	public int insertMyitem(MyitemVO myitemVO) {
		return myitemMapper.insertMyitem(myitemVO);
	}
	
	//소모임 증원권 사용
	@Override
	public int updateUseterm(MyitemVO myitemVO) {
		return myitemMapper.updateUseterm(myitemVO);
	}

	//소모임 증원권 적용
	@Override
	public int updateClubTotal(CreateclubVO createclubVO) {
		return myitemMapper.updateClubTotal(createclubVO);
	}


}
