package com.hobbyfield.app.fnd.service;

import lombok.Data;

@Data
public class FundingSupportVO {
	//후원번호
	private Integer fndSupportNumber;
	//펀딩 게시물 번호
	private Integer fndPostNumber;
	//상품 번호
	private Integer fndGoodsNumber;
	//주문 번호
	private Integer fndOrderId;
	//구매자ID
	private String memberEmail;
	//주문 상태
	private Integer fndOrderState;
	//송장 번호
	private String fndInvoice;
	//주문 날짜
	private String fndOrderDate;
	//결제 날짜
	private String fndPaymentDate;
	//주문 수량
	private Integer fndOrderAmount;
	//총 결제 금액
	private Integer fndTotalPrice;
	//수신인
	private String fndOrderRecipient;
	//우편번호
	private String fndZip;
	//기본 주소
	private String fndBaseAddr;
	//상세 주소
	private String fndDetaAddr;
	//연락처
	private String fndCntinfo;
	//요청사항
	private String fndOrderRequest;
	//결제수단
	private String fndPayType;
	//배송일자
	private String fndShipdt;
	//
	private String fndGoodsName;
	private Integer fndGoodsPrice;
	private String fndMainImg;
	private String fndCategory;
	private String fndTitle;
	private Integer fndStatus;
	private String fndEndDate;
}
