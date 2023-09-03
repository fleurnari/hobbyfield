package com.hobbyfield.app.club.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.club.board.mapper.ClubCommentMapper;
import com.hobbyfield.app.club.board.service.ClubCommentService;
import com.hobbyfield.app.club.board.service.ClubCommentVO;
import com.hobbyfield.app.member.service.MemberVO;

@Service
public class ClubCommentServiceImpl implements ClubCommentService {

	@Autowired
	ClubCommentMapper clubCommentMapper;
	
	@Override
	public List<ClubCommentVO> getUserComment(String memberEmail) {

		return clubCommentMapper.getUserComment(memberEmail);
	}

	@Override
	public List<ClubCommentVO> getBoardComment(int boardNumber) {

		return clubCommentMapper.getBoardComment(boardNumber);
	}

	@Override
	public ClubCommentVO getComment(ClubCommentVO vo) {

		return clubCommentMapper.getComment(vo);
	}

	@Override
	public int insertComment(ClubCommentVO vo) {

		return clubCommentMapper.insertComment(vo);
	}

	@Override
	public int updateComment(ClubCommentVO vo) {

		return clubCommentMapper.updateComment(vo);
	}

	@Override
	public int deleteComment(ClubCommentVO vo) {

		return clubCommentMapper.deleteComment(vo);
	}

	@Override
	public int updateMemberPnt(MemberVO memberVO) {
		
		return clubCommentMapper.updateMemberPnt(memberVO);
	}

}
