package com.hobbyfield.app.prdt.order.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hobbyfield.app.prdt.order.mapper.OrderMapper;
import com.hobbyfield.app.prdt.order.service.OrderService;
import com.hobbyfield.app.prdt.order.service.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderMapper orderMapper;

	@Override
	public int insertOrderInfo(OrderVO orderVO) {
		return orderMapper.insertOrderInfo(orderVO);
	}

	@Override
	public List<OrderVO> orderList(String memberEmail) {
		return orderMapper.orderList(memberEmail);	
	}

	//관리자 주문관리
	@Override
	public List<OrderVO> adminOrderList(String memberEmail) {
		return orderMapper.orderList(memberEmail);
	}

	@Override
	public void updateDelivery(List<String> orderIds, String delivery) {
		 orderMapper.updateDelivery(orderIds, delivery);
	}

	@Override
	public void cancelOrder(String orderId) {
		orderMapper.cancelOrder(orderId);
	}

	@Override
	public String getDelivery(String orderId) {
		return orderMapper.getDelivery(orderId);
	}

}

	
	

