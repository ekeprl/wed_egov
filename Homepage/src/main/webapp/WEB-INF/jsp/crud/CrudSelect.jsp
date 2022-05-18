<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8" >
<title>Insert title</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>    <!-- j쿼리를 로컬에 다운받지 않아도 url로 들고와서 쓴다는 뜻. -->
</head>

${result.tempVal}


<body>
<div class="box-btn">
	<c:url var="uptUrl" value="/temp2/tempRegist.do">
		<c:param name="tempId" value="${result.tempId}"/>
	</c:url>
	<a href="${uptUrl}">수정</a>
	
	<c:url var="delUrl" value="/temp2/delete.do">
		<c:param name="tempId" value="${result.tempId}"/>
	</c:url>
	<a href="${delUrl}" class="btn-del">삭제</a>
	
	<a href="/temp2/selectList.do">목록</a>

</div>

<%-- <table>
	<tr>
		<th>제목</th>
		<td><c:out value=:${result.crudId}/></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><c:out value=:${result.usernm}/></td>
	</tr>
	<tr>
		<th>작성일</th>
		<td><c:out value=:${result.frstRegistPnttm} pattern="yyyy-MM-dd"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><c:out value=:${result.crudId}/></td>
	</tr>
</table> --%>

<script>
$(document).ready(function(){
	$(".btn-del").click(function(){
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}
	});
});


</script>
</body>