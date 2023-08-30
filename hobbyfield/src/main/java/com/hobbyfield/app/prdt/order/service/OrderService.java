package com.hobbyfield.app.prdt.order.service;

import java.util.List;

public interface OrderService {
	
	//주문하기
	public int insertOrderInfo(OrderVO orderVO);
	
	//주문현황 조회
	public List<OrderVO> orderList(String memberEmail);
	
}
