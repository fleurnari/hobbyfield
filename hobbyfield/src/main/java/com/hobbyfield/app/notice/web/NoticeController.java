package com.hobbyfield.app.notice.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobbyfield.app.comm.mapper.CommCodeMapper;
import com.hobbyfield.app.common.PageMaker;
import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.notice.service.NoticeService;
import com.hobbyfield.app.notice.service.NoticeVO;

@Controller
@RequestMapping("notice")
public class NoticeController {
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	CommCodeMapper codeMapper;

	// 공지사항 전체조회
	@GetMapping("/noticeList")
	public String getNoticeAllList(Model model, NoticeVO noticeVO, @ModelAttribute("scri") SearchCriteria scri) {    
		model.addAttribute("noticeList", noticeService.getNoticeAllList(scri, noticeVO));
		
		//검색&페이징
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(noticeService.countNotice(scri, noticeVO));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("scri", scri);
		
		//카테고리별 조회
		model.addAttribute("cate", codeMapper.selectNoticeCate("0AA"));
		return "notice/noticeList";
	}

	// 공지사항 단건조회
	@GetMapping("/noticeInfo")
	public String getNoticeInfo(NoticeVO noticeVO, Model model) {
		NoticeVO findVO = noticeService.getNoticeInfo(noticeVO);
		//공지사항 조회수 업데이트
		noticeService.updateNoticeView(findVO);
		model.addAttribute("notice", findVO);
		return "notice/noticeInfo";
	}

	// 공지사항 등록 - Form
	@GetMapping("/insertNotice")
	public String noticeInsertForm() {
		return "notice/noticeInsert";
	}

	// 공지사항 등록 - Process
	@PostMapping("/insertNotice")
	public String noticeInsertProcess(NoticeVO noticeVO) {
		noticeService.insertNotice(noticeVO);
		return "redirect:noticeList";
	}

	// 공지사항 수정 - Form
	@GetMapping("/updateNotice")
	public String noticeUpdateForm(NoticeVO noticeVO, Model model) {
		NoticeVO findVO = noticeService.getNoticeInfo(noticeVO);
		model.addAttribute("noticeInfo", findVO);
		return "notice/noticeUpdate";
	}

	// 공지사항 수정 - Process
	@PostMapping("/updateNotice")
	@ResponseBody
	public Map<String, Object> noticeUpdateProcess(NoticeVO noticeVO) {
		boolean result = false;

		int noticeId = noticeService.updateNotice(noticeVO);
		if (noticeId > 0) {
			result = true;
		}
		Map<String, Object> map = new HashMap<>();
		map.put("result", result);
		map.put("noticeInfo", noticeVO);

		return map;
	}

	// 공지사항 삭제 - Process
	@GetMapping("/deleteNotice")
	public String noticeDeleteProcess(@RequestParam(name = "noticeId") int noticeId) {
		noticeService.deleteNotice(noticeId);
		return "redirect:noticeList";
	}
}
