package com.hobbyfield.app.talent.service;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface TalentService {

	// 재능기부 메인
//	public List<TalentVO> getTalentMain();

	// 재능기부 카테고리 전체조회
	public List<TalentVO> getTalentAllList();

	// 재능기부 단건조회
	public TalentVO getTalentInfo(TalentVO talentVO);

	// 재능기부 등록
	public int insertTalent(TalentVO talentVO);

	// 재능기부 조회수
	public int updateTlntView(TalentVO talentVO);

}
