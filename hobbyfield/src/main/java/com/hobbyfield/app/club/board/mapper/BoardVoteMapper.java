package com.hobbyfield.app.club.board.mapper;

import java.util.List;

import com.hobbyfield.app.club.board.service.BoardVoteOptionVO;
import com.hobbyfield.app.club.board.service.BoardVoteResultVO;
import com.hobbyfield.app.club.board.service.BoardVoteVO;

public interface BoardVoteMapper {
	
	// 출력용(게시글, 옵션, 결과) 
	
	// 투표글만 모아보기(select)
	public List<BoardVoteVO> allBoardVote(BoardVoteVO vo);
	// 특정 게시글의 투표글 가져오기(select)
	public BoardVoteVO selectBoardVote(BoardVoteVO vo);
	// 투표 옵션 불러오기(select)
	public List<BoardVoteOptionVO> getVoteOption(BoardVoteVO vo);
	// 투표 결과 불러오기(select) 
	public List<BoardVoteResultVO> getVoteResult(BoardVoteVO vo);
		
	
	// 생성, 수정, 삭제
	
	// 투표 생성(insert)
	public int insertVote(BoardVoteVO vo);
	// 투표 옵션 생성(insert)
	public int insertVoteOption(List<BoardVoteOptionVO> vo);
	// 투표 결과 생성(insert)
	public int insertVoteResult(List<BoardVoteResultVO> vo);
	// 투표 종료(upadate)
	public int endVote(BoardVoteVO vo);
	// 투표 결과 수정(update)
	public int updateVoteResult(BoardVoteResultVO vo);
	// 투표 결과 삭제(delete)
	public int deleteVoteResult(BoardVoteResultVO vo);
	
	
	
}
