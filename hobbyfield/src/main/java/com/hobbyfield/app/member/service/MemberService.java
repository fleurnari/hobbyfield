package com.hobbyfield.app.member.service;

import java.util.HashMap;

public interface MemberService {
	
	// 회원 가입 수행
	public int insertMember(MemberVO memberVO);
	
	// 아이디 중복 체크
	public int chkMemberEmail(String memberEmail);
	
	// 로그인
	public MemberVO loginMember(MemberVO memberVO);
	
	// 로그인 성공 시 최근 접속일 갱신
	public int updateMemberLtst(MemberVO memberVO);
	
	// 금일 첫 로그인 시 활동 포인트 갱신
	public int updateMemberPnt(MemberVO memberVO);
	
	// 카카오 로그인 토큰 얻어오기
	public String getAccessToken (String authorize_code);
	
	// 카카오 로그인 유저 정보 얻어오기
	public HashMap<String, Object> getUserInfo(String access_Token);
	
	// 회원 정보 수정
	public int updateMember(MemberVO memberVO);
	
	// 비밀번호 체크
	public String chkMemberPwd(String memberEmail);
	
	// 비밀번호 수정
	public void updateMemberPwd(String memberEmail, String encodePwd);
	
	// 회원 탈퇴
	public void deleteMember(String memberEmail);
	
}
