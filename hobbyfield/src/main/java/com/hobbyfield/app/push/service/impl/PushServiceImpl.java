package com.hobbyfield.app.push.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.push.mapper.PushMapper;
import com.hobbyfield.app.push.service.PushService;
import com.hobbyfield.app.push.service.PushVO;

@Service
public class PushServiceImpl implements PushService {

	@Autowired
	PushMapper pushMapper;

	@Override
	public List<PushVO> selectPushList(String memberEmail) {

		return pushMapper.selectPushList(memberEmail);
	}

	@Override
	public int selectPushCount(String memberEmail) {

		return pushMapper.selectPushCount(memberEmail);
	}

	@Override
	public int insertPush(String pushTarget, String pushTyp, String pushCntn, String pushUrl) {

		return pushMapper.insertPush(pushTarget, pushTyp, pushCntn, pushUrl);
	}
	
	@Override
	public int updatePush(int pushId) {

		return pushMapper.updatePush(pushId);
	}

	@Override
	public int deletePush(int pushId) {

		return pushMapper.deletePush(pushId);
	}


	




}
