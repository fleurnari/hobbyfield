package com.hobbyfield.app.pointrecord.service;

import java.util.Date;

import lombok.Data;

@Data
public class PointRecordVO {
	private int pointRecordNum;
	private String memberEmail;
	private String pointType;
	private Date pointRecordDate;
	private Integer pointRecordContent;
}
