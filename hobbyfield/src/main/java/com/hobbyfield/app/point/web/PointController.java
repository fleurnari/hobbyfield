package com.hobbyfield.app.point.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hobbyfield.app.point.service.PointService;
import com.hobbyfield.app.point.service.PointVO;

@Controller
public class PointController {

	@Autowired
	PointService pointService;

	// 전체조회
	@GetMapping("/pointList")
	public String getPointAllList(Model model) {
		model.addAttribute("pointList", pointService.getPointAllList());
		return "point/pointList";
	}

	// 단건조회
	@GetMapping("/pointInfo")
	public String getPointInfo(PointVO pointVO, Model model) {
		PointVO findVO = pointService.getPointInfo(pointVO);
		pointService.updatePointView(findVO);
		model.addAttribute("point", findVO);
		return "point/pointInfo";
	}

	// 등록 - Form
	@GetMapping("/pointInsert")
	public String pointInsertForm() {
		return "point/pointInsert";
	}

	// 등록 - Process
	@PostMapping("/pointInsert")
	public String pointInsertProcess(PointVO pointVO) {
		System.out.println(pointVO);
		//이모티콘 첨부파일
		
		pointService.insertPoint(pointVO);
		return "redirect:pointList";
	}

	// 수정 - Form
	@GetMapping("/pointUpdate")
	public String pointUpdateForm(PointVO pointVO, Model model) {
		PointVO findVO = pointService.getPointInfo(pointVO);
		model.addAttribute("point", findVO);
		return "point/pointUpdate";
	}

	// 수정 - Process
	@PostMapping("/pointUpdate")
	public String pointUpdateProcess(PointVO pointVO) {

		int pointId = pointService.updatePoint(pointVO);

		return "redirect:pointList";
	}

	// 삭제
	@GetMapping("/pointDelete")
	public String pointDelete(@RequestParam(name = "pointId") int pointId) {
		pointService.deletePoint(pointId);
		return "redirect:/pointList";
	}

}
