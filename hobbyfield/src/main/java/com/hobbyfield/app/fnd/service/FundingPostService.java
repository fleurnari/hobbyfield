package com.hobbyfield.app.fnd.service;

import java.util.List;

import com.hobbyfield.app.common.SearchCriteria;

public interface FundingPostService {
	//전체조회
	public List<FundingPostVO> getFundingPostList(SearchCriteria scri);
		
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
	
	//펀딩 프로젝트 삭제
	public int deleteFundingPost(FundingPostVO fndPostNumber);
	
	//내 프로젝트
	public List<FundingPostVO> selectMyProjectList(FundingPostVO fundingPostVO);
	
	//펀딩게시글 카운트
	public int postCount(SearchCriteria scri);
	
	// 카테고리별 펀딩 정렬
	public List<FundingPostVO> selectFundingPostCate(String fndCategory);

}
