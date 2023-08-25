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
	public List<PushVO> selectPushList() {

		return pushMapper.selectPushList();
	}
	
	@Override
	public int chkPush(PushVO pushVO) {
		
		return pushMapper.chkPush(pushVO);
	}

	@Override
	public int deletePush(int pushId) {

		return pushMapper.deletePush(pushId);
	}

}
