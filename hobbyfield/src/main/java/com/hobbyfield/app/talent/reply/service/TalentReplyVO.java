package com.hobbyfield.app.talent.reply.service;

import java.util.Date;

import lombok.Data;

@Data
public class TalentReplyVO {
	private int tlntRplyId;
	private int tlntId;
	private String tlntRplySubject;
	private Date tlntRplyWdate;
	private int tlntRplyPnum;
	private String tlntRplyParent;
	private String tlntRplySecret;
	private String tlntRplyLevel;
}
