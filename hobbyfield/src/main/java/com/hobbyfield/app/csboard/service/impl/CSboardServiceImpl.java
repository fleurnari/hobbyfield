package com.hobbyfield.app.csboard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.common.Criteria;
import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.csboard.mapper.CSBoardMapper;
import com.hobbyfield.app.csboard.service1.CSBoardVO;
import com.hobbyfield.app.csboard.service1.CSboardService;

@Service
public class CSboardServiceImpl implements CSboardService{
	
	@Autowired
	CSBoardMapper csboardMapper;
	
	//CS게시글 총 갯수
	@Override
	public int csCount(SearchCriteria scri) {
		return csboardMapper.getTotalCount(scri);
	}
	//CS게시글 조회
	@Override
	public List<CSBoardVO> getCSBoardList(SearchCriteria scri) {
		return csboardMapper.selectAllCSList(scri);
	}
	//CS게시글 상세보기
	@Override
	public CSBoardVO getCSBoardInfo(int csNumber) {
		return csboardMapper.selectCSBoard(csNumber);
	}
	
	//CS게시글 등록
	@Override
	public int insertCSboardInfo(CSBoardVO csboardVO) {
		int result =csboardMapper.insertCSBoard(csboardVO);
		
		if(result == 1) {
			return csboardVO.getCsNumber();
		}else {
			return -1;
		}
	}

	//CS게시글 삭제
	@Override
	public void deleteCSboardInfo(int csboardNo) {
		csboardMapper.deleteBoard(csboardNo);
	}
	//CS게시글 수정
	@Override
	public void UpdateCSBoard(CSBoardVO csboardVO) {
			csboardMapper.UpdateCSBoard(csboardVO);
	}
	
	

	
}
