<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>

<link href="../resources/css/cart.css" rel="stylesheet">
<body>
 <header class="header">
      <h1>썬데이 셰프</h1>
      
      <ul class="header_nav">
         <li>로그인</li>
         <li>회원가입</li>
         <li>공지사항</li>
         <li>마이페이지</li>
      </ul>
   </header>

   <div>
      <div class="menu_l">shop</div>
      <div class="menu_l">event</div>
      <div class="menu_l">review</div>
      <div class="menu_l">brand</div>
      <div class="menu_r">
         <input type="text" placeholder="search">
         <button>검색</button>
      </div>
   </div>

   <div class="cart">장바구니</div>

   <div class="cart_content">장바구니가 비어있습니다.</div>

   <div class="footer">
      <div class="footer_menu">주문/배송 조회</div>
      <div class="footer_menu">쿠폰</div>
      <div class="footer_menu">Q&A</div>
      <div class="footer_menu">FAQ</div>
   </div>

</body>
</html>