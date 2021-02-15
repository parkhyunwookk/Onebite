<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="referrer" content="no-referrer-when-downgrade" />
<title>Insert title here</title>
<link href="../resources/css/nutrition.css" rel="stylesheet">
</head>
<body>
   <div class="header-section">
   
      <div class="wrap_top-logo">
         <a class="top-logo-text" >Sunday Chef</a>
      </div>
      
    
      
      <div class="wrap_user">
         <a class="top_user top_join">회원가입</a>
         <a class="top_user">Login</a>
      </div>
      
   </div>
      <div class="middle">
         <div class="site-main">
            <p class="tit_site">
            	<img src="../../resources/image/Logo.png" alt='로고사진' width="650px" height="230px" border-radius="7px">
            </p>
         </div>  
      </div>
      

   <div class="title">영양 및 알레르기 성분</div>
   
          <!-- 요리검색 --> 
  <div class='search_box'> 
  <label>
   <input type = 'text' placeholder="요리이름 검색" id = 'keyword'>
	<button id = 'btn_search'> 검색</button>
	</label>
   <div class='info_section'> 
   <div class="fiexd1">
      <select name = 'select_info' id = 'select_info'>
         <option value = "nutri_info" >영양 성분</option>
         <option value = 'allergy_info'>재료 및 알레르기 성분</option>
      </select>
   </div>
	  <!-- <div class="fiexd2">
	      <select>
	         <option>재료선택</option>
	         <option>재료선택</option>
	         <option>재료선택</option>
	         <option>재료선택</option>
	      </select>
	   </div>  -->
	</div>
</div>   
      
   <div class="content">
      <img alt="선택된 재료 사진 게시" src="/resources/img/veg.jpg" width="400px" height="400px">
      <div class = 'wrap'>
		      <div class = 'nutri_page'>영양 성분, 알레르기 성분 표시</div>
	      <div class='info_page'>
		      </div>
      </div>
   </div>
 


<div class="bottom">
   고객센터 1333-1333
   평일:00:00 ~ 00:00
   공휴일 휴무
</div>
<script type = 'text/javascript' src="/resources/js/nutrition.js"></script>
<script type = 'text/javascript' src="/resources/js/allergy.js"></script>
</body>
</html>