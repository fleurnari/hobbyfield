package com.hobbyfield.app.csboard.reply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.common.Criteria;
import com.hobbyfield.app.csboard.reply.service.ReplyVO;

public interface ReplyMapper {
	
	//´ñ±ÛÀÛ¼º
	public int insert(ReplyVO replyVO);
	//´ñ±ÛÁ¶È¸ 
	public ReplyVO read(Long rno);
	//´ñ±Û»èÁ¦
	public int delete (Long rno);
	//´ñ±Û¾÷µ«
	public int update(ReplyVO replyVO);
	//´ñ±Û¸®½ºÆ®
	public List<ReplyVO> getListWithPaging(
				@Param("cri") Criteria cri,
				@Param("csNumber") Long csNumber);
	
	
	
}
