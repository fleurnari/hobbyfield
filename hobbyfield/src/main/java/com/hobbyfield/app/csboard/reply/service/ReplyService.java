package com.hobbyfield.app.csboard.reply.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.common.Criteria;

public interface ReplyService {
	
	//����ۼ�
		public int insert(ReplyVO replyVO);
		//�����ȸ 
		public ReplyVO read(Long rno);
		//��ۻ���
		public int delete (Long rno);
		//��ۼ���
		public int update(ReplyVO replyVO);
		//��۸���Ʈ
		public List<ReplyVO> getListWithPaging(Criteria cri, Long csNumber);
					
	
}
