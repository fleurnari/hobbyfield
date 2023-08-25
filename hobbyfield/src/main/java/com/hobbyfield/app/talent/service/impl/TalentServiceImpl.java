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
	
	@Override
	public List<TalentVO> getTalentAllList() {
		return talentMapper.selectTalentAllList();
	}

}
