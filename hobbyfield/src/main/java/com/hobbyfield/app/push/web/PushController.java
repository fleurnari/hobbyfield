package com.hobbyfield.app.push.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobbyfield.app.push.service.PushService;
import com.hobbyfield.app.push.service.PushVO;


@Controller
@RequestMapping("/push/*")
public class PushController {
	
	@Autowired
	PushService pushService;
	


	// 알림 목록 조회
	@ResponseBody
	@GetMapping("/selectPushList")
	public List<PushVO> selectPushList(String memberEmail) {
		
		return pushService.selectPushList(memberEmail);
	
	}
	
	// 알림 수
	@ResponseBody
	@GetMapping("/selectPushCount")
	public int selectPushCount(String memberEmail) {
		
		int pushCount = pushService.selectPushCount(memberEmail);
		
		return pushCount; 
		
	}
	
	// 알림 등록
	@ResponseBody
	@PostMapping("/insertPush")
	public int insertPush(String pushTarget, String pushTyp, String pushCntn, String pushUrl) {
		int result = pushService.insertPush(pushTarget, pushTyp, pushCntn, pushUrl);
		
		return result;
	}
	
	// 알림 읽음 여부 변경
	@ResponseBody
	@PostMapping("/updatePush")
	public String updatePush(int pushId) {
		
		pushService.updatePush(pushId);
		
		return null;
	}
	
	
	// 알림 삭제
	@ResponseBody
	@PostMapping("/deletePush")
	public String deletePush(int pushId) {
		
		pushService.deletePush(pushId);
		
		return null;
	}
	
	
	// 알림 전체 삭제
	@ResponseBody
	@PostMapping("/deleteAllPush")
	public String deleteAllPush(String memberEmail) {
		
		pushService.deleteAllPush(memberEmail);
		
		return null;
	}
	
	
}
