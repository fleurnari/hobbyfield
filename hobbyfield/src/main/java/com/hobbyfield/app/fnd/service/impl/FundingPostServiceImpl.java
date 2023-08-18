package com.hobbyfield.app.fnd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.fnd.mapper.FundingPostMapper;
import com.hobbyfield.app.fnd.service.FundingPostService;
import com.hobbyfield.app.fnd.service.FundingPostVO;

@Service
public class FundingPostServiceImpl implements FundingPostService {
	
	@Autowired
	FundingPostMapper fundingPostMapper;
	
	
	@Override
	public List<FundingPostVO> getFundingPostList() {
		return fundingPostMapper.selectFundingPostList();
	}
	
	@Override
	public FundingPostVO getFundingPostInfo(FundingPostVO fundingPostVO) {
		return fundingPostMapper.selectFundingPost(fundingPostVO);
	}
	
	@Override
	public int insertFundingPostInfo(FundingPostVO fundingPostVO) {
		int result = fundingPostMapper.insertFundingPost(fundingPostVO);
		
		if (result == 1) {
			return fundingPostVO.getFndPostNumber();
		} else {			
			return -1;
		}
	}
	

	//펀딩 임시저장 업데이트
	@Override
	public int updateFundingPostInfo(FundingPostVO fundingPostVO) {
		int result = fundingPostMapper.updateFundingPost(fundingPostVO);
		
		if (result == 1) {
			return fundingPostVO.getFndPostNumber();
		} else {
			return -1;
		}
	}
	

	@Override
	public int updateFundingPostViews(FundingPostVO fundingPostVO) {
		return fundingPostMapper.FundingPostViewsCount(fundingPostVO);
	}

}
