package com.hobbyfield.app.csboard.service1;

import java.util.List;

import com.hobbyfield.app.common.SearchCriteria;

public interface CSboardService {
	
	//CS�Խñ� �� ��ȸ
	public int csCount(SearchCriteria scri);
	
	//CS�Խñ۸��
	public List<CSBoardVO> getCSBoardList(SearchCriteria scri);
	
	//CS�Խñ� �󼼺���
	public CSBoardVO getCSBoardInfo(int csNumber);
	
	//CS�Խñ� ���
	public int insertCSboardInfo(CSBoardVO csboardVO);
	
	//CS�Խñ� ����
	public void UpdateCSBoard(CSBoardVO csboardVO);
	//CS�Խñ� ����
	public void deleteCSboardInfo(int csboardNo);
	
	
	
	
}
