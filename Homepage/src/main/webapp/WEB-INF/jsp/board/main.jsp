<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKDDA</title>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="/asset/front/css/style.css?log" rel="stylesheet">
<link href="/asset/style.css?after" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<header id="header"><link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
      <section class="hdsection">
        <a href="/board/main.do"><h1>'OKDDA'</h1></a>
        <nav class="gnb">
            <ul>
                <li><a href="/board/main.do">홈페이지</a></li>
                <li><a href="#">테마</a></li>
                <li><a href="#">이벤트</a></li>
                <li><a href="/board/selectList.do">후기</a></li>
                <li>
                    <c:choose>
           			 <c:when test="${empty USER_INFO.id}">
              				 <a href="/login/actionLogin.do" class="login">로그인</a>
            	     </c:when>
            			<c:otherwise>
            			   <a href="/login/actionLogout.do"><c:out value="${USER_INFO.name}"/>님 로그아웃</a>
           				</c:otherwise>
            		</c:choose>
                </li>
            </ul>
        </nav>
    </section>
    </header>
    <section class="slider">
        <div class="sl-txt">
            <h2>이런거 어때?</h2>
            <p>옥상으로 올라와!</p>
        </div>
    </section>

    <section class="content">
        <h2>'옥따'만의 리얼 후기</h2>
        <div class="item-wrap">
            <div class="item1">
                <a href="/board/selectList.do"><img src="/asset/front/images/후기.jpg" width="550px" height="350px" alt=""></a>
                <p>옥상캠핑이라니!!</p><br/>
                <h3>이렇게 멋진곳에서 캠핑이라니!! 너무너무 즐거웠습니다 강추강추!</h3>
            </div>
            <div class="item">
                <a href="/board/selectList.do"><img src="/asset/front/images/후기1.jpg" width="550px" height="350px" alt=""></a>
                <p>옥상 파티</p><br/>
                <h3>옥상에서의 파티는 처음인데 생각보다 훨씬 더 좋은 곳이네요!</h3>
            </div>
        </div>
    </section>

    <section class="econtent">
        <h2>이벤트</h2>
        <div class="event-wrap">
           
         </div>
        
    </section>

    <section class="api">
        <div class="api-text">
            <h2>더 많은 혜택은 어플에서 만나보세요!</h2>
            <a href="https://play.google.com/store/apps"><div style="position: relative; top: 60px ;left :420px; width:165px; height:50px"><img src="/asset/front/images/google.png" alt="googlestore"></div></a>
            <a href="https://itunes.apple.com/kr/genre/ios/id36"><div style="position: relative; top: 8px ;left :620px; width:165px; height:50px"><img src="/asset/front/images/apple.jpg" alt="apple app store"></div></a>
            
        </div>        
    </section>
	 <footer>        
        <div class="align">
            <ul class="link">
                <li><a href="#" target="_blank">회사소개</a><span>|</span></li>
                <li><a href="#" data-default="term">이용약관</a><span>|</span></li>
                <li><a href="#" data-default="privacy">개인정보처리방침</a><span>|</span></li>
                <li><a href="#">콘텐츠산업진흥법에의한 표시</a></li>
            </ul>
            <p><b>고객행복센터 1600-0000</b><span>오전 9시 - 새벽 3시</span></p>
            <address>
                <span>(주)옥따</span>
                [34503] 대전광역시 동구 우암로 352-21 | 대표이사 : XXX | 사업자등록번호: 000-00-00000<br/>
                <span class="order">(주)옥따는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.</span><br/>
                Copyright GC COMPANY Corp. All rights reserved.
            </address>
        </div>                  
    </footer>

<div class="dim"></div>
<!-- 로그인 -->
<div class="layer-popup layer-login" style="display:none;">
   <header class="layer-header">
      <span class="logo">
         <span class="img-logo">한국폴리텍대학 대전캠퍼스 스마트소프트웨어학과</span>
      </span>
      <button type="button" class="layer-close"><span>팝업 닫기</span></button>   
   </header>
   <div class="layer-body">
      <form action="/login/actionLogin.do" id="frmLogin" name="frmLogin" method="post" onsubmit="return vali()">
         <input type="hidden" name="userSe" value="USR"/>
         <fieldset>
            <legend>로그인을 위한 아이디/비밀번호 입력</legend>
            <div class="ipt-row">
               <input type="text" id="loginId" name="id" placeholder="아이디" required="required">
            </div>
            <div class="ipt-row">
               <input type="password" id="loginPw" name="password" placeholder="비밀번호" required="required">
            </div>
            <button type="submit" class="btn-login"><span>로그인</span></button>            
         </fieldset>      
      </form>   
   </div>
</div>
    

<script>
$(document).ready(function(){
   //로그인
   $(".login").click(function(){
      $(".dim, .layer-login").fadeIn();
      return false;      
   });
   
   //레이어닫기
   $(".layer-close").click(function(){
      $(".dim, .layer-login").fadeOut();
      return false;      
   });
   
});
   
function vali(){
   if(!$("#loginId").val()){
      alert("아이디를 입력해주세요.");
      $("#loginId").focus();
      return false;
   }
   
   if(!$("#loginPw").val()){
      alert("비밀번호를 입력해주세요.");
      $("#loginPw").focus();
      return false;
   }   
}   
   
<c:if test="${not empty loginMessage}">
   alert("${loginMessage}");
</c:if>

</script>
</body>
</html>