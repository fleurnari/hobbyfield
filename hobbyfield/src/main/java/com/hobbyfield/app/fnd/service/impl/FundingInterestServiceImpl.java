package com.hobbyfield.app.fnd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.fnd.mapper.FundingInterestMapper;
import com.hobbyfield.app.fnd.service.FundingInterestService;
import com.hobbyfield.app.fnd.service.FundingInterestVO;

@Service
public class FundingInterestServiceImpl implements FundingInterestService {
	
	@Autowired
	FundingInterestMapper fundingInterestMapper;
	
	@Override
	public List<FundingInterestVO> selectFundingInterestList(String memberEmail) {

		return fundingInterestMapper.selectFundingInterestList(memberEmail);
	}

	@Override
	public int insertFundingInterest(FundingInterestVO fundingInterestVO) {

		return fundingInterestMapper.insertFundingInterest(fundingInterestVO);
	}

	@Override
	public int deleteFundingInterest(FundingInterestVO fundingInterestVO) {

		return fundingInterestMapper.deleteFundingInterest(fundingInterestVO);
	}

	@Override
	public int countFundingInterest(int fndPostNumber) {

		return fundingInterestMapper.countFundingInterest(fndPostNumber);
	}

	@Override
	public int selectFundingInterest(int fndPostNumber, String memberEmail) {

		return fundingInterestMapper.selectFundingInterest(fndPostNumber, memberEmail);
	}

}
