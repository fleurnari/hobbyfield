package com.hobbyfield.app.fnd.mapper;

import java.util.List;

import com.hobbyfield.app.fnd.service.FundingGoodsVO;
import com.hobbyfield.app.fnd.service.FundingPostVO;


public interface FundingGoodsMapper {
	//펀딩옵션리스트
	public List<FundingGoodsVO> selectFundingGoods(FundingPostVO fundingPostVO);

	//펀딩옵션등록
	public int insertFundingGoods(FundingGoodsVO fundingGoodsVO);


}


