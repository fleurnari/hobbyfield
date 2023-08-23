package com.hobbyfield.app.point.service;

import lombok.Data;

@Data
public class PointOptionVO {
	// 포인트 상품 옵션
	private Integer pointId;
	private Integer pointOptId;
	private String pointPeriod;
	private String pointPrice;
}
