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
 public ResponseEntity<String> cancelPayment(@RequestBody Payment cancelRequest) {
     try {
         String access_token = orderService.getToken();
         String imp_uid = cancelRequest.getImp_uid();

         orderService.payMentCancle(access_token, imp_uid);

         // 결제 취소 성공 시 클라이언트에 응답
         return ResponseEntity.ok("Payment canceled successfully");
     } catch (Exception e) {
         // 결제 취소 실패 시 클라이언트에 응답
         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Payment cancel failed: " + e.getMessage());
     }
 }
}
