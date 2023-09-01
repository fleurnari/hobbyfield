package com.hobbyfield.app.prdt.order.web;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobbyfield.app.member.service.MemberService;
import com.hobbyfield.app.member.service.MemberVO;
import com.hobbyfield.app.prdt.order.mapper.OrderMapper;
import com.hobbyfield.app.prdt.order.service.OrderService;
import com.hobbyfield.app.prdt.order.service.OrderVO;
import com.siot.IamportRestClient.IamportClient;

@RequestMapping("prdt/")
@Controller
public class OrderController {
	
	
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	MemberService memberService;
	
	//주문하기
	@PostMapping("orderInfo")
	@ResponseBody
	public String saveOrder(OrderVO orderVO, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String memberEmail = member.getMemberEmail();
		
		//주문번호 생성
	    Calendar cal = Calendar.getInstance();
	    int year = cal.get(Calendar.YEAR);
	    String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	    String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
	    String subNum = "";

	    for (int i = 1; i <= 6; i++) {
	        subNum += (int) (Math.random() * 10);
	    }

	    String orderId = ymd + "_" + subNum;

	    orderVO.setOrderId(orderId);
	    orderVO.setMemberEmail(memberEmail);

	    orderService.insertOrderInfo(orderVO);

	    return "success";
	}
	
	  @GetMapping("/orderList")
	  public String getOrderList(Model model, HttpSession session) {
		  	
			MemberVO member = (MemberVO)session.getAttribute("member");
			String memberEmail = member.getMemberEmail();
		  
	        List<OrderVO> orderList = orderService.orderList(memberEmail);
	        model.addAttribute("orderList", orderList);
	        return "prdt/orderList"; 
	    }
}
