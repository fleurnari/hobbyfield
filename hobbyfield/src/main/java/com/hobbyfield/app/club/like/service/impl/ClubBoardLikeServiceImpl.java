package com.hobbyfield.app.club.like.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hobbyfield.app.club.board.service.ClubBoardVO;
import com.hobbyfield.app.club.like.mapper.ClubBoardLikeMapper;
import com.hobbyfield.app.club.like.service.ClubBoardLikeService;

public class ClubBoardLikeServiceImpl implements ClubBoardLikeService {
	
	@Autowired
	ClubBoardLikeMapper cblm;
	
	@Override
	public int insertBoardLike(int clubNumber) {
		// TODO Auto-generated method stub
		return cblm.insertBoardLike(clubNumber);
	}

	@Override
	public int deleteBoardLike(int clubNubmer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countBoardLike(int clubNumber) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ClubBoardVO> getMyLikeBoard(String memberEmail) {
		// TODO Auto-generated method stub
		return null;
	}

}
