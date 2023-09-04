package com.hobbyfield.app.prdt.order.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.prdt.order.service.OrderVO;

public interface OrderMapper {
	//주문정보 입력
	public int insertOrderInfo(OrderVO orderVO);

	//주문현황 조회
	public List<OrderVO> orderList(String memberEmail);
	
	//주문현황 조회(관리자)
	public List<OrderVO> adminOrderList(String memberEmail);
	
	//주문취소
	public void cancelOrder(int orderId);

	
	//배송상태 변경(관리자)
	public void updateDelivery(@Param("orderIds") List<String> orderIds, @Param("delivery") String delivery);

	 
	
	

}
