package com.hobbyfield.app.csboard.mapper;

import java.util.List;

import com.hobbyfield.app.common.Criteria;
import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.csboard.service1.CSBoardVO;

public interface CSBoardMapper {
	//�Խñ� �Ѱ��� ��ȸ
	public int getTotalCount(SearchCriteria scri);
	
	//CS�Խñ� ����Ʈ ��ȸ
	public List<CSBoardVO> selectAllCSList(SearchCriteria scri);
	
	//�Խñ� �󼼺���
	public CSBoardVO selectCSBoard(int csNumber);
	
	//�Խñ� ���
	public int insertCSBoard(CSBoardVO CSboard);
	
	//�Խñ� ����
	public void UpdateCSBoard(CSBoardVO csboardVO);
	//�Խñ� ����
	public void deleteBoard(int boardNo);
	
	
}
