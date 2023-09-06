package com.hobbyfield.app.talent.mapper;

import java.util.List;

import com.hobbyfield.app.talent.service.TalentVO;

public interface TalentMapper {
	
//	//재능기부 메인
//	public List<TalentVO> selectTalentMain();
	
	//재능기부 전체조회(talentList)
	public List<TalentVO> selectTalentAllList();
	
	//재능기부 등록(talentList)
	public int insertTalent(TalentVO talentVO);
	
	//재능기부 조회수
	public int updateTlntView(TalentVO talentVO); 
	
	//재능기부 단건조회(talentInfo)
	public TalentVO selectTalentInfo(TalentVO talentVO);
	

}
