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
	
	@Override
	public List<PrdtVO> prdtList() {
		// TODO Auto-generated method stub
		return prdtMapper.prdtList();
	}

	@Override
	public PrdtVO prdtInfo(String prdtId) {
		return prdtMapper.prdtInfo(prdtId);
	}

}
