package com.hobbyfield.app.talent.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.talent.mapper.TalentMapper;
import com.hobbyfield.app.talent.service.TalentService;
import com.hobbyfield.app.talent.service.TalentVO;

@Service
public class TalentServiceImpl implements TalentService {

	@Autowired
	TalentMapper talentMapper;

	// 재능기부 메인화면
//	@Override
//	public List<TalentVO> getTalentMain() {
//		
//		return null;
//	}

	// 재능기부 카테고리 전체조회
	@Override
	public List<TalentVO> getTalentAllList() {
		return talentMapper.selectTalentAllList();
	}

	// 재능기부 단건조회
	@Override
	public TalentVO getTalentInfo(TalentVO talentVO) {
		talentVO = talentMapper.selectTalentInfo(talentVO);
		return talentVO;
	}

	// 재능기부 등록
	@Override
	public int insertTalent(TalentVO talentVO) {
		int result = talentMapper.insertTalent(talentVO);
		if(result == 1) {
			return talentVO.getTlntId();
		} else {
			return -1;
		}
	}

	// 조회수
	@Override
	public int updateTlntView(TalentVO talentVO) {
		return talentMapper.updateTlntView(talentVO);
	}

}

//tlntId;
//tlntWriter;
//tlntWdate; //작성일자
//tlntView;
//tlntTitle;
//tlntStatus; //모집/마감상태
//tlntStartday; //재능기부 시작일
//tlntEndday; // 재능기부 종료일
//tlntRegend; // 모집 마감일
//tlntContent;
//tlntCate;
// tlntCap;
