package com.hobbyfield.app.push.mapper;

import java.util.List;

import com.hobbyfield.app.push.service.PushVO;

public interface PushMapper {
	
	// 알림 조회
	public List<PushVO> selectPushList(String memberEmail);
	
	// 알림 수 가져오기
	public int selectPushCount(String memberEmail);
	
	// 알림 등록
	public int insertPush(int pushId, String pushTarget, String pushTyp, String pushCntn, String pushUrl);
	
	// 알림 삭제
	public int deletePush(int pushId);

}
