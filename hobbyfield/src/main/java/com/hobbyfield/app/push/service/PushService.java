package com.hobbyfield.app.push.service;

import java.util.List;

public interface PushService {
	
	// 알림 조회
	public List<PushVO> selectPushList(String memberEmail);
	
	// 알림 수 가져오기
	public int selectPushCount(String memberEmail);
	
	// 알림 등록
	public int insertPush(String pushTarget, String pushTyp, String pushCntn, String pushUrl);
	
	// 알림 확인 여부 변경
	public int updatePush(int pushId);
	
	// 알림 삭제
	public int deletePush(int pushId);


}
