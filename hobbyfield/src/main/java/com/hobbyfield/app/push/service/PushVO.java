package com.hobbyfield.app.push.service;

import java.util.Date;

import lombok.Data;

@Data
public class PushVO {
	private int pushId;
	private String pushTarget;
	private String pushTyp;
	private String pushCntn;
	private String pushUrl;
	private Date pushDatetime;
	private String pushChk;
}
