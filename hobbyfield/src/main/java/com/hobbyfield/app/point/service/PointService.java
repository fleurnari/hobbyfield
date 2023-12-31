package com.hobbyfield.app.point.service;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface PointService {

	// 포인트 전체조회
	public List<PointVO> getPointAllList();

	// 포인트 상품 단건조회
	public PointVO getPointInfo(PointVO pointVO);
	
	// 포인트 상품 옵션조회
	public List<PointOptionVO> getPointOptInfo(int pointId);

	// 포인트 상품 등록
	public int insertPoint(PointVO pointVO);
	
	// 포인트 상품 수정
	public int updatePoint(PointVO pointVO);

	// 포인트 상품 삭제
	public int deletePoint(int pointId);
	
	// 포인트 옵션 삭제
//	public int deletePointOption(int pointOptId);

	// 포인트 상품 조회수
	public int updatePointView(PointVO pointVO);
	
	//이모티콘 대표이미지
	public List<PointVO> emojiGroup(String memberEmail);
	
	//이모티콘 이미지 그룹
	public List<EmojiVO> emojis(int pointId);
}
