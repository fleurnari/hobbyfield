package com.hobbyfield.app.csboard.reply.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.common.Criteria;

public interface ReplyService {
	
	//´ñ±ÛÀÛ¼º
		public int insert(ReplyVO replyVO);
		//´ñ±ÛÁ¶È¸ 
		public ReplyVO read(Long rno);
		//´ñ±Û»èÁ¦
		public int delete (Long rno);
		//´ñ±Û¼öÁ¤
		public int update(ReplyVO replyVO);
		//´ñ±Û¸®½ºÆ®
		public List<ReplyVO> getListWithPaging(Criteria cri, Long csNumber);
					
	
}
