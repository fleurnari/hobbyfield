package com.hobbyfield.app.club.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.hobbyfield.app.club.service.CreateclubVO;

public interface CreateclubMapper {
	
	//소모임 전체조회 clubList View
	public List<CreateclubVO> selectClubAllList();
	
	//내가 생성한 소모임 조회 clubMyList View
	public List<CreateclubVO> selectClubMyList();
	
	//소모임 세부조회
	public CreateclubVO selectClubInfo(CreateclubVO createclubVO);
	
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
	
	
	
	
}
