package com.hobbyfield.app.prdtcart.mapper;

import java.util.List;

import com.hobbyfield.app.prdtcart.service.CartListVO;
import com.hobbyfield.app.prdtcart.service.CartVO;

public interface PrdtCartMapper {
	
	//장바구니 담기
	public void addCart(CartVO cartVO);
	
	//장바구니 리스트
	
	public List<CartListVO> cartList(String memberEmail);
	
	//장바구니 목록 삭제
	public void deleteCart(CartVO cartVO);
	
	
	//카트 비우기
	public void cleanCart(String memberEmail);
	
}
