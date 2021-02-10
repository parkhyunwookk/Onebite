<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>

<head>
	<link href="/resources/css/all.css" rel="stylesheet">
	<link href="/resources/css/reset.css" rel="stylesheet">
	<link href="/resources/css/koreanBeaf.css" rel="stylesheet">
</head>

</head>
<body>
	<header class="header">
    	<div class="header-section">
		      <div class="wrap_top-logo">
		         <a class="top-logo-text" >Sunday Chef</a>
		      </div>
	      
		      <div class="wrap_user">
		         <a class="top_user top_join">회원가입</a>
		         <a class="top_user">Login</a>
		      </div>
  		 </div>
  		 
  		<p class="tit_site">
            <img src="/resources/image/Logo.png">
        </p>
    </header>
    
    <section class="section">
    	<div class="content">
    		<div class="content-img">
    			<img src="/resources/image/한우.png">
    			<p class="content-titl-name">1++ 한우 채끝 스테이크 250g(냉장)</p>
    			<p class="content-titl-name">55,000원</p>
    			
    			<div class="content-semi-title">
    				<div class="list">
    					<dt class="list-title">판매단위</dt>
    					<dd class="list-dec">1팩</dd>
    				</div>
    				<div class="list">
    					<dt class="list-title">중량/용량</dt>
    					<dd class="list-dec">250g</dd>
    				</div>
    				<div class="list">
    					<dt class="list-title">배송구분</dt>
    					<dd class="list-dec">샛별배송/택배배송</dd>
    				</div>
    				<div class="list">
    					<dt class="list-title">원산지</dt>
    					<dd class="list-dec">국내산(한우)</dd>
    				</div>
    				<div class="list">
    					<dt class="list-title">포장타입</dt>
    					<dd class="list-dec">냉장/종이포장</dd>
    				</div>
    				<div class="list">
    					<dt class="list-title">유통기한</dt>
    					<dd class="list-dec">포장일로부터 최소 7일 이내 제품을 보내 드립니다.</dd>
    				</div>
    				<div class="list">
    					<dt class="list-title">안내사항</dt>
    					<dd class="list-dec">해당 식품은 냉장 제품이므로, 상품 수령 후 최대한 빠른 시일내에 섭취를 권장드립니다.</dd>
    				</div>
    				<div>
    					<dt class="list-title">구 매</dt>
    				</div>
    				<div class="price">
    					<dt class="price-title">상품금액 : </dt>
    					<dd class="price-dec">55,000원</dd>
    				</div>
    				
    				<button class="cart" onclick="cart()">장바구니 담기</button>
    				<br><br><br><br><br>
    			</div>
    		</div>
    		
    	</div>
    </section>
    
    <script type="text/javascript" src="/resources/js/steak.js"></script>
</body>
</html>