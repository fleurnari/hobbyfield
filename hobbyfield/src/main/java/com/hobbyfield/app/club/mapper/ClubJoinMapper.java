package com.hobbyfield.app.club.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.club.service.ClubJoinVO;

public interface ClubJoinMapper {

   //소모임 가입 신청
   public int joinClub(ClubJoinVO joinVO);
   
   //가입신청한 소모임 회원 조회
   public List<ClubJoinVO> joinClubMember(ClubJoinVO joinVO);
   
   //가입신청한 회원 insert(club_member) 
   public void insertClubMember(ClubJoinVO joinVO);
   
   //가입신청한 회원 update(club_apply)
   public void updateClubApplyStatus(@Param("profileNickname") String profileNickname, @Param("clubNumber") Integer clubNumber);
   
   //가입신청한 회원 거절 
   public void deleteClubApply(@Param("profileNickname") String profileNickname, @Param("clubNumber") Integer clubNumber);
   
   //소모임 탈퇴 
   public int quitClubMember(ClubJoinVO vo);
   
   // 특정 소모임 가입 멤버
   public List<ClubJoinVO> clubMember(@Param("clubNumber")int clubNumber);
   
   
   
   
   // 회원 불러오기
   public List<ClubJoinVO> memberListClub(@Param("clubNumber")int clubNumber);
   // 특정 회원 조회
   public ClubJoinVO memberInfoClub(ClubJoinVO vo);
}

