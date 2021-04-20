<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style >
  .imageDiv {
    z-index: 1;
  }
  .card:hover .imageDiv {
    z-index: 0;
    opacity: 0.3;

  }
  
</style>
</head>
<%@ include file="include/head.jsp" %>
<body class="sb-nav-fixed">
<!-- 상단메뉴(로고 있는 라인) -->
<%@ include file="include/main_header.jsp" %>
<div id="layoutSidenav">
	<!-- 왼쪽메뉴 -->
	<%@ include file="include/left_column.jsp" %>
	<div id="layoutSidenav_content">
	<main>
	
	<!-- 페이지 내용넣는 곳 -->
	<div class="row mt-3 m-0" style="width: 100%;">
	
	<!--  1  -->
      <div class="col-6 col-md-2 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv w-100 h-100">
				<img src="../resources/img/kong.jpg" class="h-100 card-img-top poster-img" alt="고질라 VS. 콩">        
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute"  style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">고질라 VS. 콩</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">액션</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">113분</div>
            
          </div>     
        </div>
      </div>
      <div id="bookmark"></div>
      <!--  2  -->
      <div class="col-6 col-md-2 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
				<img src="../resources/img/Slayer.jpg" class="h-100 card-img-top poster-img" alt="귀멸의 칼날">        
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute"  style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">극장판 귀멸의 칼날: 무한열차편</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">애니메이션</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">117분</div>
            
          </div>     
        </div>
      </div>
      <div id="bookmark"></div>
      <!--  3  -->
      <div class="col-6 col-md-2 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
          	<img src="../resources/img/minari.jpg" class="h-100 card-img-top poster-img" alt="미나리">        
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute"  style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">미나리</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">드라마</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">115분</div>
            
          </div>     
        </div>
      </div>
      <div id="bookmark"></div>
      <!--  4  -->
      <div class="col-6 col-md-2 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
          	<img src="../resources/img/raya.jpg" class="h-100 card-img-top poster-img" alt="라야">        
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute" style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">라야와 마지막 드래곤</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">애미메이션, 액선, 모험</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">114분</div>
            
          </div>     
        </div>
      </div>
      <div id="bookmark"></div>
      <!--  5  -->
      <div class="col-6 col-md-2 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
            	<img src="../resources/img/hypnosis.jpg" class="h-100 card-img-top poster-img" alt="최면">        
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute"  style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">최면</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">공포, 스릴러</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">85분</div>
            
          </div>     
        </div>
      </div>
      <div id="bookmark"></div>
      <!--  6  -->
      <div class="col-6 col-md-2 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
            <img src="../resources/img/Soul.jpg" class="h-100 card-img-top poster-img" alt="소울">
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute" style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">소울</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">애니메이션</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">107분</div>
            
          </div>     
        </div>
      </div>
      <div id="bookmark"></div>
      <!--  7  -->
      <div class="col-6 col-md-2 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
               <img src="../resources/img/FIGHTER.jpg" class="h-100 card-img-top poster-img" alt="파이터">
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute" style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">파이터</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">드라마</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">104분</div>
            
          </div>     
        </div>
      </div>
      <div id="bookmark"></div>
      <!--  8  -->
      <div class="col-6 col-md-2 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
              <img src="../resources/img/spy.jpg" class="h-100 card-img-top poster-img" alt="스파이의 아내">
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute" style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">스파이의 아내</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">서스펜스, 멜로/로맨스</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">116분</div>
            
          </div>     
        </div>
      </div>
   
      <div id="bookmark"></div>
      <!--  9  -->
      <div class="col-6 col-md-2 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
              <img src="../resources/img/super.jpg" class="h-100 card-img-top poster-img" alt="인천스텔라">
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute" style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">인천스텔라</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">SF, 가족, 멜로/로맨스</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">108분</div>
            
          </div>     
        </div>
      </div>
          <div id="bookmark"></div>
      <!--  10  -->
      <div class="col-6 col-md-2 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
              <img src="../resources/img/Box.jpg" class="h-100 card-img-top poster-img" alt="더 박스">
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute" style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">더 박스</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">드라마</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">94분</div>
            
          </div>     
        </div>
      </div>
            <div id="bookmark"></div>
      <!--  11  -->
      <div class="col-6 col-md-2 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
              <img src="../resources/img/RE.jpg" class="h-100 card-img-top poster-img" alt="리스타트">
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute" style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">리스타트</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">액션</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">100분</div>
            
          </div>     
        </div>
      </div>
            <div id="bookmark"></div>
      <!--  12  -->
      <div class="col-6 col-md-2 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
              <img src="../resources/img/ISeeY.jpg" class="h-100 card-img-top poster-img" alt="아이 씨 유">
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute" style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">아이 씨 유</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">공포, 스릴러</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">97분</div>
            
          </div>     
        </div>
      </div>
      
      
      
    </div>
	<!-- 페이지 내용넣는 곳 끝-->
		
	</main>
	<%@ include file="include/main_footer.jsp" %>
	</div>
</div>
<!-- 부트스트랩 테마 플러그인 -->
<%@ include file="include/plugin_js.jsp" %>
</body>
</html>

