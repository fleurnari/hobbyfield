package com.hobbyfield.app.club.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.club.board.mapper.ClubBoardMapper;
import com.hobbyfield.app.club.board.service.ClubBoardService;
import com.hobbyfield.app.club.board.service.ClubBoardVO;

@Service
public class ClubBoardServiceImpl implements ClubBoardService {

	@Autowired
	ClubBoardMapper clubmapper;
	
	@Override
	public List<ClubBoardVO> getClubBoardList() {
		return clubmapper.getClubBoardList();
	}

	@Override
	public ClubBoardVO getClubBoardInfo(ClubBoardVO vo) {
		return clubmapper.getClubBoardInfo(vo);
	}

	@Override
	public int insertClubBoard(ClubBoardVO vo) {
		return clubmapper.insertClubBoard(vo);
	}

	@Override
	public int updateClubBoard(ClubBoardVO vo) {
		return clubmapper.updateClubBoard(vo);
	}

}
