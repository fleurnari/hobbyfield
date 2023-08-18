package com.hobbyfield.app.point.mapper;

import java.util.List;

import com.hobbyfield.app.point.service.PointVO;

public interface PointMapper {

	// 포인트 전체조회
	public List<PointVO> selectPointAllList();
	
	// 포인트 상품 단건조회
	public PointVO selectPointInfo(PointVO pointVO);
	
//	// 포인트 검색 조회
//	public List<PointVO> searchPointList();
	
	// 포인트 상품 등록
	// - 상품 판매기간 카운트
	public int insertPoint(PointVO pointVO);
	
	// 포인트 상품 수정
	public int updatePoint(PointVO pointVO);
	
	// 포인트 상품 삭제
	public int deletePointInfo(int pointId);
	
	// 포인트 상품 조회수
	public int pointViewCount(PointVO pointVO);

	
	
}
