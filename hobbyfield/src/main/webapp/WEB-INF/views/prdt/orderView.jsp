<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
/*
 section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }
*/
 .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:200px; height:200px; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
</style>
</head>
<body>

<br>
<br>
<br>
<br>
<br>
<br>
<section id="content">
  <div class="orderInfo">
    <c:forEach items="${orderView}" var="orderView" varStatus="status">
      <c:if test="${status.first}">
        <p><span>수령인</span>${orderView.orderRec}</p>
        <p><span>주소</span>(${orderView.memberZip}) ${orderView.memberBaseaddr}${orderView.memberDetaaddr}</p>
        <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
        <p><span>상태</span>${orderList.delivery}</p>
      </c:if>
    </c:forEach>
  </div>
  <ul class="orderView">
    <c:forEach items="${orderView}" var="orderView">
      <li>
        <div class="thumb">
          <img src="${orderView.prdtThum}" />
        </div>
        <div class="prdtInfo">
          <p>
            <span>상품명</span>${orderView.prdtName}<br />
            <span>개당 가격</span>
            <fmt:formatNumber pattern="###,###,###" value="${orderView.prdtPrice}" />
            원<br />
            <span>구입 수량</span>${orderView.cartStock} 개<br />
            <span>최종 가격</span>
            <fmt:formatNumber pattern="###,###,###" value="${orderView.prdtPrice * orderView.cartStock}" />원
          </p>
        </div>
      </li>
    </c:forEach>
  </ul>
</section>

<script>
</script>
</body>
</html>