package com.hobbyfield.app.prdt.order.service;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	
		private String orderId;		//주문번호
	    private String orderPhone;	//주문자 연락처
	    private String memberZip;	//우편번호
	    private String memberBaseaddr;	//기본주소
	    private String memberDetaaddr;	//상세주소
	    private String memberEmail;		//수령인
	    private String orderMemo;	//주문시 요청
	    private String delivery;	//배송상태
	    private String prdtName; 	//상품명
	    private Date orderDate;		//주문날짜
	    private int amount;			//총액
	    private String iamUid;
	    private String prdtOption;
	    
		/*
		 * create table prdt_order(
		 * 
		 * order_id int,
		 * 
		 * member_email varchar(50),
		 * 
		 * member_zip varchar(100),
		 * 
		 * member_baseaddr varchar(100),
		 * 
		 * member_detaaddr varchar(100),
		 * 
		 * order_phone varchar(30),
		 * 
		 * order_memo varchar(100),
		 * 
		 * delivery varchar(20),
		 * 
		 * primary key (order_id)
		 * 
		 * );
		 */
	    
}
