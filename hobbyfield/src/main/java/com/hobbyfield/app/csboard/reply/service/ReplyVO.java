package com.hobbyfield.app.csboard.reply.service;

import java.util.Date;
import lombok.Data;
@Data
public class ReplyVO {

	private Long rno; 			//´ñ±Û¹øÈ£  rno
	private Long csNumber;		//°Ô½Ã±Û¹øÈ£ csNumber
	private String replyContents; //´ñ±Û³»¿ë	reply
	private String replyWriter;		//´ñÀÛ¼ºÀÚ	 replyer
	private Date replyDate;			//´ñÀÛ¼ºÀÏ	 
	private Date updateDate;		//´ñ¼öÁ¤ÀÏ
	
}
