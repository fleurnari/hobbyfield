package com.hobbyfield.app.club.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.hobbyfield.app.club.service.CreateclubVO;

public interface CreateclubMapper {
	
	//소모임 전체조회
	public List<CreateclubVO> selectClubAllList();
	
	//소모임 세부조회
	
	
	//소모임 등록
	public int insertClub(CreateclubVO createclubVO);
	
	//소모임 수정
	public int updateClub(CreateclubVO createclubVO);
	
	//지역 리스트
	public List<CreateclubVO> clubLocationVO();
	
	
	//소모임 삭제?
	
	
	//소모임 이름 중복체크
	public int clubnameChk(String clubName);
	
	
	
	
}
