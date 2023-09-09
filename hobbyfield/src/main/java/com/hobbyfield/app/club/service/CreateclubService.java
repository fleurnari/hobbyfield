package com.hobbyfield.app.club.service;

import java.util.List;
import java.util.Map;



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
	
	// 지역 종류 2중 정렬
	public List<CreateclubVO> getMixOrder(String majorLocation, String clubCategory);
	
	//페이징
	public List<CreateclubVO> getClubsForInfiniteScroll(Map<String, Integer> map);
	
	//소모임 인원 체크
	public int countMember(int clubNumber);
	
	//모임 생성시 닉네임 갯수 확인용
	public int countClubsByProfile(String profileNickname);




}

