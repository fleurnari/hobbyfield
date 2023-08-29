package com.hobbyfield.app.club.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.club.board.mapper.ClubBoardMapper;
import com.hobbyfield.app.club.board.service.ClubBoardService;
import com.hobbyfield.app.club.board.service.ClubBoardVO;
import com.hobbyfield.app.club.service.CreateclubVO;

@Service
public class ClubBoardServiceImpl implements ClubBoardService {

	@Autowired
	ClubBoardMapper clubboardmapper;
	
	// 소모임 메인페이지에서 모든 게시글 조회용 
	@Override
	public List<ClubBoardVO> getAllClubBoardList() {
		return clubboardmapper.getAllClubBoardList();
	}

	// 특정 소모임 들어갔을때 해당 소모임 게시글 전부 보기 
	@Override
	public List<ClubBoardVO> getSelectClubBoardList(CreateclubVO vo) {
		return clubboardmapper.getSelectClubBoardList(vo);
	}
	
	
	@Override
	public ClubBoardVO getClubBoardInfo(ClubBoardVO vo) {
		return clubboardmapper.getClubBoardInfo(vo);
	}

	@Override
	public int insertClubBoard(ClubBoardVO vo) {
		return clubboardmapper.insertClubBoard(vo);
	}
	
	@Override
	public int updateClubBoard(ClubBoardVO vo) {
		return clubboardmapper.updateClubBoard(vo);
	}

	@Override
	public int updateViewClubBoard(ClubBoardVO vo) {
		return clubboardmapper.updateViewClubBoard(vo);
	}

	@Override
	public int updateBlindClubBoard(ClubBoardVO vo) {
		return clubboardmapper.updateBlindClubBoard(vo);
	}

	

	

	

}
