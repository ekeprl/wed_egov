<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<title>JSTL</title>
</head>
<body>

<c:set var="step" value="${param.step}"/>
<c:if test="${empty step}">
	<c:set var="step" value="1"/>
</c:if>
<ul>
	<c:choose>
	<%-- c tag 설명 --%>
	<c:when test="${step eq '1'}">
		<li>
			<h3>c:out Tag : &#60;% = ... %&#62;과 유사한 표현식</h3>
			<h4>기본문법 : &#60;c:out value="값"/&#62;</h4>
			
			JSP 1번 : <% out.print("hello~"); %> <br/>
			JSP 2번 : <% String a = "hello~"; %> 
					 <%=a%> <br/>
			JSTL : <c:out value="hello~"/><br/>
			</li>
		</c:when>
		<c:when test="${step eq '2'}">
			<li>
				<h3>c:import Tag : jsp 'include'와 유사. 서버 내부 또는 서버 외부의 모든 자원컨텐츠를 포함하는 추가 기능이 있음</h3>
				<h4>기본문법 : &#60;c:import url="URL"주소 값 charEncoding="utf-8/&#62;</h4>
				
				<c:import url="/temp/jstlImport.do" charEncoding="utf-8"/>
			<%-- 	<c:import url="/temp/selectList.do" charEncoding="utf-8"/> --%>
			</li>
			</c:when>
			<c:when test="${step eq '3'}">
				<li>
					<h3>c:set Tag : 일반 변수를 생성하여 값을 할당</h3>
					<h4>기본문법 : &#60;c:set var="변수명" value="값"/&#62;</h4>
					
					<c:set var="str" value="지금은 c:set 연습중"/>
					<c:out value="${str}"/>
				</li>
				</c:when>
			<c:when test="${step eq '4' }">
				<li>
					<h3>c:if Tag : 조건문중의 하나, JAVA에서 사용하는 IF와 동일</h3>
					<h4>기본문법 : &#60;c:if test="조건문"&#62; &#60;/c:if&#62; </h4>
					
					<c:set var="test" value="0"/>
					<c:if test="${test eq '0' }">
					true
					</c:if>
				</li>
			</c:when>
			<c:when test="${step eq '5' }">
				<li>
					<h3>c:choose, c:when, c:otherwise Tag: 조건문중의 하나
					JAVA에서 사용하는 IF, else IF, else와 비슷함</h3>
					<h4>기본문법 : <br/>
						&#60;c:choose&#62;<br/>
						&#60;c:when test="조건문"&#62; 조건 true에 대한 내용&#60;/c:when&#62;<br/>
						&#60;c:otherwise&#62;조건에 해당되자 않아서 나오는 내용&#60;/c:otherwise&#62;<br/>
						&#60;/c:choose&#62;<h4/>
					
					<c:set var="test" value="0"/>
					<c:choose>
						<c:when test="${test eq '1'}">1입니다.</c:when>
						<c:otherwise>조건에 해당되자않음</c:otherwise>
						</c:choose>
						</li>
			</c:when>
			
			<c:when test="${step eq '6'}">
				<li>
				<h3>c:forEach Tag : 기본반복태그, 고정 된 횟수 또는 초과 수집동안 중첩된 본문 내용을 반복</h3>
				<h4>기본문법 : <br/>
				&#60;c:forEach var="변수명" items="반복문 변수"&#62;<br/>반복문내용<br/>&#60;/c:forEach&#62;</h4>
				
				<c:set var="str" value="1,2,3,4,5,6"/>
				<c:set var="strSplit" value="${fn:split(str,',')}"/>
				<c:forEach var="result" items="${strSplit}">
					<c:out value="${result}"/><br/>
					</c:forEach>
				</li>
			</c:when>
			<c:when test="${step eq '7'}">
			<li>
				<h3>c:param Tag : 포함한s import, url 태그의 URL에 매개변수를 추가</h3>
				<h4>기본문법 : &#60;c:param name="변수명" value="값:/&#62;</h4>
				
				<c:import url="/temp/jstlImport.do" charEncoding="utf-8">
					<c:param name="test" value="테스트호출"/>
				</c:import>
				</li>
			</c:when>
			<c:when test="${step eq '8'}">
				<li>
					<h3>c:url Tag : url 주소</h3>
					<h4>기본문법 : &#60;c:param name="변수명" value="값"/&#62;</h4>
					
					URL 1 : <c:url var="link1" value="https://www.naver.com"/>
					URL 2 : <c:url var="link2" value="/temp/jstlImport.do">
							<c:param name="test" value="테스트호출"/>
						</c:url>
						<br/>
					<a href="${link1}" target="_blank" title="새창열기">링크 1번</a><br/>
					<a href="${link2}" target="_blank">링크 2번</a>
					</li>
					</c:when>
			<%--function tag 설명  --%>
			<c:when test="${step eq '9' }">
				<li>
					<h3>fn:contains() : 주어진 문자열이 특정 문자열을 포함하고 있는지 확인하는데 사용</h3>
					<c:set var ="str" value="지금은 fn:contains 연습중"/>
					<c:if test="${fn:contains(str, '지금') }">
					true
					</c:if>
				</li>
			</c:when>
					
			<c:when test="${step eq '10' }">
				<li>
					<h3>fn:indexOf() : 주어진 문자열이 특정 문자열로 끝나는 지 확인하는데 사용</h3>
					<c:set var="string" value="It is first String."/>
					<p>Index : ${fn:indexOf(string, "first")}</p>
				</li>
			</c:when>
			
			<c:when test="${step eq '11'}">
				<li>
					<h3>fn:startsWith() : 주어진 문자열이 특정 문자열 값으로 시작되는지 확인하는 데 사용</h3>
					<c:set var="String" value="Welcome to JSP programming"/>
					<c:if test="${fn:startsWith(String, 'Welcome') }">
						<p>String starts with Welcome</p>
					</c:if>
					
					<c:if test="${fn:startsWith(String, 'programming') }">
						<p>String starts with programming</p>
					</c:if>
				</li>
			</c:when>
			
			<c:when test="${step eq '12'}">
				<li>
					<h3>fn:endsWith() : 주어진 문자열이 특정 문자열 값으로 끝나는 지 확인하는데 사용</h3>
					
					<c:set var="String" value="Welcome to JSP programming"/>
					<c:if test="${fn:endsWith(String, 'programming') }">
						<p>String ends with programming</p>
					</c:if>
					
					<c:if test="${fn:endsWith(String, 'JSP') }">
						<p>String ends with JSP</p>
					</c:if>
				</li>
			</c:when>		
			<%--  Split : 많이 사용된다 --%>
			<c:when test="${step eq '13'}">
				<li>
					<h3>fn:split() : 중진 문자열을 특정 문자로 구분해서 배열로 분할</h3>
					
					<c:set var="str" value="1,2,3,4,5,6"/>
					<c:set var="strSplit" value="${fn:split(str,',')}"/>
					<c:forEach var="result" items="${strSplit }">
						<c:out value="${result }"/><br/>
					</c:forEach>
				</li>
			</c:when>
			
			<c:when test="${step eq '14'}">
				<li>
					<h3>fn:length() : 문자열 내부의 문자 수 또는 컬렛견의 항목 수를 반환</h3>
					
					<c:set var="str1" value="This is first string"/>
					<c:set var="str" value="1,2,3,4,5,6"/>
					<c:set var="strSplit" value="${fn:split(str,',')}"/>
					Length of the String-1 is : <c:out value="${fn:length(str1) }"/><br/>
					Length of the String-2 is : <c:out value="${fn:length(strSplit) }"/><br/>
				</li>
			</c:when>
			
			<c:when test="${step eq '15'}">
				<li>
					<h3>fn:toLowerCase() : 문자열의 모든 문자를 소문자로 반환</h3>
					
					<c:set var="string" value="Welcome to JSP Programming"/>
					<c:out value="${fn:toLowerCase(string) }"/>
				</li>
			</c:when>
			
			<c:when test="${step eq '16'}">
				<li>
					<h3>fn:toUpperCase() : 문자열의 모든 문자를 대문자로 반환</h3>
					
					<c:set var="string" value="Welcome to JSP Programming"/>
					<c:out value="${fn:toUpperCase(string) }"/>
				</li>
			</c:when>
			
			<c:when test="${step eq '17'}">
				<li>
					<h3>fn:substring() : 주어진 시작 및 끝 위치에 따라 문자열의 하위 집합을 반환</h3>
					
					<c:set var="string" value="2022-01-01"/>
					<c:out value="${fn:substring(string, 0, 4) }"/>
					<c:out value="${fn:substring(string, 5, 7) }"/>
				</li>
			</c:when>
			
		   <c:when test="${step eq '18'}">
        		 <li>
               	    <h3> fn:replace() : 모든 문자열을 다른 문자열 시퀀스로 바꿈 </h3>
         
       		     <c:set var="string" value="2022-01-01"/>
       		     <c:out value="${fn:replace(string, '-', '.') }"/>
    		     </li>
   		   </c:when>
      
 	       <c:when test="${step eq '19'}">
 		        <li>
   			         <h3> fn:trim() : 문자열 양쪽 끝에서 공백을 제거 </h3>
            
   		        <c:set var="str1" value="Welcome to JSP                   Progaramming            "/>
    		        <p>String-1 Length is : ${fn:length(str1) }</p>
            
      	        <c:set var="str2" value=" ${fn:trim(str1)}"/>
    			  <p>String-2 Length is : ${fn:length(str2) }</p>
      		      <p>Final value of string is : ${str2} </p>
      		   </li>
   		   </c:when>
   		   
   		   <%--formatting tag 설명  --%>
   		   <c:when test="${step eq '20'}">
   		   		<li>
   		   			<h3>fmt:formatDate : 제공된 패턴 및 스타일을 사용하여 시간 및 날짜를 형식화한다</h3>
		   		<c:set var="Date" value="<%=new java.util.Date()%>" />
		   		${Date }<br/>
		   		<fmt:formatDate value="${Date}" pattern="yyyy-MM-dd"/>
	   			</li>
	   		</c:when>	
	</c:choose>
