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
	
	//닉네임 중복체크
	public int nickChk(String profileNickname);
	
	//소모임 이름 중복체크
	public int clubnameChk(String clubName);
	
	/*=== 마이페이지 ===*/
	//프로필 이미지등록
	public int profileImg(CreateclubVO createclubVO); 
	
	//프로필 화면 : 개인정보 조회
	public List<CreateclubVO> getNomalMypage();
	
	
}
