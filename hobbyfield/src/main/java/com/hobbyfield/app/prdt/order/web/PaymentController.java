package com.hobbyfield.app.prdt.order.web;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hobbyfield.app.prdt.order.service.OrderService;
import com.hobbyfield.app.prdt.order.service.Payment;

@RestController
@RequestMapping("api")
public class PaymentController {

 @Autowired
 OrderService orderService;
 

 @GetMapping("/getToken")
 public String getToken() throws IOException {
     String token = orderService.getToken();
     System.out.println("토큰: " + token);
     return token;
 }
 
 @PostMapping("/cancel")
 public void cancelPayment(@RequestBody Payment request) {
     try {
         String access_token =orderService.getToken(); //토큰값을 구해옴
         String imp_uid = request.getImpUid();
         String amount = request.getAmount();
         
         System.out.println("토큰: " + access_token);
         System.out.println("Imp UID: " + imp_uid);
         orderService.payMentCancle(access_token, imp_uid, amount);
     } catch (Exception e) {
         e.printStackTrace();
     }
 }
 
}
