package com.hobbyfield.app.talent.service;

import java.util.Date;

import lombok.Data;

@Data
public class TalentVO {
	private Integer tlntId;
	private String tlntWriter;
	private Date tlntWdate; //작성일자
	private Integer tlntView;
	private String tlntTitle;
	private String tlntStatus; //모집/마감상태
	private String tlntStartday; //재능기부 시작일
	private String tlntEndday; // 재능기부 종료일
	private String tlntRegend; // 모집 마감일
	private String tlntContent;
	private String tlntCate;
	private Integer tlntCap;


}

//TLNT_WRITER	VARCHAR2(50 BYTE)
//TLNT_WDATE	DATE
//TLNT_VIEW	NUMBER(6,0)
//TLNT_TITLE	VARCHAR2(100 BYTE)
//TLNT_STATUS	VARCHAR2(4 BYTE)
//TLNT_STARTDAY	DATE
//TLNT_REGEND	DATE
//TLNT_ID	NUMBER(4,0)
//TLNT_ENDDAY	DATE
//TLNT_CONTENT	VARCHAR2(4000 BYTE)
//TLNT_CATE	VARCHAR2(30 BYTE)
//TLNT_CAP	NUMBER(2,0)