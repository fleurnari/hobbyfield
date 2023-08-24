package com.hobbyfield.app.prdt.service;

import java.util.List;

public interface PrdtService {
	//상품등록
	public int insertPrdt(PrdtVO prdtVO);
		
	//상품상세보기
	public PrdtVO selectPrdt(int PrdtId);
		
	//상품목록조회
	public List<PrdtVO> selectAllPrdt();
	
}
