package com.hobbyfield.app.prdt.mapper;

import java.util.List;

import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.prdt.service.PrdtVO;
import com.hobbyfield.app.prdt.service.ReviewVO;

public interface PrdtMapper {
	//등록된 상품의 갯수
	public int prdtCount(SearchCriteria scri);
	
	//상품등록
	public int insertPrdt(PrdtVO prdtVO);
	
	//상품상세보기
	public PrdtVO selectPrdt(int PrdtId);
	
	//상품목록조회
	public List<PrdtVO> selectAllPrdt(SearchCriteria scri);
	
	//상품수정하기
	public void updatePrdt(PrdtVO prdtVO);
	
	//등록상품 삭제
	public void deletePrdt(int prdtId);
	
	
}
