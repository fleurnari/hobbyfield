package com.hobbyfield.app.csboard.mapper;

import java.util.List;

import com.hobbyfield.app.common.Criteria;
import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.csboard.service1.CSBoardVO;

public interface CSBoardMapper {
	//CS게시글수 
	public int getTotalCount(SearchCriteria scri);
	
	//CS게시글 목록
	public List<CSBoardVO> selectAllCSList(SearchCriteria scri);
	
	//CS게시글 상세보기
	public CSBoardVO selectCSBoard(int csNumber);
	
	//CS게시글 등록
	public int insertCSBoard(CSBoardVO CSboard);
	
	//CS게시글 수정
	public void UpdateCSBoard(CSBoardVO csboardVO);
	//CS게시글 삭제
	public void deleteBoard(int boardNo);
}
