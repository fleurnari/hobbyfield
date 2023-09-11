package com.hobbyfield.app.club.like.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.club.like.mapper.ClubBoardLikeMapper;
import com.hobbyfield.app.club.like.service.ClubBoardLikeService;
import com.hobbyfield.app.club.like.service.ClubBoardLikeVO;

@Service
public class ClubBoardLikeServiceImpl implements ClubBoardLikeService {
	
	@Autowired
	ClubBoardLikeMapper cblm;

	@Override
	public int insertBoardLike(ClubBoardLikeVO clubBoardLikeVO) {
		// TODO Auto-generated method stub
		return cblm.insertBoardLike(clubBoardLikeVO);
	}

	@Override
	public int deleteBoardLike(ClubBoardLikeVO clubBoardLikeVO) {
		// TODO Auto-generated method stub
		return cblm.deleteBoardLike(clubBoardLikeVO);
	}

	@Override
	public int countBoardLike(Integer boardNumber) {
		// TODO Auto-generated method stub
		return cblm.countBoardLike(boardNumber);
	}

	@Override
	public int selectBoardLike(Integer boardNumber, String profileNickname) {
		// TODO Auto-generated method stub
		return cblm.selectBoardLike(boardNumber, profileNickname);
	}
	


}
