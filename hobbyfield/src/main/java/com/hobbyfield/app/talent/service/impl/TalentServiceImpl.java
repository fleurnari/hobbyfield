package com.hobbyfield.app.talent.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.talent.mapper.TalentMapper;
import com.hobbyfield.app.talent.service.TalentService;
import com.hobbyfield.app.talent.service.TalentVO;

@Service
public class TalentServiceImpl implements TalentService{
	@Autowired
	private TalentMapper talentMapper;

	@Override
	public List<TalentVO> getAllTalent() {
		return talentMapper.getAllTalent();
	}

	@Override
	public TalentVO getTalentInfo(int tlntId) {
		return talentMapper.getTalentInfo(tlntId);
	}

	@Override
	public void insertTalent(TalentVO talentVO) {
		talentMapper.insertTalent(talentVO);
	}

	@Override
	public void updateTalent(TalentVO talentVO) {
		talentMapper.updateTalent(talentVO);
	}

	@Override
	public void deleteTalent(int tlntId) {
		talentMapper.deleteTalent(tlntId);
	}

	@Override
	public void updateTalentView(int tlntId) {
		talentMapper.updateTalentView(tlntId);
	}

}
