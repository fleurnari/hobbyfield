package com.hobbyfield.app.csboard.reply.service;

import java.util.Date;
import lombok.Data;
@Data
public class ReplyVO {

	private Long rno; 			//��۹�ȣ  rno
	private Long csNumber;		//�Խñ۹�ȣ csNumber
	private String replyContents; //��۳���	reply
	private String replyWriter;		//���ۼ���	 replyer
	private Date replyDate;			//���ۼ���	 
	private Date updateDate;		//�������
	
}
