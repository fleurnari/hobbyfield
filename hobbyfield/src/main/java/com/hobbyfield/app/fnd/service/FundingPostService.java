package com.hobbyfield.app.fnd.service;

import java.util.List;

public interface FundingPostService {
	//전체조회
	public List<FundingPostVO> getFundingPostList();
		
	//상세보기
	public FundingPostVO getFundingPostInfo(FundingPostVO fundingPostVO);
		
	//등록
	public int insertFundingPostInfo(FundingPostVO fundingPostVO);
		
	//조회수
	public int updateFundingPostViews(FundingPostVO fundingPostVO);
}
