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
	
	//펀딩 프로젝트 리스트
	@Override
	public List<FundingPostVO> getFundingPostList() {
		return fundingPostMapper.selectFundingPostList();
	}
	//펀딩 프로젝트 상세보기
	@Override
	public FundingPostVO getFundingPostInfo(FundingPostVO fundingPostVO) {
		return fundingPostMapper.selectFundingPost(fundingPostVO);
	}
	//펀딩 프로젝트 등록
	@Override
	public int insertFundingPostInfo(FundingPostVO fundingPostVO) {
		int result = fundingPostMapper.insertFundingPost(fundingPostVO);
		
		if (result == 1) {
			return fundingPostVO.getFndPostNumber();
		} else {			
			return -1;
		}
	}
	//펀딩 조회수
	@Override
	public int updateFundingPostViews(FundingPostVO fundingPostVO) {
		return fundingPostMapper.FundingPostViewsCount(fundingPostVO);
	}

}
