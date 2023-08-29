package com.hobbyfield.app.prdtcart.web;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobbyfield.app.member.service.MemberService;
import com.hobbyfield.app.member.service.MemberVO;
import com.hobbyfield.app.prdtcart.service.CartListVO;
import com.hobbyfield.app.prdtcart.service.CartVO;
import com.hobbyfield.app.prdtcart.service.PrdtCartService;

@Controller
@RequestMapping("prdt/")
public class CartController {

	@Autowired
	PrdtCartService prdtCartService;
	
	@Autowired
	MemberService memberService;
	
	//장바구니 추가
	@ResponseBody
	@PostMapping("addCart")
	public int addCart(CartVO cartVO, HttpSession session) {
		
		int result = 0;
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member != null) {
			cartVO.setMemberEmail(member.getMemberEmail());
			prdtCartService.addCart(cartVO);
			result = 1;
		}
		return result;
	}
	
	//장바구니 목록
	@GetMapping("cartList")
	public void getCartList(HttpSession session, Model model) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String memberEmail = member.getMemberEmail();
		
		List<CartListVO> cartList = prdtCartService.cartList(memberEmail);
		
		model.addAttribute("cartList", cartList);
		
	}
	
	//주문후 장바구니정리
	@ResponseBody
	@PostMapping("deleteCart")
	public int deleteCart(HttpSession session, @RequestParam(value ="chbox[]") List<String> chArr, CartVO cartVO ) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String memberEmail = member.getMemberEmail();
		
		int result = 0;
		int cartId = 0;
		
		if(member != null) {
			cartVO.setMemberEmail(memberEmail);
			
			for(String i : chArr) {
				cartId = Integer.parseInt(i);
				cartVO.setCartId(cartId);
				prdtCartService.deleteCart(cartVO);
			}
			result = 1;
		}
		
		
		return result;
	}
	
	
	
	
}
