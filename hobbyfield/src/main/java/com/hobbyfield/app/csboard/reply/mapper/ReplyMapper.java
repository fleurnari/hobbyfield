package com.hobbyfield.app.csboard.reply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.common.Criteria;
import com.hobbyfield.app.csboard.reply.service.ReplyVO;

public interface ReplyMapper {
	
	//����ۼ�
	public int insert(ReplyVO replyVO);
	//�����ȸ 
	public ReplyVO read(Long rno);
	//��ۻ���
	public int delete (Long rno);
	//��۾���
	public int update(ReplyVO replyVO);
	//��۸���Ʈ
	public List<ReplyVO> getListWithPaging(
				@Param("cri") Criteria cri,
				@Param("csNumber") Long csNumber);
	
	
	
}
