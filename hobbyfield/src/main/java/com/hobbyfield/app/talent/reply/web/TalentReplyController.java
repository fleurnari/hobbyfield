package com.hobbyfield.app.talent.reply.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.hobbyfield.app.talent.reply.service.TalentReplyService;
import com.hobbyfield.app.talent.reply.service.TalentReplyVO;

@Controller
public class TalentReplyController {

	@Autowired
	private TalentReplyService talentReplyService;

	// 댓글 등록
	@PostMapping("/talent/replycreate")
	public String insertTalentReply(TalentReplyVO talentReplyVO) {
		talentReplyService.insertTalentReply(talentReplyVO);
		return "redirect:/talent/talentReplyInfo" + talentReplyVO.getTlntId();
	}

	// 댓글 수정
	@PostMapping("/talent/reply/update/{tlntRplyId}")
	public String updateTalentReply(@PathVariable int tlntRplyId, TalentReplyVO talentReplyVO) {
		talentReplyService.updateTalentReply(talentReplyVO);
		return "redirect:/talent/" + talentReplyVO.getTlntId();
	}

	// 댓글 삭제
	@PostMapping("/talent/reply/delete/{tlntRplyId}")
	public String deleteTalentReply(@PathVariable int tlntRplyId, TalentReplyVO talentReplyVO) {
		talentReplyService.deleteTalentReply(tlntRplyId);
		return "redirect:/talent/talentReplyInfo" + talentReplyVO.getTlntId();
	}
}
