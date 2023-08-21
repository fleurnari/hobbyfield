package com.hobbyfield.app.prdt.service;

import java.util.List;

public interface PrdtService {
	//상품목록
	public List<PrdtVO> prdtList();
	//상품상세보기
	public PrdtVO prdtInfo(String prdtId);
}
