package com.hobbyfield.app.talent.reply.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.talent.reply.mapper.TalentReplyMapper;
import com.hobbyfield.app.talent.reply.service.TalentReplyService;
import com.hobbyfield.app.talent.reply.service.TalentReplyVO;

@Service
public class TalentReplyServiceImpl implements TalentReplyService {

	@Autowired
	TalentReplyMapper talentReplyMapper;

	// 댓글 전체조회
	@Override
	public List<TalentReplyVO> getAllTalentReply(int tlntId) {
		return talentReplyMapper.getAllTalentReply(tlntId);
	}

	// 댓글 등록
	@Override
	public void createTalentReply(TalentReplyVO talentReplyVO) {
		talentReplyMapper.createTalentReply(talentReplyVO);
	}

	// 댓글 수정
	@Override
	public void updateTalentReply(TalentReplyVO talentReplyVO) {
		talentReplyMapper.updateTalentReply(talentReplyVO);
	}

	// 댓글 삭제
	@Override
	public void deleteTalentReply(int tlntRplyId) {
		talentReplyMapper.deleteTalentReply(tlntRplyId);
	}
}
