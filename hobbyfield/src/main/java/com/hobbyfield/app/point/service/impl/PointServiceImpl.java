package com.hobbyfield.app.point.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.point.mapper.PointMapper;
import com.hobbyfield.app.point.service.EmojiVO;
import com.hobbyfield.app.point.service.PointOptionVO;
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
		pointVO = pointMapper.selectPointInfo(pointVO);
		pointVO.setEmojiVO(pointMapper.selectEmojiInfo(pointVO.getPointId()));
		pointVO.setPointOptionVO(pointMapper.selectPointOptInfo(pointVO.getPointId()));
		return pointVO;
	}
	
	//포인트 상품 단건조회 - 옵션
	@Override
	public List<PointOptionVO> getPointOptInfo(int pointId) {
		return pointMapper.selectPointOptInfo(pointId);
	}


	// 포인트 상품 등록
	@Override
	public int insertPoint(PointVO pointVO) {
		
		List<EmojiVO> emojiList=pointVO.getEmojiVO();
		// 대표 이미지
		if(emojiList != null && emojiList.size()>0) {
			pointVO.setPointImgName(emojiList.get(0).getEmojiImgName());
			pointVO.setPointImgPath(emojiList.get(0).getEmojiImgPath());
		}
		int result = pointMapper.insertPoint(pointVO);
		
		if(pointVO.getPointItemType().equals("W1")) {
			//옵션등록
			List<PointOptionVO> list=pointVO.getPointOptionVO();
			if(list != null) {
				for(PointOptionVO opt: list)
				{
					opt.setPointId(pointVO.getPointId());
					pointMapper.insertPointOption(opt);
				}
			}
			
			//이모지등록
			if(emojiList != null) {
				for(EmojiVO emoji: emojiList) {
					emoji.setPointId(pointVO.getPointId());
					pointMapper.insertEmoji(emoji);
				}
			}
		}
		
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
	public int deletePoint(int delete) {
		int result = pointMapper.deletePoint(delete);
		if (result > 0) {
			return delete;
		} else {
			return -1;
		}
	}
	
	@Override
	// 포인트 상품 조회수 업데이트
		public int updatePointView(PointVO pointVO) {
			return pointMapper.updatePointView(pointVO);
		}

	//이모티콘 대표이미지
	@Override
	public List<EmojiVO> firstEmojiImg(String memberEmail) {
		
		return pointMapper.firstEmojiImg(memberEmail);
	}

	//이모티콘 이미지 그룹
	@Override
	public List<EmojiVO> emojiGroup(int pointId) {
		return pointMapper.emojiGroup(pointId);
	}









}
