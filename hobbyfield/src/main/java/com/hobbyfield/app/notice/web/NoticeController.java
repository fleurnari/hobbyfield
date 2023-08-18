package com.hobbyfield.app.notice.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobbyfield.app.notice.service.NoticeService;
import com.hobbyfield.app.notice.service.NoticeVO;

@Controller
public class NoticeController {
	@Autowired
	NoticeService noticeService;

	// 공지사항 전체조회
	@GetMapping("/noticeList")
	public String getNoticeAllList(Model model) {
		model.addAttribute("noticeList", noticeService.getNoticeAllList());
		return "notice/noticeList";
	}

	// 공지사항 단건조회
	@GetMapping("/noticeInfo")
	public String getNoticeInfo(NoticeVO noticeVO, Model model) {
		NoticeVO findVO = noticeService.getNoticeInfo(noticeVO);
		model.addAttribute("noticeInfo", findVO);
		noticeService.noticeViewCount(noticeVO);
		return "notice/noticeList";
	}

	// 공지사항 등록 - Form
	@GetMapping("/noticeInsert")
	public String noticeInsertForm() {
		return "notice/noticeInsert";
	}

	// 공지사항 등록 - Process
	@PostMapping("/noticeInsert")
	public String noticeInsertProcess(NoticeVO noticeVO) {
		noticeService.insertNotice(noticeVO);
		return "redirect:noticeList";
	}

	// 공지사항 수정 - Form
	@GetMapping("/noticeUpdate")
	public String noticeUpdateForm(NoticeVO noticeVO, Model model) {
		NoticeVO findVO = noticeService.getNoticeInfo(noticeVO);
		model.addAttribute("noticeInfo", findVO);
		return "notice/noticeUpdate";
	}

	// 공지사항 수정 - Process
	@PostMapping("noticeUpdate")
	@ResponseBody
	public Map<String, Object> updateNoticeProcess(NoticeVO noticeVO) {
		boolean result = false;

		int noticeId = noticeService.updateNotice(noticeVO);
		if (noticeId > -1) {
			result = true;
		}
		Map<String, Object> map = new HashMap<>();
		map.put("result", result);
		map.put("noticeInfo", noticeVO);

		return map;
	}

	// 공지사항 삭제 - Process
	@PostMapping("/noticeDelete")
	public String noticeDeleteProcess(@RequestParam(name = "noticeId") int noticeId) {
		noticeService.deleteNotice(noticeId);
		return "redirect:/noticeList";
	}
}
