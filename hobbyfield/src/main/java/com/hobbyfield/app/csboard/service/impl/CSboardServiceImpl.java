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
	
	//CS�Խñ� �� ����
	@Override
	public int csCount(SearchCriteria scri) {
		return csboardMapper.getTotalCount(scri);
	}
	//CS�Խñ� ��ȸ
	@Override
	public List<CSBoardVO> getCSBoardList(SearchCriteria scri) {
		return csboardMapper.selectAllCSList(scri);
	}
	//CS�Խñ� �󼼺���
	@Override
	public CSBoardVO getCSBoardInfo(int csNumber) {
		return csboardMapper.selectCSBoard(csNumber);
	}
	
	//CS�Խñ� ���
	@Override
	public int insertCSboardInfo(CSBoardVO csboardVO) {
		int result =csboardMapper.insertCSBoard(csboardVO);
		
		if(result == 1) {
			return csboardVO.getCsNumber();
		}else {
			return -1;
		}
	}

	//CS�Խñ� ����
	@Override
	public void deleteCSboardInfo(int csboardNo) {
		csboardMapper.deleteBoard(csboardNo);
	}
	//CS�Խñ� ����
	@Override
	public void UpdateCSBoard(CSBoardVO csboardVO) {
			csboardMapper.UpdateCSBoard(csboardVO);
	}
	
	

	
}
