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
	
	// 알림 조회
	@ResponseBody
	@GetMapping("/selectPushList")
	public List<PushVO> selectPushList(String memberEmail) {
		
		return pushService.selectPushList(memberEmail);
				
	}
	
	// 알림 수 가져오기
	@ResponseBody
	@GetMapping("/selectPushCount")
	public int selectPushCount(String memberEmail) {
		
		int push = pushService.selectPushCount(memberEmail);
		
		return push;
		
	}
	
	// 알림 등록
	@ResponseBody
	@PostMapping("/insertPush")
	public boolean insertPush(PushVO pushVO) {
		
		int result = pushService.insertPush(pushVO);
		
		if (result == 0) {
			return false;
		}
		
		return true;
		
	}
	
	// 알림 삭제
	@ResponseBody
	@PostMapping("/deletePush")
	public void deletePush(int pushId) {
		
		pushService.deletePush(pushId);
		
	}

	
	
	
	
}