</ul>

</body>

</html>




<%-- 
<link href="/css/common.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
table{border-collapse: collapse;}
th{font-weight:bold;}
th, td{padding:5px;}
a{text-decoration:underline;}
</style>
</head>
<body>
게시물 총 수 : <c:out value="${paginationInfo.totalRecordCount}"/>건
<table>
	<thead>
		<tr>
			<th>TEMP_ID</th>
			<th>TEMP_VAL</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="result" items="${resultList }">
			<tr>
				<td><c:out value="${result.tempId}"/></td>
				<td>
					<c:url var="viewUrl" value="/temp/select.do">
						<c:param name="tempId" value="${result.tempId}"/>
					</c:url>
					<a href="${viewUrl}"><c:out value="${result.tempVal}"/></a>
				</td>
				<td>
					<c:url var="delUrl" value="/temp/delete.do">
						<c:param name="tempId" value="${result.tempId}"/>
					</c:url>
					<a href="${delUrl}" class="btn-del">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div id="paging_div">
	<ul class="paging_align">
		<c:url var="pageUrl" value="/temp/selectList.do?"/>
		<c:set var="pagingParam"><c:out value="${pageUrl}"/></c:set>
	   <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="${pagingParam}" />
	</ul>
</div>

<button type="button" id="btn-reg" data-href="/temp/tempRegist.do">등록하기</button>
<script>
$(document).ready(function(){
	$("#btn-reg").click(function(){
		location.href = $(this).data("href");
	});
	
	$(".btn-del").click(function(){
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}
	});
});
</script>
</body>
</html>

 --%>