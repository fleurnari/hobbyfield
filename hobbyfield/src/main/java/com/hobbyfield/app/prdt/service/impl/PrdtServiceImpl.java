package com.hobbyfield.app.prdt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.prdt.mapper.PrdtMapper;
import com.hobbyfield.app.prdt.service.PrdtService;
import com.hobbyfield.app.prdt.service.PrdtVO;
@Service
public class PrdtServiceImpl implements PrdtService {
	
	@Autowired 
	PrdtMapper prdtMapper;

	//상품등록
	@Override
	public int insertPrdt(PrdtVO prdtVO) {
		int result = prdtMapper.insertPrdt(prdtVO);
		
		if(result == 1) {
			return prdtVO.getPrdtId();
		}else {
			return -1;
		}
	}
	//상품상세보기
	@Override
	public PrdtVO selectPrdt(int PrdtId) {
		return prdtMapper.seletPrdt(PrdtId);
	}
	//상품목록조회
	@Override
	public List<PrdtVO> selectAllPrdt() {
		return prdtMapper.selectAllPrdt();
	}
	

}
