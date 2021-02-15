<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>

<head></head>
	<link href="/resources/css/all.css" rel="stylesheet">
	<link href="/resources/css/reset.css" rel="stylesheet">
	<link href="/resources/css/recipeList.css" rel="stylesheet"> <!-- 레시피전용 css -->
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
		      			<a href="/member/logout" class="top_user">로그아웃</a>
		      		</c:otherwise>
      			  </c:choose>
		      </div>
  		 </div>
  		 
  		<p class="tit_site">
  			<img src="/resources/image/Logo.png">
            
        </p>
	</header>
	
	<section class="section">
		<div class="main_titl">채끝 스테이크</div>
		
		<div class="logo-steak">
			<img src="/resources/image/채끝스테이크Logo.png">
		</div>
		
		<div class="content"> 
			<span id="recipe-content1">재료</span>
			<span>채끝 스테이크 트러블 소금 히말리야 핑크 소금.통후추 약간씩</span>
			
			<span id="recipe-content2">RECIPE</span>
			<span>1. 센 불에서 뜨겁게 달군 팬에 채끝 스테이크를 올려 앞뒤로 1분 30초씩 뒤집어 가며 굽는다.</span>
			<span>2. 체에 올려 앞뒤로 1분 이상 레스팅한다.</span>
			<span>3. 트러블 소금, 히말라야 핑크 소금, 으깬 통후추를 스테이크에 곁들인다.</span>
			<span>Tip. 스테이크의 익힘 정도를 고려해 편 썰기와 포뜨기를 번갈아 가며 자르면, 한 덩어리에서 미디움 레어,
				미디움, 미디움 웰던을 동시에 맛 볼 수 있다.</span>
		</div>
		
		
		<ul class="recipe-item">
			<li><a href="koreanBeaf"><img src="/resources/image/한우가격표.png"></a></li>
			<li><a href="saltPepper"><img src="/resources/image/소금후추가격표.png"></a></li>
		</ul>
		
	</section>
	
	
</body>
</html>