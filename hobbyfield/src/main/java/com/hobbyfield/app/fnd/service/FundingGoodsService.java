package com.hobbyfield.app.fnd.service;

import java.util.List;

public interface FundingGoodsService {
	//옵션불러오기
	public List<FundingGoodsVO> getFundingGoods(FundingPostVO fundingPostVO);
	
	
	//펀딩등록
	public int insertFundingGoodsInfo(FundingGoodsVO fundingGoodsVO);
}
