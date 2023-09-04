package com.hobbyfield.app.fnd.mapper;

import java.util.List;

import com.hobbyfield.app.fnd.service.FundingSupportVO;

public interface FundingSupportMapper {
	//펀딩 후원 목록 리스트
	public List<FundingSupportVO> selectFundingSupportList();
	
	//펀딩 후원 조회
	public List<FundingSupportVO> selectFundingSupport(FundingSupportVO fundingSupportVO);
	
	//펀딩 후원 등록
	public int insertFundingSupport(FundingSupportVO fundingSupportVO);
	
	//펀딩 후원자 관리
	public List<FundingSupportVO> supportManagement(FundingSupportVO fundingSupportVO);
	
	//펀딩 송장번호 입력
	public int insertfundingInvoce(FundingSupportVO fundingSupportVO);
}
