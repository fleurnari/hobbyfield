package com.hobbyfield.app.notice.service;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int noticeId;
	private String noticeCate;
	private String noticeTitle;
	private String noticeSubject;
	private String noticeWriter;
	private Date noticeWdate;
	private int noticeView;
}

// CREATE TABLE NOTICE (
//			NOTICE_ID	NUMBER(4,0)	NOT NULL,
//			NOTICE_CATE	VARCHAR2(50)	NULL,
//			NOTICE_TITLE	VARCHAR2(100)	NOT NULL,
//			NOTICE_SUBJECT	VARCHAR2(2000)	NOT NULL,
//			NOTICE_WRITER	VARCHAR2(50)	NOT NULL,
//			NOTICE_WDATE	DATE	NULL,
//			NOTICE_VIEW	NUMBER(6,0)	NULL
//		);
