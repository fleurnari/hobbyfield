package com.hobbyfield.app.talent.service;

import lombok.Data;

@Data
public class TalentVO {
	private int tlntId;
	private String tlntCate;
	private String tlntTitle;
	private String tlntContent;
	private String tlntWriter;
	private String tlntWdate;
	private int tlntView;
	private String tlntStartday;
	private String tlntEndday;
	private Integer tlntCap;
	private String tlntStatus;
	private String tlntRegEnd;

}
//CREATE TABLE TALENT (
//		TLNT_ID	NUMBER(4,0)	NOT NULL,
//		TLNT_CATE	VARCHAR2(30)	NOT NULL,
//		TLNT_TITLE	VARCHAR2(100)	NOT NULL,
//		TLNT_CONTENT	VARCHAR2(4000)	NOT NULL,
//		TLNT_WRITER	VARCHAR2(50)	NOT NULL,
//		TLNT_WDATE	DATE	NULL,
//		TLNT_VIEW	NUMBER(6,0)	NULL,
//		TLNT_STARTDAY	DATE	NOT NULL,
//		TLNT_ENDDAY	DATE	NOT NULL,
//		TLNT_CAP	NUMBER(2,0)	NOT NULL,
//		TLNT_STATUS	VARCHAR2(4)	NULL,
//		TLNT_REGEND	DATE	NOT NULL
////	);
//CREATE TABLE TALENT_REPLY (
//		TLNT_RPLY_ID	NUMBER(4,0)	NOT NULL,
//		TLNT_ID	NUMBER(4,0)	NOT NULL,
//		TLNT_RPLY_SUBJECT	VARCHAR2(100)	NOT NULL,
//		TLNT_RPLY_WDATE	DATE	NULL,
//		TLNT_RPLY_PNUM	NUMBER(4,0)	NULL,
//		TLNT_RPLY_PARENT	VARCHAR2(50)	NULL,
//		TLNT_RPLY_SCRET	VARCHAR2(4)	NULL,
//		TLNT_RPLY_LEVEL	VARCHAR2(4)	NULL
//	);

