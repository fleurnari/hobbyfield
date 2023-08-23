package com.hobbyfield.app.prdt.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hobbyfield.app.prdt.service.PrdtService;
import com.hobbyfield.app.prdt.service.PrdtVO;

@Controller
@RequestMapping("/company/prdt")
public class PrdtController {
	
	
	@Autowired
	PrdtService prdtService;
	
	@GetMapping("prdtList")
	public String prdtList(Model model) {
		List<PrdtVO> prdtList = prdtService.prdtList();
		model.addAttribute("prdtList", prdtList);
		return "company/prdt/prdtList";
	}

	@RequestMapping("prdtInfo/{prdtId}")
	public String prdtReat(@PathVariable("prdtId") String prdtId, Model model) {
		
		PrdtVO prdtVO = prdtService.prdtInfo(prdtId);
		model.addAttribute("prdtInfo", prdtVO);
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("/company");
		sb.append("/prdt");
		sb.append("/prdtInfo");
		
		String path = sb.toString();
		
		return path;
	}
}
