package com.hobbyfield.app.member.service;

public interface MemberService {
	
	// 회원 가입 수행
	public int insertMember(MemberVO memberVO);
	
	// 아이디 중복 체크
	public int idCheck(String memberEmail);
	
}
