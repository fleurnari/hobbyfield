package com.hobbyfield.app.club.member.service;

import java.util.List;

public interface ClubMemberService {
	
	// 내가 가입한 소모임
	public List<ClubMemberVO> getMyClubList(String memberEmail);
	
	// 내 소모임에 가입한 회원 
	public List<ClubMemberVO> getMyClubMemberList();
	
}
