package com.hobbyfield.app.point.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		pointService.pointViewCount(findVO);
		model.addAttribute("point", findVO);
		return "point/pointList";
	}

	// 등록 - Form
	@GetMapping("/pointInsert")
	public String pointInsertForm() {
		return "point/pointInsert";
	}

	// 등록 - Process
	@PostMapping("/pointInsert")
	public String pointInsertProcess(PointVO pointVO) {
		pointService.insertPoint(pointVO);
		 return "redirect:pointList";
	}

	// 수정 - Form
	@GetMapping("/pointUpdate")
	public String pointUpdateForm(PointVO pointVO, Model model) {
		PointVO findVO = pointService.getPointInfo(pointVO);
		model.addAttribute("pointInfo", findVO);
		return "point/pointUpdate";
	}

	// 수정 - Process
	@PostMapping("/pointUpdate")
	@ResponseBody
	public String pointUpdateProcess(PointVO pointVO) {
		boolean result = false;

		int pointId = pointService.updatePoint(pointVO);
		if (pointId > -1) {
			result = true;
		}
		Map<String, Object> map = new HashMap<>();
		map.put("result", result);
		map.put("pointInfo", pointVO);

		return "redirect:/pointInfo";
	}

	// 삭제
	@PostMapping("/pointDelete")
	public String deletePointInfo(@RequestParam(name = "pointId") int pointId) {
		pointService.deletePoint(pointId);
		return "redirect:pointList";
	}


}
