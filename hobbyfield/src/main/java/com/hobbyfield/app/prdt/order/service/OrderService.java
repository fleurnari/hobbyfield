package com.hobbyfield.app.prdt.order.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface OrderService {
	
	//주문하기
	public int insertOrderInfo(OrderVO orderVO);
	
	//주문현황 조회
	public List<OrderVO> orderList(String memberEmail);
	
	//주문현황 조회(관리자)
	public List<OrderVO> adminOrderList(String memberEmail);
		
	
	//배송상태 변경(관리자)
	void updateDelivery(@Param("orderIds") List<String> orderIds, @Param("delivery") String delivery);
}
