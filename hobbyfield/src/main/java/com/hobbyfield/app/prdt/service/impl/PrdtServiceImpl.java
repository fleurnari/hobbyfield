package com.hobbyfield.app.prdt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.prdt.mapper.PrdtMapper;
import com.hobbyfield.app.prdt.service.PrdtService;
import com.hobbyfield.app.prdt.service.PrdtVO;
import com.hobbyfield.app.prdt.service.ReviewVO;
@Service
public class PrdtServiceImpl implements PrdtService {
	
	@Autowired 
	PrdtMapper prdtMapper;
	
	//등록된 상품갯수
	@Override
	public int prdtCount(SearchCriteria scri) {
		return prdtMapper.prdtCount(scri);
	}
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
		return prdtMapper.selectPrdt(PrdtId);
	}
	
	
	//상품목록조회
	@Override
	public List<PrdtVO> selectAllPrdt(SearchCriteria scri) {
		return prdtMapper.selectAllPrdt(scri);
	}
	
	//등록상품삭제
	@Override
	public void deletePrdt(int prdtId) {
		prdtMapper.deletePrdt(prdtId);
	}
	
	//등록상품수정
	@Override
	public void updatePrdt(PrdtVO prdtVO) {
		prdtMapper.updatePrdt(prdtVO);
	}
	
	

}
