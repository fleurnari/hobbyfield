package com.hobbyfield.app.club.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

public interface CreateclubService {
	
	// 소모임 전체조회
	public List<CreateclubVO> getCreateClubList();
	
	// 소모임 가입인원이 많은 클럽
	public List<CreateclubVO> getClubTop();

	// 내가만든 소모임 조회(모임장)
	public List<CreateclubVO> getMyClubList(CreateclubVO createclubVO);

	// 내가만든 소모임 단건조회(모임장)
	public CreateclubVO selectMadeClub(CreateclubVO createclubVO);
	
	// 소모임 세부조회
	public CreateclubVO getClub(CreateclubVO createclubVO);
	
	// 소모임 등록
	public int insertClubInfo(CreateclubVO createclubVO);

	// 소모임 수정
	public void updateClub(CreateclubVO createclubVO);

	// 소모임 삭제?

	// 소모임 중복체크
	public int clubnameChk(String clubName);

	// 소모임 검색
	public List<CreateclubVO> searchClub(CreateclubVO createclubVO);
	
	// 소모임 종류 정렬
	public List<CreateclubVO> getOrderCategory(String clubCategory);
	
	// 소모임 지역 정렬
	public List<CreateclubVO> getOrderLocation(String majorLocation);
	
	//페이징
	public List<CreateclubVO> getClubsForInfiniteScroll(Map<String, Integer> map);

}

