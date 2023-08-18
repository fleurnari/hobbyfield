package com.hobbyfield.app.talent.mapper;

import java.util.List;

import com.hobbyfield.app.talent.service.TalentVO;

public interface TalentMapper {

    // 재능기부 전체조회
    public List<TalentVO> getAllTalent();

    // 재능기부 단건조회
    public TalentVO getTalentInfo(int tlntId);

    // 재능기부 글 등록
    public void createTalent(TalentVO talent);

    // 재능기부 글 수정
    public void updateTalent(TalentVO talent);

    // 재능기부 글 삭제
    public void deleteTalent(int tlntId);

    // 재능기부 글 조회수 증가
    public void increaseViewCount(int tlntId);
}
