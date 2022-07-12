<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 기본 URL --%>
<c:url var="_BASE_PARAM" value="">
	<c:param name="menuNo" value="50"/>
  	<c:if test="${not empty searchVO.searchCondition}"><c:param name="searchCondition" value="${searchVO.searchCondition}" /></c:if>
  	<c:if test="${not empty searchVO.searchKeyword}"><c:param name="searchKeyword" value="${searchVO.searchKeyword}" /></c:if>
</c:url>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>수업용 게시판</title>
<!-- BBS Style -->
<link href="/asset/review.css" rel="stylesheet" />
<!-- 공통 Style -->
<link href="/asset/review.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

 <header id="header">
        <section class="hdsection">
          <h1>'OKDDA'</h1>
          <nav class="gnb">
              <ul><link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
                  <li><a href="#">홈페이지</a></li>
                  <li><a href="#">테마</a></li>
                  <li><a href="#">이벤트</a></li>
                  <li><a href="#">후기</a></li>
                  <li><a href="#">로그인</a></li>
              </ul>
          </nav>
      </section>
            <div class="box1">
                <h1>이벤트 더보기</h1>
            </div>
      </header>
      
        


      <section class="event-list">
        <nav class="remote">
            <ul>
                <li><a href="#">홈페이지</a></li><br>
                <li><a href="#">테마</a></li><br>
                <li><a href="#">이벤트</a></li><br>
                <li><a href="#">후기</a></li>
            </ul>
        </nav>
        
            <div class="el">
                <ul class="event">
                    <li>
                        <b>옥상 캠핑!!</b>
                        <span>2022 07 10</span>
                        <img src="/asset/front/images/후기.jpg" alt="" width="750px" height="302px">

                    </li>
                    <li>
                        <b>옥상 나들이~</b>
                        <span>2022 07 05</span>
                        <img src="/asset/front/images/후기1.jpg" alt="" width="750px" height="302px">

                    </li>
                    <li>
                        <b>반려견과 캠핑~~</b>
                        <span>2022 07 01</span>
                        <img src="/asset/front/images/mid.JPG" alt="" width="750px" height="302px">

                    </li>
                    <li>
                        <b>친구랑 시원하게 술한잔~</b>
                        <span>2022 06 30</span>
                        <img src="/asset/front/images/rupeutab.jpg" alt="" width="750px" height="302px">

                    </li>
                    <li>
                        <b>옥상 데이트 좋아요!</b>
                        <span>2022 06 20</span>
                        <img src="/asset/front/images/drama.jpg" alt="" width="750px" height="302px">

                    </li>
                    <li>
                        <b>옥상 </b>
                        <span>2022 06 18</span>
                        <img src="/asset/front/images/solo.jpg" alt="" width="750px" height="302px">

                    </li>


                </ul>
            </div>
        

        
      </section>
      <section class="api">
        <div class="api-text">
            <h2>더 많은 혜택은 어플에서 만나보세요!</h2>
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
                          
    </footer>
<script>
<c:if test="${not empty message}">
	alert("${message}");
</c:if>
</script>
			
	
</body>
</html>
