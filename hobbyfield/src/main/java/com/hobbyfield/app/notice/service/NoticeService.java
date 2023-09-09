package com.hobbyfield.app.notice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hobbyfield.app.common.Criteria;
import com.hobbyfield.app.common.SearchCriteria;

@Service
public interface NoticeService {
	// 공지사항 전체조회
	public List<NoticeVO> getNoticeAllList(SearchCriteria scri, NoticeVO noticeVO);

	// 공지사항 개수
	public int countNotice(SearchCriteria scri, NoticeVO noticeVO);
	
	// 공지사항 단건조회
	public NoticeVO getNoticeInfo(NoticeVO noticeVO);

	// 공지사항 등록
	public int insertNotice(NoticeVO noticeVO);

	// 공지사항 수정
	public int updateNotice(NoticeVO noticeVO);

	// 공지사항 삭제
	public int deleteNotice(int noticeId);

	// 공지사항 조회수
	public int updateNoticeView(NoticeVO noticeVO);

	// 공지사항 카테고리별 조회
	public List<NoticeVO> selectNoticeCate(String noticeCate);

}
