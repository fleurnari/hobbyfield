package com.hobbyfield.app.club.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.club.service.CreateclubVO;

public interface CreateclubMapper {
	
	//소모임 전체조회 clubList View
	public List<CreateclubVO> selectClubAllList();
	
	//소모임 메인 전체조회
	public List<CreateclubVO> selectClubTop();
	
	//내가 생성한 소모임 조회 clubMyList View (모임장)
	public List<CreateclubVO> selectClubMyList(CreateclubVO createclubVO);
	
	//내가 생성한 소모임 세부조회 clubMadeList (모임장)
	public CreateclubVO selectMadeClub(CreateclubVO createclubVO);
	
	//소모임 세부조회
	public CreateclubVO getClubInfo(CreateclubVO createclubVO);
	
	//소모임 등록
	public int insertClub(CreateclubVO createclubVO);
	
	//소모임 수정
//	public int updateClub(CreateclubVO createclubVO);
	public void updateClub(CreateclubVO createclubVO);
	
	//지역 리스트
	public List<CreateclubVO> clubLocationVO();
	
	
	//소모임 삭제?
	
	
	//소모임 이름 중복체크
	public int clubnameChk(String clubName);
	
	//지역 종류 2중 정렬
	public List<CreateclubVO> getMixOrder(@Param("majorLocation") String majorLocation, @Param("clubCategory")String clubCategory);
	
	//페이징
	public List<CreateclubVO> selectClubsForInfiniteScroll(Map<String, Integer> map);
	
	//가입 인원수 체크
	public int countMember(int clubNumber);
	
	//소모임 등록 3개 제한
	public int countClubNick(String profileNickname);
}