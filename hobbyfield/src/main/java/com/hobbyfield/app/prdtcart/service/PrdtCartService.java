package com.hobbyfield.app.prdtcart.service;

import java.util.List;

public interface PrdtCartService {
	
	//장바구니 담기
	public void addCart(CartVO cartVO);
	
	//장바구니 목록
	public List<CartListVO> cartList(String memberEmail);
	
	//장바구니 목록 삭제
	public void deleteCart(CartVO cartVO);
	
	//주문 취소
	
	//카트 비우기
	public void cleanCart(String memberEmail);
	
	
}
