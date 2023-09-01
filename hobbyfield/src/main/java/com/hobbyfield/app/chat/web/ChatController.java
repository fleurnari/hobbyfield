package com.hobbyfield.app.chat.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/chat/*")
@Controller
public class ChatController {


	@GetMapping("/chatting")
	public String chatting() {
		return "chat/chatting";
	}
	
	
}
