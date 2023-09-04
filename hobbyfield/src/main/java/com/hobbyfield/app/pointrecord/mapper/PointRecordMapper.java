package com.hobbyfield.app.pointrecord.mapper;

import com.hobbyfield.app.pointrecord.service.PointRecordVO;

public interface PointRecordMapper {
	
	// 로그 추가
	public int insertPointLog(PointRecordVO pointRecordVO);
}
