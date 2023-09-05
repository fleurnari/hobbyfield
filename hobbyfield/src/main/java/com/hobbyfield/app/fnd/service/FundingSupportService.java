package com.hobbyfield.app.fnd.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.common.SearchCriteria;


public interface FundingSupportService {
	//펀딩 후원 목록 리스트
	public List<FundingSupportVO> getFundingSupportList();
	
	//펀딩 보기
	public List<FundingSupportVO> getFundingSupportInfo(FundingSupportVO fundingSupportVO);
	
	//펀딩 후원 등록
	public int isertFundingSupportInfo(FundingSupportVO fundingSupportVO);
	
	//펀딩 후원자 관리
	public List<FundingSupportVO> supportManagement(FundingSupportVO fundingSupportVO, SearchCriteria scri);
	
	//펀딩 송장번호 입력
	public int insertfundingInvoce(FundingSupportVO fundingSupportVO);
	
	//후원자 카운트
	public int supportCount(SearchCriteria scri);
}
