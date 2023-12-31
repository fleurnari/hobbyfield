package com.hobbyfield.app.fnd.mapper;

import java.util.List;

import com.hobbyfield.app.fnd.service.FundingGoodsVO;
import com.hobbyfield.app.fnd.service.FundingPostVO;


public interface FundingGoodsMapper {
	//펀딩옵션리스트
	public List<FundingGoodsVO> selectFundingGoodsList(FundingPostVO fundingPostVO);

	//펀딩옵션등록
	public int insertFundingGoods(FundingGoodsVO fundingGoodsVO);
	
	//펀딩옵션조회
	public FundingGoodsVO selectFundingGoods(FundingGoodsVO fundingGoodsVO);
	
	//펀딩옵션삭제
	public int deleteFundingGoods(FundingGoodsVO fundingGoodsVO);

	//펀딩옵션삭제(Post기준)
	public int deleteFundingPostGoods(FundingPostVO fndPostNumber);
}