package com.hobbyfield.app.member.mapper;

import java.util.List;

import com.hobbyfield.app.club.service.CreateclubVO;
import com.hobbyfield.app.member.service.MemberVO;
import com.hobbyfield.app.member.service.MyitemVO;

public interface MyitemMapper {


	//마이아이템 전체조회
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
