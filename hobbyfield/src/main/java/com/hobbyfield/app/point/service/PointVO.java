package com.hobbyfield.app.point.service;

import java.util.Date;


import lombok.Data;

@Data
public class PointVO {

	// 포인트
	private Integer pointId;
	private String pointName;
	private String pointContent;
	private String pointItemType;
	private String pointState;
	private Integer pointView;
	private String pointRegdate;
	private String pointEndterm;
	private String pointImgName;
	private String pointImgPath;

	// 포인트 옵션
	private Integer pointOptId;
	private Date pointPeriod;
	private Integer pointPrice;

	// 이모티콘
	private Integer emojiId;
	private String emojiName;
	private String emojiImgName;
	private String emojiImgPath;

}
