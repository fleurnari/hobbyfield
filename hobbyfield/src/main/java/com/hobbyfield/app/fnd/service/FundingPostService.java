package com.hobbyfield.app.fnd.service;

import java.util.List;

public interface FundingPostService {
	//전체조회
	public List<FundingPostVO> getFundingPostList();
		
	//상세보기
	public FundingPostVO getFundingPostInfo(FundingPostVO fundingPostVO);
		
	//등록
	public int insertFundingPostInfo(FundingPostVO fundingPostVO);
	
	//임시저장 업데이트
	public int updateFundingPostInfo(FundingPostVO fundingPostVO);
	
	//조회수
	public int updateFundingPostViews(FundingPostVO fundingPostVO);
	
	//결제 후 모인금액 및 참여인원
	public int updateFundingPostPayment(FundingPostVO fundingPostVO);
}
