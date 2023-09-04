package com.hobbyfield.app.fnd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.fnd.mapper.FundingPostMapper;
import com.hobbyfield.app.fnd.service.FundingPostService;
import com.hobbyfield.app.fnd.service.FundingPostVO;

@Service
public class FundingPostServiceImpl implements FundingPostService {
	
	@Autowired
	FundingPostMapper fundingPostMapper;
	
	
	@Override
	public List<FundingPostVO> getFundingPostList(SearchCriteria scri) {
		return fundingPostMapper.selectFundingPostList(scri);
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
		System.out.println(result);
		
		if (result == 1) {
			return fundingPostVO.getFndPostNumber();
		} else {
			return -1;
		}
	}
	
	//조회수 업데이트
	@Override
	public int updateFundingPostViews(FundingPostVO fundingPostVO) {
		return fundingPostMapper.FundingPostViewsCount(fundingPostVO);
	}
	
	//결제 후 모인금액 및 참여인원 업데이트
	@Override
	public int updateFundingPostPayment(FundingPostVO fundingPostVO) {
		return fundingPostMapper.updateFundingPostPayment(fundingPostVO);
	}
	
	//펀딩 프로젝트 삭제
	@Override
	public int deleteFundingPost(FundingPostVO fndPostNumber) {
		return fundingPostMapper.deleteFundingPost(fndPostNumber);
	}
	
	//내 프로젝트
	@Override
	public List<FundingPostVO> selectMyProjectList(FundingPostVO fundingPostVO){
		return fundingPostMapper.selectMyProjectList(fundingPostVO);
	}

	//게시물 개수
	
	@Override
	public int postCount(SearchCriteria scri) {
		return fundingPostMapper.getTotalCount(scri);
	}

}
