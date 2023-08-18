package com.hobbyfield.app.csboard.mapper;

import java.util.List;

import com.hobbyfield.app.common.Criteria;
import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.csboard.service1.CSBoardVO;

public interface CSBoardMapper {
	//게시글 총갯수 조회
	public int getTotalCount(SearchCriteria scri);
	
	//CS게시글 리스트 조회
	public List<CSBoardVO> selectAllCSList(SearchCriteria scri);
	
	//게시글 상세보기
	public CSBoardVO selectCSBoard(int csNumber);
	
	//게시글 등록
	public int insertCSBoard(CSBoardVO CSboard);
	
	//게시글 수정
	public void UpdateCSBoard(CSBoardVO csboardVO);
	//게시글 삭제
	public void deleteBoard(int boardNo);
	
	
}
