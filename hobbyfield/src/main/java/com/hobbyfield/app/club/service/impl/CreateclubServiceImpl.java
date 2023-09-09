package com.hobbyfield.app.club.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.club.mapper.CreateclubMapper;
import com.hobbyfield.app.club.service.CreateclubService;
import com.hobbyfield.app.club.service.CreateclubVO;

@Service
public class CreateclubServiceImpl implements CreateclubService {

	@Autowired
	CreateclubMapper createclubMapper;
	
	//소모임 전체조회 
	@Override
	public List<CreateclubVO> getCreateClubList() {
		return createclubMapper.selectClubAllList();
	}
	
	//내가만든 소모임조회 (모임장)
	@Override
	public List<CreateclubVO> getMyClubList(CreateclubVO createclubVO) {
		
		return createclubMapper.selectClubMyList(createclubVO);
	}
	
	//내가만든 소모임 세부조회 (모임장)
	@Override
	public CreateclubVO selectMadeClub(CreateclubVO createclubVO) {
		return createclubMapper.selectMadeClub(createclubVO);
	}
	
	//소모임 세부조회
	@Override
	public CreateclubVO getClub(CreateclubVO createclubVO) {
		return createclubMapper.getClubInfo(createclubVO);
	}
	
	
	//소모임 등록
	@Override
	public int insertClubInfo(CreateclubVO createclubVO) {
		int result = createclubMapper.insertClub(createclubVO);
		
		if(result == 1) {
			return createclubVO.getClubNumber();
		}else {
			return -1;
		}
	
	}
	
	//소모임 수정
	@Override
	public void updateClub(CreateclubVO createclubVO) {
		createclubMapper.updateClub(createclubVO);
	}
	

	//모임 이름 중복체크 
	@Override
	public int clubnameChk(String clubName) {
		return createclubMapper.clubnameChk(clubName);
	}


	// 소모임 검색
	@Override
	public List<CreateclubVO> searchClub(CreateclubVO createclubVO) {
		return null;
	}
	
	
	//소모임 top
	@Override
	public List<CreateclubVO> getClubTop() {
		return createclubMapper.selectClubTop();
	}
	
	//페이징
	@Override
	public List<CreateclubVO> getClubsForInfiniteScroll(Map<String, Integer> map) {
	    return createclubMapper.selectClubsForInfiniteScroll(map);
	}
	
	//가입 인원확인(카운트만)
	@Override
	public int countMember(int clubNumber) {
		return createclubMapper.countMember(clubNumber);
	}

	//모임 생성시 프로필 갯수 확인
	@Override
	public int countClubsByProfile(String profileNickname) {
		 return createclubMapper.countClubNick(profileNickname);
	}

	//지역 종류 2중정렬
	@Override
	public List<CreateclubVO> getMixOrder(String majorLocation, String clubCategory) {
		return createclubMapper.getMixOrder(majorLocation, clubCategory);
	}

	

	
	
}
