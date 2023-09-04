package com.hobbyfield.app.pointrecord.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.pointrecord.mapper.PointRecordMapper;
import com.hobbyfield.app.pointrecord.service.PointRecordService;
import com.hobbyfield.app.pointrecord.service.PointRecordVO;

@Service
public class PointRecordServiceImpl implements PointRecordService{
	
	@Autowired
	PointRecordMapper pointRecordMapper;

	@Override
	public int insertPointLog(PointRecordVO pointRecordVO) {

		return pointRecordMapper.insertPointLog(pointRecordVO);
	}
	
}
