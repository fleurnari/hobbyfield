package com.hobbyfield.app.point.service;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface PointService {

	// 포인트샵 전체조회
	public List<PointVO> getPointAllList();

	// 포인트샵 상품 단건조회
	public PointVO getPointInfo(PointVO pointVO);

	// 포인트샵 상품 등록
	// - 상품 판매기간 카운트
	public int insertPoint(PointVO pointVO);

	// 포인트샵 상품 수정
	public int updatePoint(PointVO pointVO);

	// 포인트샵 상품 삭제
	public int deletePoint(int pointId);

	// 포인트샵 상품 조회수
	public int pointViewCount(PointVO pointVO);
}
