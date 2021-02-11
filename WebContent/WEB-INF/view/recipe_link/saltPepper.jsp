<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>

<head>
	<link href="/resources/css/all.css" rel="stylesheet">
	<link href="/resources/css/reset.css" rel="stylesheet">
	<link href="/resources/css/information.css" rel="stylesheet">
</head>

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
    	<div class="content">
    		<div class="content-img">
    			<img src="/resources/image/소금후추.png">
    			<p class="content-titl-name">소금,후추 그라인더 4종</p>
    			<p class="content-titl-name">20,000원</p>
    			
    			<div class="content-semi-title">
    				<div class="list">
    					<dt class="list-title">판매단위</dt>
    					<dd class="list-dec">1팩</dd>
    				</div>
    				<div class="list">
    					<dt class="list-title">중량/용량</dt>
    					<dd class="list-dec">옵션별 상이</dd>
    				</div>
    				<div class="list">
    					<dt class="list-title">배송구분</dt>
    					<dd class="list-dec">샛별배송/택배배송</dd>
    				</div>
    				<div class="list">
    					<dt class="list-title">포장타입</dt>
    					<dd class="list-dec">냉장/종이포장</dd>
    				</div>
    			
    				<div class="list">
    					<dt class="list-title">안내사항</dt>
    					<dd class="list-dec">상단에 위치한 볼트를 이용하여 분쉐정도를 조정할 수 있습니다.</dd>
    				</div>
    				<div>
    					<dt class="list-title">구 매</dt>
    				</div>
    				<div class="price">
    					<dt class="price-title">상품금액 : </dt>
    					<dd class="price-dec">20,000원</dd>
    				</div>
    				
    				<button class="cart" onclick="cart()">장바구니 담기</button>
    				<br><br><br><br><br>
    			</div>
    		</div>
    		
    	</div>
    </section>
    
    <script type="text/javascript" src="/resources/js/saltPepper.js"></script>
</body>
</html>