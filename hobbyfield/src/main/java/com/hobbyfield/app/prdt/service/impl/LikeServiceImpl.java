package com.hobbyfield.app.prdt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.prdt.mapper.LikeMapper;
import com.hobbyfield.app.prdt.service.LikeService;
import com.hobbyfield.app.prdt.service.LikeVO;

@Service
public class LikeServiceImpl implements LikeService {
	
	@Autowired
	LikeMapper likeMapper;
	
	@Override
	public void likePrdt(LikeVO likeVO) {
		likeMapper.likePrdt(likeVO);
	}

	@Override
	public void deleteLike(LikeVO likeVO) {
		likeMapper.deleteLike(likeVO);
	}

	@Override
	public int likeCount(int prdtId) {
		return likeMapper.likeCount(prdtId);
	}

	@Override
	public int checkLike(LikeVO likeVO) {
		
		return likeMapper.checkLike(likeVO);
	}
	
	
}
