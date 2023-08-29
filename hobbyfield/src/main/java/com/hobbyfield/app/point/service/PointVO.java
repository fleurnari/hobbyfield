package com.hobbyfield.app.point.service;

import java.util.List;

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
	private Integer groupPrice;

	List<PointOptionVO> pointOptionVO;
	List<EmojiVO> emojiVO;


}
