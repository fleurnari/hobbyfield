package com.hobbyfield.app.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	// 관리자 페이지
	@GetMapping("/adminPage")
	public String adminPage() {
		return "admin/adminPage";
	}

}
