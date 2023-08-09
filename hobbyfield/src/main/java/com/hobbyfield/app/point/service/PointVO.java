package com.hobbyfield.app.point.service;

import java.util.Date;
import lombok.Data;

@Data
public class PointVO {
	
	//포인트
	private int pointId;
	private String pointName;
	private String pointContent;
	private String pointItemType;
	private String pointState;
	private int pointView;
	private Date pointRegdate;
	private Date pointEndterm;
	private String pointImgName;
	private String pointImgPath;
	
	//포인트 옵션
	private int pointOptId;
	private Date pointPeriod;
	private int pointPrice;
	
	//이모티콘
	private int emojiId;
	private String emojiName;
	private String emojiImgName;
	private String emojiImgPath;
	
}
