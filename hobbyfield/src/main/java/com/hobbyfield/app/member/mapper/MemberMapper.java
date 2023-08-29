package com.hobbyfield.app.member.mapper;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.member.service.MemberVO;

public interface MemberMapper {
	
	// 회원 가입
	public int insertMember(MemberVO memberVO);
	
	// 이메일 중복 체크
	public int chkMemberEmail(String memberEmail);
	
	// 로그인
	public MemberVO loginMember(MemberVO memberVO);
	
	// 로그인 성공 시 최근 접속일 갱신
	public int updateMemberLtst(MemberVO memberVO);
	
	// 금일 첫 로그인 시 활동포인트 갱신
	public int updateMemberPnt(MemberVO memberVO);
	
	// 회원 정보 수정
	public int updateMember(MemberVO memberVO);
	
	// 비밀번호 체크
	public String chkMemberPwd(String memberEmail);
	
	// 비밀번호 수정
	public void updateMemberPwd(@Param("memberEmail") String memberEmail, @Param("memberPwd") String encodePwd);
	
	// 회원 탈퇴
	public void deleteMember(String memberEmail);

}
