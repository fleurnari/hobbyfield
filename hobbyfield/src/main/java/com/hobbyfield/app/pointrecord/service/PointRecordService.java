package com.hobbyfield.app.pointrecord.service;

public interface PointRecordService {
	
	// 금일 첫 로그인 성공 시 로그 추가
	public int insertLoginPoint(PointRecordVO pointRecordVO);
}
