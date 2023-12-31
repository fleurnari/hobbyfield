package com.hobbyfield.app.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.notice.mapper.NoticeMapper;
import com.hobbyfield.app.notice.service.NoticeService; // NoticeService를 임포트해야 합니다.
import com.hobbyfield.app.notice.service.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper noticeMapper;
	

	// 공지사항 전체조회
	@Override
	public List<NoticeVO> getNoticeAllList(SearchCriteria scri, NoticeVO noticeVO) {
		return noticeMapper.selectNoticeAllList(scri,noticeVO);
	}

	//공지사항 개수
	@Override
	public int countNotice(SearchCriteria scri, NoticeVO noticeVO) {
		return noticeMapper.countNotice(scri, noticeVO);
	}


	// 공지사항 단건조회
	@Override
	public NoticeVO getNoticeInfo(NoticeVO noticeVO) {
		return noticeMapper.selectNoticeInfo(noticeVO);
	}

	// 공지사항 등록
	@Override
	public int insertNotice(NoticeVO noticeVO) {
		int result = noticeMapper.insertNotice(noticeVO);
		if (result == 1) {
			return noticeVO.getNoticeId();
		} else {
			return -1;
		}
	}

	// 공지사항 수정
	@Override
	public int updateNotice(NoticeVO noticeVO) {
		int result = noticeMapper.updateNotice(noticeVO);
		if (result == 1) {
			return noticeVO.getNoticeId(); //
		} else {
			return -1;
		}
	}

	// 공지사항 삭제
	@Override
	public int deleteNotice(int delete) {
		int result = noticeMapper.deleteNotice(delete);
		if (result > 0) {
			return delete;
		} else {
			return -1;
		}
	}

	// 공지사항 조회수
	@Override
	public int updateNoticeView(NoticeVO noticeVO) {
		int result = noticeMapper.updateNoticeView(noticeVO);
		
		return result;
	}

	// 공지사항 카테고리별 조회
	@Override
	public List<NoticeVO> selectNoticeCate(String noticeCate) { 
		return noticeMapper.selectNoticeCate(noticeCate);
	}







}
