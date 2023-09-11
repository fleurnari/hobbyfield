package com.hobbyfield.app.fnd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.fnd.service.FundingInterestVO;

public interface FundingInterestMapper {
	
	// 관심 목록
	public List<FundingInterestVO> selectFundingInterestList(String memberEmail);
	
	// 관심 목록 추가
	public int insertFundingInterest(FundingInterestVO fundingInterestVO);
	
	// 관심 목록 삭제
	public int deleteFundingInterest(FundingInterestVO fundingInterestVO);
	
	// 펀딩 게시물의 관심 목록 등록된 수
	public int countFundingInterest(int fndPostNumber);
	
	// 관심 목록 눌렀는지 확인
	public int selectFundingInterest(@Param("fndPostNumber") int fndPostNumber, @Param("memberEmail") String memberEmail);

}
