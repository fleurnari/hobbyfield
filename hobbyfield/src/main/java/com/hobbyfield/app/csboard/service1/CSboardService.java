package com.hobbyfield.app.csboard.service1;

import java.util.List;

import com.hobbyfield.app.common.SearchCriteria;

public interface CSboardService {
	
	//CS게시글 수 조회
	public int csCount(SearchCriteria scri);
	
	//CS게시글목록
	public List<CSBoardVO> getCSBoardList(SearchCriteria scri);
	
	//CS게시글 상세보기
	public CSBoardVO getCSBoardInfo(int csNumber);
	
	//CS게시글 등록
	public int insertCSboardInfo(CSBoardVO csboardVO);
	
	//CS게시글 수정
	public void UpdateCSBoard(CSBoardVO csboardVO);
	//CS게시글 삭제
	public void deleteCSboardInfo(int csboardNo);
	
	
	
	
}
