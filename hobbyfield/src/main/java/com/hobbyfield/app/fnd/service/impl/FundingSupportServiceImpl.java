package com.hobbyfield.app.fnd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hobbyfield.app.fnd.mapper.FundingSupportMapper;
import com.hobbyfield.app.fnd.service.FundingSupportService;
import com.hobbyfield.app.fnd.service.FundingSupportVO;

public class FundingSupportServiceImpl implements FundingSupportService {

	@Autowired
	FundingSupportMapper fundingSupportMapper;
	
	@Override
	public List<FundingSupportVO> getFundingSupportList() {
		return fundingSupportMapper.selectFundingSupportList();
	}

	@Override
	public FundingSupportVO getFundingSupportInfo(FundingSupportVO fundingSupportVO) {
		return fundingSupportMapper.selelctFundingSupport(fundingSupportVO);
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

}
