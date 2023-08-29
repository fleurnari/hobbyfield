package com.hobbyfield.app.prdtcart.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.prdtcart.mapper.PrdtCartMapper;
import com.hobbyfield.app.prdtcart.service.CartListVO;
import com.hobbyfield.app.prdtcart.service.CartVO;
import com.hobbyfield.app.prdtcart.service.PrdtCartService;

@Service
public class PrdtCartServiceImpl implements PrdtCartService{

	@Autowired
	PrdtCartMapper prdtCartMapper;
	
	
	@Override
	public void addCart(CartVO cartVO) {
		prdtCartMapper.addCart(cartVO);
	}


	@Override
	public List<CartListVO> cartList(String memberEmail) {
		return prdtCartMapper.cartList(memberEmail);
	}


	@Override
	public void deleteCart(CartVO cartVO) {
		
		prdtCartMapper.deleteCart(cartVO);
	}


	@Override
	public void cleanCart(String memberEmail) {
		prdtCartMapper.cleanCart(memberEmail);
		
	}


}
