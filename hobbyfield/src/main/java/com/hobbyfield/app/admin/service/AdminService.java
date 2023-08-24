package com.hobbyfield.app.admin.service;

import java.util.List;

import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.member.service.MemberVO;

public interface AdminService {
	
	// 전체 회원 조회
	public List<MemberVO> selectMemberList(SearchCriteria scri);
	
	// 가입 대기 중 / 거부된 기업 회원 목록 조회
	public List<MemberVO> selectComMemberList(SearchCriteria scri);
	
	// 가입 승인 미처리 기업 회원 제외 전체 회원 수
	public int countMember(SearchCriteria scri);
	
	// 가입 승인 미처리 기업 회원 수
	public int countComMember(SearchCriteria scri);
	
	// 회원 상세 조회
	public MemberVO selectMember(MemberVO memberVO);
	
	// 기업 회원 가입 승인/거부
	public int updateComMember(MemberVO memberVO);
	
	// 회원 강제 탈퇴
	public int deleteMember(String memberEmail); 

}
