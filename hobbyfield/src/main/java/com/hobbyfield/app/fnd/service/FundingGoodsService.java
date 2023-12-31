package com.hobbyfield.app.fnd.service;

import java.util.List;

public interface FundingGoodsService {
	//옵션리스트불러오기
	public List<FundingGoodsVO> getFundingGoods(FundingPostVO fundingPostVO);
	
	//옵션조회
	public FundingGoodsVO getFundingGoodsInfo(FundingGoodsVO fundingGoodsVO);
	
	//펀딩등록
	public int insertFundingGoodsInfo(FundingGoodsVO fundingGoodsVO);
	
	//옵션삭제
	public int deleteGoods(FundingGoodsVO fundingGoodsVO);
	
	//게시물 삭제시 옵션삭제
	public int deletePostGoods(FundingPostVO fndPostNumber);

}
