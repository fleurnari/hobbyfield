package com.hobbyfield.app.member.mapper;

import com.hobbyfield.app.member.service.MemberVO;

public interface MemberMapper {
	
	// 회원 가입
	public int memberJoin(MemberVO memberVO);
	
	// 아이디 중복 체크
	public int idCheck(String memberEmail);
	
	// 로그인
	public MemberVO memberLogin(MemberVO memberVO);
	
	// 로그인 성공 시 최근 접속일 갱신
	public int memberLtstUpdate(MemberVO memberVO);
	
	// 금일 첫 로그인 시 활동포인트 갱신
	public int memberPntUpdate(MemberVO memberVO);
	
	// 회원 정보 수정
	public int memberUpdate(MemberVO memberVO);
	
	// 비밀번호 수정
	public int memberPwdUpdate(MemberVO memberVO);
	
	// 회원 탈퇴
	public int memberDelete(MemberVO memberVO);

}
