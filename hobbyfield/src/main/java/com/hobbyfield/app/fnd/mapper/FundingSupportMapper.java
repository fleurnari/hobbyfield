package com.hobbyfield.app.fnd.mapper;

import java.util.List;

import com.hobbyfield.app.fnd.service.FundingSupportVO;

public interface FundingSupportMapper {
	//펀딩 후원 목록 리스트
	public List<FundingSupportVO> selectFundingSupportList();
	
	//펀딩 후원 조회
	public FundingSupportVO selelctFundingSupport(FundingSupportVO fundingSupportVO);
	
	//펀딩 후원 등록
	public int insertFundingSupport(FundingSupportVO fundingSupportVO);
}
