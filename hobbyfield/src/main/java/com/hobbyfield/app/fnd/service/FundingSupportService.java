package com.hobbyfield.app.fnd.service;

import java.util.List;


public interface FundingSupportService {
	//펀딩 후원 목록 리스트
	public List<FundingSupportVO> getFundingSupportList();
	
	//펀딩 보기
	public List<FundingSupportVO> getFundingSupportInfo(FundingSupportVO fundingSupportVO);
	
	//펀딩 후원 등록
	public int isertFundingSupportInfo(FundingSupportVO fundingSupportVO);
	
	
}
