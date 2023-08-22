package com.hobbyfield.app.csboard.service1;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.common.SearchCriteria;

public interface CSboardService {
	
	//CS게시글 카운트
	public int csCount(SearchCriteria scri);
	
	//CS게시글목록
	public List<CSBoardVO> getCSBoardList(SearchCriteria scri);
	
	//CS게시글상세보기
	public CSBoardVO getCSBoardInfo(int csNumber);
	
	//CS게시글등록
	public int insertCSboardInfo(CSBoardVO csboardVO);
	
	//CS게시글수정
	public void UpdateCSBoard(CSBoardVO csboardVO);
	
	//CS게시글삭제
	public void deleteCSboardInfo(int csboardNo);
	
	//댓글등록
	public void insertReply(CSReplyVO replyVO);
	//댓글조회
	public List<CSReplyVO> readReply(int csNumber);
	
	//댓글수정
	public void updateReply(CSReplyVO replyVO);
		
	//댓글삭제
	public void deleteReply(CSReplyVO replyVO);
}
