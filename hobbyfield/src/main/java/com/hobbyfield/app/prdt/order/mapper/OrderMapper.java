package com.hobbyfield.app.prdt.order.mapper;

import java.util.List;

import com.hobbyfield.app.prdt.order.service.OrderVO;

public interface OrderMapper {
	//주문정보 입력
	public int insertOrderInfo(OrderVO orderVO);

	//주문현황 조회
	public List<OrderVO> orderList(String memberEmail);
	
}
