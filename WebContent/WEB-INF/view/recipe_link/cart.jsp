<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>

<head>
	<link href="/resources/css/all.css" rel="stylesheet">
	<link href="/resources/css/reset.css" rel="stylesheet">
	<link href="/resources/css/cart.css" rel="stylesheet">
</head>
<body>
 <header class="header">
    	<div class="header-section">
		      <div class="wrap_top-logo">
		         <a class="top-logo-text" >Sunday Chef</a>
		      </div>
	      
		      <div class="wrap_user">
		        <c:choose>
		      		<c:when test="${empty sessionScope.userId}">
		      			<a class="top_user top_join">회원가입</a>
		         		<a href="/member/login" class="top_user">Login</a>
		      		</c:when>
		      		<c:otherwise>
		      			<div class="top_user top_join">${sessionScope.userId.userId}님</div>
		      			<a class="top_user">로그아웃</a>
		      		</c:otherwise>
      			</c:choose>
		      </div>
  		 </div>
  		 
  		<p class="tit_site">
            <img src="/resources/image/Logo.png">
        </p>
    </header>

    <section class="section">
	   <div class="cart">
	   		<span>장바구니</span>
	   </div>
		
	   <div class="cart_content">
	   		<table>
	   			<thead>
	   				<tr class="cart_all">
	   					<td><input type="checkbox" class='all'> 전체선택</td>
	   					<td><input class="button_clear" type="button" value="선택삭제"></td>
	   				</tr>
	   			</thead>
	   			<tbody class="item_list">
	   				<c:forEach var="cart" items="${cartList}">
		   				<tr class="item_tr">
		   					<td class="item_checkbox"><input type="checkbox" name="checkRow" class='item_recipe'></td>
		   					<td class="item_img"><img src="/resources/image/${cart.recipe.rcpTitle}.png"></td>
		   					<td class="item_name">${cart.recipe.rcpTitle}</td>
		   					<td><input id="item_count" type="number" value="${cart.itemCnt}" min="1" max="100"></td>
		   					<td class="item_price">${cart.recipe.rcpPrice}원</td>
		   					<td class="item_buttun"><input type="button" name="buttonRow" value="삭제"></td>
		   					<td></td>
		   				</tr>
	   				</c:forEach>
	   			</tbody>
	   		</table>
	   		
	   		<div class="sum_price">합계금액 : ${cart.recipe.rcpPrice}원</div>
	   		<button class="order">주문하기</button>
	   		<br><br><br><br><br><br>
	   		
	   	</div>
	   		
	   
	  
   </section>
   
	<script type="text/javascript" src="/resources/js/cart.js"></script>
</body>
</html>