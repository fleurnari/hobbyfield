package com.hobbyfield.app.point.mapper;

import java.util.List;

import com.hobbyfield.app.point.service.EmojiVO;
import com.hobbyfield.app.point.service.PointOptionVO;
import com.hobbyfield.app.point.service.PointVO;

public interface PointMapper {

	// 포인트 전체조회
	public List<PointVO> selectPointAllList();
	
	// 포인트 상품 단건조회
	public PointVO selectPointInfo(PointVO pointVO);
	
	// 포인트 옵션조회
	public List<PointOptionVO> selectPointOptInfo(int pointId);
	
	// 이모지 조회
	public List<EmojiVO> selectEmojiInfo(int pointId);
	
	// 포인트 상품 등록
	public int insertPoint(PointVO pointVO);
	
	// 포인트 상품 옵션 
	public int insertPointOption(PointOptionVO pointOptionVO);
	
	// 포인트 이모티콘 
	public int insertEmoji(EmojiVO emojiVO);
	
	// 포인트 상품 수정
	public int updatePoint(PointVO pointVO);
	
	// 포인트 상품 삭제
	public int deletePoint(int pointId);
	
	//포인트 옵션 삭제
//	public int deletePointOption(int pointId);
	
	// 포인트 상품 조회수
	public int updatePointView(PointVO pointVO);

	//이모티콘 대표이미지
	public List<EmojiVO> firstEmojiImg(String memberEmail);
	
	//이모티콘 이미지 그룹
//	public List<EmojiVO> emojiGroup(EmojiVO emojiVO);

	public List<EmojiVO> emojiGroup(int pointId);
}
