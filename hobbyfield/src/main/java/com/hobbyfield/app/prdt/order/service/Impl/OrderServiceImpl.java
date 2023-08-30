package com.hobbyfield.app.prdt.order.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	

}
