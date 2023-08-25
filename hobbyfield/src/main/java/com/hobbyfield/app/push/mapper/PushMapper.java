package com.hobbyfield.app.push.mapper;

import java.util.List;

import com.hobbyfield.app.push.service.PushVO;

public interface PushMapper {
	
	// 알림 조회
	public List<PushVO> selectPushList();
	
	// 알림 읽음 처리
	public int chkPush(PushVO pushVO);
	
	// 알림 삭제
	public int deletePush(int pushId);

}
