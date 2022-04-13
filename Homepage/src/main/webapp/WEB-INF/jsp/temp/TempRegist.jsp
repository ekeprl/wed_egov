<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<title>데이터 가져오기~</title>
</head>
<body>

<c:choose>
	<c:when test="${not empty searchVO.tempId}">
		<c:set var="actionUrl" value="/temp/update.do"/>
	</c:when>
	<c:otherwise>
		<c:set var="actionUrl" value="/temp/insert.do"/>
	</c:otherwise>
</c:choose>

* 등록폼
<form action="${actionUrl}" <%-- "/temp/insert.do" --%> method="post" name="tempVO">
	<input type="hidden" name="tempId" value="${result.tempId}"/>
	<label for="tempVal">값 정보 : </label> 
	<input type="text" id="tempVal" name="tempVal" value="${result.tempVal}"/> <!-- 해당값이 없다면 null, 있다면 작성한 그 값 -->
	<br/>
	<c:choose>
	<c:when test="${not empty searchVO.tempId}">
	<button type="submit">수정</button>
	</c:when>
	<c:otherwise>
	<button type="submit">등록</button>
	</c:otherwise>
	</c:choose>
</form>
</body>
</html>

