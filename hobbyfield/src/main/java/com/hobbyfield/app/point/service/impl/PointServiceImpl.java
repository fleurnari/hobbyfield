package com.hobbyfield.app.point.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.point.mapper.PointMapper;
import com.hobbyfield.app.point.service.PointService;
import com.hobbyfield.app.point.service.PointVO;

@Service
public class PointServiceImpl implements PointService {

	@Autowired
	PointMapper pointMapper;

	// 포인트 전체조회
	@Override
	public List<PointVO> getPointAllList() {
		return pointMapper.selectPointAllList();
	}

	// 포인트 상품 단건조회
	@Override
	public PointVO getPointInfo(PointVO pointVO) {
		return pointMapper.selectPointInfo(pointVO);
	}

	// 포인트 상품 등록
	@Override
	public int insertPoint(PointVO pointVO) {
		int result = pointMapper.insertPoint(pointVO);
		if (result == 1) {
			return pointVO.getPointId();
		} else {
			return -1;
		}
	}

	// 포인트 상품 수정
	@Override
	public int updatePoint(PointVO pointVO) {
		int result = pointMapper.updatePoint(pointVO);
		if (result == 1) {
			return pointVO.getPointId();
		} else {
			return -1;
		}
	}

	// 포인트 상품 삭제
	@Override
	public int pointDelete(int delete) {
		int result = pointMapper.pointDelete(delete);
		if (result > 0) {
			return delete;
		} else {
			return -1;
		}
	}
	// 포인트 상품 조회수 업데이트
		@Override
		public int pointViewCount(PointVO pointVO) {
			return pointMapper.updatePoint(pointVO);
		}

}
