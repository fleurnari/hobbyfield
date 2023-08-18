package com.hobbyfield.app.member.service;

public interface MemberService {
	
	// 회원 가입 수행
	public int insertMember(MemberVO memberVO);
	
	// 아이디 중복 체크
	public int idCheck(String memberEmail);
	
	// 로그인
	public MemberVO memberLogin(MemberVO memberVO);
	
	// 로그인 성공 시 최근 접속일 갱신
	public int memberLtstUpdate(MemberVO memberVO);
	
	// 금일 첫 로그인 시 활동 포인트 갱신
	public int memberPntUpdate(MemberVO memberVO);
	
}
