package com.hobbyfield.app.prdt.mapper;

import java.util.List;

import com.hobbyfield.app.prdt.service.PrdtVO;

public interface PrdtMapper {
		//상품목록
		public List<PrdtVO> prdtList();
		//상품상세
		public PrdtVO prdtInfo(String prdtId);
}
