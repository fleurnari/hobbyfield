package com.hobbyfield.app.csboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.csboard.service1.CSReplyVO;

public interface CSReplyMapper {
	
	//댓글작성
	public void insertReply(CSReplyVO replyVO);

	//댓글목록조회
	public List<CSReplyVO> readReply(int csNumber);

	//댓글상세보기
	public CSReplyVO getReply(int replyId);
	
	//댓글수정
	public void updateReply(CSReplyVO replyVO);
	
	//댓글삭제
    public void deleteReply(CSReplyVO replyVO);

}
