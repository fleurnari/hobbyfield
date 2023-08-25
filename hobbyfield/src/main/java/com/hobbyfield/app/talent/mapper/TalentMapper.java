package com.hobbyfield.app.talent.mapper;

import java.util.List;

import com.hobbyfield.app.talent.service.TalentVO;

public interface TalentMapper {
	
	//재능기부 전체조회(talentList)
	public List<TalentVO> selectTalentAllList();
	
	
	
}
