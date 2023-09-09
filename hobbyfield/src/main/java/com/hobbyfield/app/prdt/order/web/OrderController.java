package com.hobbyfield.app.prdt.order.web;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.hobbyfield.app.member.service.MemberService;
import com.hobbyfield.app.member.service.MemberVO;
import com.hobbyfield.app.prdt.order.mapper.OrderMapper;
import com.hobbyfield.app.prdt.order.service.OrderService;
import com.hobbyfield.app.prdt.order.service.OrderVO;
import com.hobbyfield.app.prdt.order.service.Payment;
import com.siot.IamportRestClient.IamportClient;

@RequestMapping("prdt/")
@Controller
public class OrderController {
	
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	MemberService memberService;
	
	//주문하기(장바구니 전체)
	@PostMapping("/orderInfo")
	@ResponseBody
	public String saveOrder(@RequestBody OrderVO orderVO, HttpSession session) {
		
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

	    String orderId = ymd + subNum;

	    orderVO.setOrderId(orderId);
	    orderVO.setMemberEmail(memberEmail);

	    orderService.insertOrderInfo(orderVO);

	    return "success";
	    
	    
	}
		
	  //주문목록(사용자)
	  @GetMapping("/orderList")
	  public String getOrderList(Model model, HttpSession session) {
		  	
			MemberVO member = (MemberVO)session.getAttribute("member");
			String memberEmail = member.getMemberEmail();
		  
	        List<OrderVO> orderList = orderService.orderList(memberEmail);
	        model.addAttribute("orderList", orderList);
	        return "prdt/orderList"; 
	    }
	  
	  
	  //주문목록(관리자)
	  @GetMapping("/adminOrderList")
	  public String adminOrderList(Model model, HttpSession session) {
		  	
			MemberVO member = (MemberVO)session.getAttribute("member");
			String memberEmail = member.getMemberEmail();
		  
	        List<OrderVO> adminOrderList = orderService.orderList(memberEmail);
	        model.addAttribute("adminOrderList", adminOrderList);
	        return "prdt/adminOrderList"; 
	    }
	  
	  
	  
	  // 주문 상태 변경 처리(관리자)
	  @PostMapping("/updateDelivery")
	  @ResponseBody
	  public Map<String, Object> updateDelivery(@RequestBody Map<String, Object> paramMap) {
	      Map<String, Object> response = new HashMap<>();
	      
	      try {
	          List<String> orderIds = (List<String>) paramMap.get("orderIds");
	          String delivery = (String) paramMap.get("delivery");
	          
	          // 서비스 메서드를 호출하여 배송 상태 변경 처리
	          orderService.updateDelivery(orderIds, delivery);
	          
	          response.put("success", true);
	      } catch (Exception e) {
	          response.put("success", false);
	      }
	      
	      return response;
	  }
	  
	  //주문취소
	  @PostMapping("/cancelOrder")
	  @ResponseBody
	  public String cancelOrder(@RequestParam("orderId") String orderId) {
		  try {
	            orderService.cancelOrder(orderId);
	            return "success";
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "error";
	        }
	    }
	  
	 //배송상태확인
	  @PostMapping("/getDelivery")
	  @ResponseBody
	  public Map<String, String> getDeliveryStatus(@RequestParam("orderId") String orderId) {
	      Map<String, String> response = new HashMap<>();
	      try {
	          String deliveryStatus = orderService.getDelivery(orderId);
	          response.put("delivery", deliveryStatus);
	      } catch (Exception e) {
	          e.printStackTrace();
	          response.put("delivery", "error");
	      }
	      return response;
	  }
	  
	  //아임포트 결제취소
	  
	 
	  
}
