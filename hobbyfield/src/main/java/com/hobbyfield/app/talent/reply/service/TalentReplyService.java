package com.hobbyfield.app.talent.reply.service;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface TalentReplyService {

    // 댓글 전체조회
    List<TalentReplyVO> getAllTalentReply(int tlntId);

    // 댓글 등록
    void createTalentReply(TalentReplyVO talentReplyVO);

    // 댓글 수정
    void updateTalentReply(TalentReplyVO talentReplyVO);

    // 댓글 삭제
    void deleteTalentReply(int tlntRplyId);
}
