package com.hobbyfield.app.prdt.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hobbyfield.app.common.PageMaker;
import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.csboard.service1.CSBoardVO;
import com.hobbyfield.app.prdt.service.PrdtService;
import com.hobbyfield.app.prdt.service.PrdtVO;


@Controller
@RequestMapping("prdt/")
public class PrdtController {
	
	
	@Autowired
	PrdtService prdtService;
	
	//상품목록조회
	@GetMapping("prdtList")
	public String prdtList(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		model.addAttribute("prdtList", prdtService.selectAllPrdt(scri));
		PageMaker pageMaker = new PageMaker(); pageMaker.setCri(scri);
		pageMaker.setTotalCount(prdtService.prdtCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		return "prdt/prdtList";
	}
	
	
	//상품상세보기
	@GetMapping("prdtInfo")
	public String prdtInfo(PrdtVO prdtVO, Model model) {
		model.addAttribute("prdtInfo", prdtService.selectPrdt(prdtVO.getPrdtId()));
		return "prdt/prdtInfo";
	}
	
	//상품등록폼
	@GetMapping("prdtInsert")
	public String insertPrdtForm() {
		return "prdt/prdtInsert";
	}
	//상품등록
	@PostMapping("prdtInsert")
	public String InsertPrdtProcess(PrdtVO prdtVO) {
		prdtService.insertPrdt(prdtVO);
		return "redirect:prdtList";
	}
	
	//상품수정폼
	@GetMapping("prdtUpdate")
	public String prdtUpdateForm(PrdtVO prdtVO, Model model) {
		model.addAttribute("prdtInfo", prdtService.selectPrdt(prdtVO.getPrdtId()));
		return "prdt/prdtUpdate";
	}
	
	//상품수정하기
	@PostMapping("prdtUpdate")
	public String prdtUpdate(PrdtVO prdtVO) {
		prdtService.updatePrdt(prdtVO);
		return "redirect:prdtList";
	}
	
	//등록상품삭제
	@PostMapping("prdtDelete")
	public String prdtDelete(PrdtVO prdtVO) {
		prdtService.deletePrdt(prdtVO.getPrdtId());
		return "redirect:prdtList";
	}
}
