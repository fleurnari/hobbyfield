package com.hobbyfield.app.csboard.reply.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.common.Criteria;
import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.csboard.reply.mapper.ReplyMapper;
import com.hobbyfield.app.csboard.reply.service.ReplyService;
import com.hobbyfield.app.csboard.reply.service.ReplyVO;
import com.hobbyfield.app.csboard.service1.CSBoardVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	
	@Setter(onMethod_ =@Autowired)
	private ReplyMapper replymapper;

	@Override
	public int insert(ReplyVO replyVO) {
		return replymapper.insert(replyVO);
	}

	@Override
	public ReplyVO read(Long csNumber) {
		return replymapper.read(csNumber);
	}

	@Override
	public int delete(Long rno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(ReplyVO replyVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReplyVO> getListWithPaging(Criteria cri, Long csNumber) {
		return replymapper.getListWithPaging(cri, csNumber);
	}

	
	

	


}
