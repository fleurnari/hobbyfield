package com.hobbyfield.app.club.mapper;

import java.util.List;

import com.hobbyfield.app.club.service.ClubJoinVO;

public interface ClubJoinMapper {

   //소모임 가입 신청
   public int joinClub(ClubJoinVO joinVO);
   
   //가입신청한 소모임 회원 조회
   public List<ClubJoinVO> joinClubMember(ClubJoinVO joinVO);
}

