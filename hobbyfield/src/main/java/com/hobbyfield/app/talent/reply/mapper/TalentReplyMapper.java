package com.hobbyfield.app.talent.reply.mapper;

import java.util.List;

import com.hobbyfield.app.talent.reply.service.TalentReplyVO;

public interface TalentReplyMapper {

    // 댓글 전체조회
    List<TalentReplyVO> getAllTalentReply(int tlntId);

    // 댓글 등록
    void insertTalentReply(TalentReplyVO talentReplyVO);

    // 댓글 수정
    void updateTalentReply(TalentReplyVO talentReplyVO);

    // 댓글 삭제
    void deleteTalentReply(int tlntRplyId);
}
