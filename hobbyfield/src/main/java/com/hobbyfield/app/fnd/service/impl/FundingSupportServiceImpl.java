package com.hobbyfield.app.fnd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.fnd.mapper.FundingSupportMapper;
import com.hobbyfield.app.fnd.service.FundingSupportService;
import com.hobbyfield.app.fnd.service.FundingSupportVO;

@Service
public class FundingSupportServiceImpl implements FundingSupportService {

	@Autowired
	FundingSupportMapper fundingSupportMapper;
	
	@Override
	public List<FundingSupportVO> getFundingSupportList() {
		return fundingSupportMapper.selectFundingSupportList();
	}

	@Override
	public List<FundingSupportVO> getFundingSupportInfo(FundingSupportVO fundingSupportVO) {
		return fundingSupportMapper.selectFundingSupport(fundingSupportVO);
	}

	@Override
	public int isertFundingSupportInfo(FundingSupportVO fundingSupportVO) {
		int result = fundingSupportMapper.insertFundingSupport(fundingSupportVO);
		
		if (result == 1) {
			return fundingSupportVO.getFndSupportNumber();
		} else {
			return -1;
		}
	}
	
	@Override
	public List<FundingSupportVO> supportManagement(FundingSupportVO fundingSupportVO, SearchCriteria scri){
		return fundingSupportMapper.supportManagement(fundingSupportVO, scri);
	}
	
	@Override
	public int insertfundingInvoce(FundingSupportVO fundingSupportVO) {
		fundingSupportVO.getFndPostNumber();
		System.out.println(fundingSupportVO);
		int result = fundingSupportMapper.insertfundingInvoce(fundingSupportVO);
		if (result > 1 ) {
			return fundingSupportVO.getFndSupportNumber();
		} else {
			return -1;
		}
		
	}
	
	//후원자 카운트
	@Override
	public int supportCount(SearchCriteria scri) {
		return fundingSupportMapper.getSupportCount(scri);
	}
}
