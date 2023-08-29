package com.hobbyfield.app.club.board.service;

import java.util.List;

public interface BoardVoteService {
	
	// 생성,수정,삭제(단, 수정은 결과만 가능)
	
	// 투표 생성 
	public int insertVote(BoardVoteVO vo);
	// 투표 종료
	public int endVote(BoardVoteVO vo);
	// 투표 옵션 생성
	public int insertVoteOption(List<BoardVoteOptionVO> vo);
	// 투표 결과 생성 
	public int insertVoteResult(List<BoardVoteResultVO> vo);
	// 투표 결과 수정
	public int updateVoteResult(BoardVoteResultVO vo);
	// 투표 결과 삭제
	public int deleteVoteResult(BoardVoteResultVO vo);
	
	
	// 출력용(게시글, 옵션, 결과) 
	
	// 투표글만 모아보기 
	public List<BoardVoteVO> allBoardVote(BoardVoteVO vo);
	// 특정 게시글의 투표글 가져오기
	public BoardVoteVO selectBoardVote(BoardVoteVO vo);
	// 투표 옵션 불러오기
	public List<BoardVoteOptionVO> getVoteOption(BoardVoteOptionVO vo);
	// 투표 결과 불러오기 
	
	// 
	
}
