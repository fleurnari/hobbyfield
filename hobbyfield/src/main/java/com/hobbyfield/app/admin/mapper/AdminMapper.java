package com.hobbyfield.app.admin.mapper;

import java.util.List;

import com.hobbyfield.app.member.service.MemberVO;

public interface AdminMapper {
	
	// 전체 회원 조회
	public List<MemberVO> selectMemberList();
	
	// 가입 대기 중인 기업 회원 목록 조회
	public List<MemberVO> selectComMemberList();
	
	// 회원 상세 조회
	public MemberVO selectMember(MemberVO memberVO);
	
	// 기업 회원 가입 승인/거부
	public int updateComMember(MemberVO memberVO);
	
	// 회원 강제 탈퇴
	public int deleteMember(String memberEmail); 
	
}
