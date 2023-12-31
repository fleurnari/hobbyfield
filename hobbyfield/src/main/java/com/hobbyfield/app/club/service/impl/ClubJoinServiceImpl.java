package com.hobbyfield.app.club.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hobbyfield.app.club.mapper.ClubJoinMapper;
import com.hobbyfield.app.club.service.ClubJoinService;
import com.hobbyfield.app.club.service.ClubJoinVO;

@Service
public class ClubJoinServiceImpl implements ClubJoinService {
	
	private static final Logger log = LoggerFactory.getLogger(ClubJoinServiceImpl.class);

   @Autowired
   ClubJoinMapper clubJoinMapper;
   
   //소모임 가입신청 : 등록
   @Override
   public int clubJoinInfo(ClubJoinVO joinVO) {
      int result = clubJoinMapper.joinClub(joinVO);
      if(result == 1) {
         return joinVO.getApplyNumber();
      }
      return -1;
   }
   
	@Override
	public List<ClubJoinVO> clubMemberList(int clubNumber) {
	return clubJoinMapper.memberListClub(clubNumber);
}
   
   //가입신청한 소모임 회원 전체조회
   @Override
   public List<ClubJoinVO> joinClubMemberInfo(ClubJoinVO joinVO) {
      return clubJoinMapper.joinClubMember(joinVO);
   }

   //소모임 가입신청한 회원 수락
   @Override
   @Transactional
   public boolean acceptMember(ClubJoinVO joinVO) {
	   try {
		   clubJoinMapper.insertClubMember(joinVO);
	       clubJoinMapper.updateClubApplyStatus(joinVO.getProfileNickname(), joinVO.getClubNumber());
           return true;
       } catch (DataAccessException dae) {
    	   log.error("회원 수락 중 데이터 액세스 오류 발생", dae);
           return false;
       } catch (Exception e) {
           log.error("회원 수락 중 예기치 못한 오류 발생", e);
           return false;
       }
   }

   //소모임 가입신청한 회원 거절
   @Override
   public boolean rejectMember(String profileNickname, Integer clubNumber) {
	   try {
           clubJoinMapper.deleteClubApply(profileNickname, clubNumber);
           return true;
       } catch (Exception e) {
           return false;
       }
	}


@Override
public int quitClubMember(ClubJoinVO vo) {
	int result =  clubJoinMapper.quitClubMember(vo);
	if(result > 0 ) {
		result = 1;
	}else {
		result = -1;
	}
	return result;
}

@Override
public ClubJoinVO memberInfoClub(ClubJoinVO vo) {
	return clubJoinMapper.memberInfoClub(vo);
}


@Override
public List<ClubJoinVO> memberListClub(int clubNumber) {
	return clubJoinMapper.memberListClub(clubNumber);
}



}



