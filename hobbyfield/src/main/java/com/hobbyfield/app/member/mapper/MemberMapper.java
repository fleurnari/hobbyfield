package com.hobbyfield.app.member.mapper;

import com.hobbyfield.app.member.service.MemberVO;

public interface MemberMapper {
	
	// 회원 가입
	public int memberJoin(MemberVO memberVO);
	
	// 아이디 중복 체크
	public int idChk(MemberVO memberVO);
	
	// 로그인

}
