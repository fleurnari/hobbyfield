package com.hobbyfield.app.prdt.mapper;

import java.util.List;

import com.hobbyfield.app.prdt.service.PrdtVO;

public interface PrdtMapper {
	//상품등록
	public int insertPrdt(PrdtVO prdtVO);
	
	//상품상세보기
	public PrdtVO seletPrdt(int PrdtId);
	
	//상품목록조회
	public List<PrdtVO> selectAllPrdt();
	
}
