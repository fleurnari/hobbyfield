package com.hobbyfield.app.push.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.push.service.PushVO;

public interface PushMapper {
	
	// 알림 조회
	public List<PushVO> selectPushList(String memberEmail);
	
	// 알림 수 가져오기
	public int selectPushCount(String memberEmail);
	
	// 알림 등록
	public int insertPush(@Param("pushTarget") String pushTarget, @Param("pushTyp") String pushTyp,  @Param("pushCntn") String pushCntn, @Param("pushUrl") String pushUrl);
	
	// 알림 확인 여부 변경
	public int updatePush(String memberEmail);
	
	// 알림 삭제
	public int deletePush(int pushId);
	
	// 알림 전체 삭제
	public int deleteAllPush(String memberEmail);

}
