package com.hobbyfield.app.pointrecord.mapper;

import com.hobbyfield.app.pointrecord.service.PointRecordVO;

public interface PointRecordMapper {
	
	// 금일 첫 로그인 성공 시 로그 추가
	public int loginPointInsert(PointRecordVO pointRecordVO);
}
