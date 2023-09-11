package com.hobbyfield.app.prdt.order.service.Impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.hobbyfield.app.prdt.order.mapper.OrderMapper;
import com.hobbyfield.app.prdt.order.service.OrderService;
import com.hobbyfield.app.prdt.order.service.OrderVO;

import lombok.Getter;
import lombok.ToString;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderMapper orderMapper;
	
	@ToString
	@Getter
	private class Response{
		private PaymentInfo response;
	}
	
	@ToString
	@Getter
	private class PaymentInfo{
		private int amount;
	}
	
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
	
	
	private String impKey = "2438810571100666";
	
	private String impSecret = "djVkq2enD6Hh1D8GKlzCjiJqGZj1ig0dYwkT6wQfknReVwSvpVcBBeYNIDRiIzWggDYodmQw1U7B1zXj";
	
	@Override
	public String getToken() throws IOException {

		HttpsURLConnection conn = null;

		URL url = new URL("https://api.iamport.kr/users/getToken");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", impKey);
		json.addProperty("imp_secret", impSecret);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson();

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
		
		System.out.println(response);

		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		return token;
	}
	
	//결제정보가져오기
	@Override
	public int paymentInfo(String imp_uid, String access_token) throws IOException {
	    
		 HttpsURLConnection conn = null;
		 
		    URL url = new URL("https://api.iamport.kr/payments/" + imp_uid);
		 
		    conn = (HttpsURLConnection) url.openConnection();
		 
		    conn.setRequestMethod("GET");
		    conn.setRequestProperty("Authorization", access_token);
		    conn.setDoOutput(true);
		 
		    BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
		    
		    Gson gson = new Gson();
		    
		    Response response = gson.fromJson(br.readLine(), Response.class);
		    
		    br.close();
		    conn.disconnect();
		    
		    return response.getResponse().getAmount();
	}
	
	//결제취소
	@Override
	public void payMentCancle(String access_token, String imp_uid, String amount) throws IOException {
		System.out.println("결제 취소");
		
		System.out.println(access_token);
		
		System.out.println(imp_uid);
		
		HttpsURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/payments/cancel");
 
		conn = (HttpsURLConnection) url.openConnection();
 
		conn.setRequestMethod("POST");
 
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Authorization", access_token);
 
		conn.setDoOutput(true);
		
		JsonObject json = new JsonObject();
 
		json.addProperty("imp_uid", imp_uid);
		json.addProperty("amount", amount);
		json.addProperty("checksum", amount);
 
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
 
		bw.write(json.toString());
		bw.flush();
		bw.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
 
		br.close();
		conn.disconnect();
		
		
	}



}
	

