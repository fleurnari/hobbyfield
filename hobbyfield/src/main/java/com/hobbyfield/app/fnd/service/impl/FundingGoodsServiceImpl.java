package com.hobbyfield.app.fnd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.fnd.mapper.FundingGoodsMapper;
import com.hobbyfield.app.fnd.service.FundingGoodsService;
import com.hobbyfield.app.fnd.service.FundingGoodsVO;
import com.hobbyfield.app.fnd.service.FundingPostVO;

@Service
public class FundingGoodsServiceImpl implements FundingGoodsService {
	
	@Autowired
	FundingGoodsMapper fundingGoodsMapper;
	

	//펀딩 옵션 리스트
	@Override
	public List<FundingGoodsVO> getFundingGoods(FundingPostVO fundingPostVO) {
		return fundingGoodsMapper.selectFundingGoodsList(fundingPostVO);
	}
	
	//펀딩 옵션 정보
	@Override
	public FundingGoodsVO getFundingGoodsInfo(FundingGoodsVO fundingGoodsVO) {
		System.out.println(fundingGoodsVO.getFndGoodsNumber());
		System.out.println(fundingGoodsVO.getFndGoodsAmount());
		return fundingGoodsMapper.selectFundingGoods(fundingGoodsVO);
	}
	
	//펀딩 옵션 등록
	@Override
	public int insertFundingGoodsInfo(FundingGoodsVO fundingGoodsVO) {
		System.out.println(fundingGoodsVO.getFndPostNumber());
		int result = fundingGoodsMapper.insertFundingGoods(fundingGoodsVO);
		
		if (result == 1) {
			return fundingGoodsVO.getFndPostNumber();
		} else {			
			return -1;
		}
	}
}
