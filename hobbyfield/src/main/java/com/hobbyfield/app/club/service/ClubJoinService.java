package com.hobbyfield.app.club.service;

import java.util.List;

public interface ClubJoinService {

   //소모임 가입 신청
   public int clubJoinInfo(ClubJoinVO joinVO);
   
   //가입신청한 소모임 회원 조회
   public List<ClubJoinVO> joinClubMemberInfo(ClubJoinVO joinVO);
   
   //가입신청한 회원 수락
   public boolean acceptMember(ClubJoinVO joinVO);
   
   //가입신청한 회원 거절 
   public boolean rejectMember(String profileNickname, Integer clubNumber);
   
   // 소모임 탈퇴
   public int quitClubMember(ClubJoinVO vo);
   
   public List<ClubJoinVO> clubMemberList(int clubNumber);
 
   // 가입된 같은 소모임 멤버 조회
   public List<ClubJoinVO> memberListClub(int clubNumber);
   // 단일 소모임 멤버 조회
   public ClubJoinVO memberInfoClub(ClubJoinVO vo);
   
}
