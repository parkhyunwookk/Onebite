<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>

<head>
	<link href="/resources/css/all.css" rel="stylesheet"/>
	<link href="/resources/css/reset.css" rel="stylesheet"/>
	<link href="/resources/css/link_page.css" rel="stylesheet"/>
</head>

<body>
    <header>
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
        
           <div class='sub_logo'>
               <ul>
                   <li></li>
                   <li id='small_logo'>구매사이트 링크</li>
               </ul>
           </div>
    </header>
    <section>
        <ul>
            <li><div class = 'link_img'><a href="steak"><img src="/resources/image/채끝스테이크.png"/></a></div></li>
            <li><div class = 'link_img'><a href=""><img src="/resources/image/떡볶이.png"/></a></div></li>
            <li><div class = 'link_img'><a href=""><img src="/resources/image/무슨나베인듯.png"/></a></div></li>
            <li><div class = 'link_img'><a href=""><img src="/resources/image/전복.png"/></a></div></li>
        </ul>
    </section>  


</body>
</html>