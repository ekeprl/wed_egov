<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>포토후기!</title>
<!-- BBS Style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet" />
<!-- 공통 Style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet" />
<!-- jQuery UI -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
</head>
<body>

<c:choose>
	<c:when test="${not empty searchVO.resveId}">
		<c:set var="actionUrl" value="/admin/rsv/rsvUpdate.do"/>
	</c:when>
	<c:otherwise>
		<c:set var="actionUrl" value="/admin/rsv/rsvInsert.do"/>
	</c:otherwise>
</c:choose>

<!-- 기본 URL -->
<c:url var="_BASE_PARAM" value="">
	<c:param name="searchCondition" value="${searchVO.searchCondition}" />
  	<c:if test="${not empty searchVO.searchKeyword}">
  		<c:param name="searchKeywork" value="${searchVO.searchKeyword}" />
  	</c:if>
</c:url>

<!-- content 시작 -->
<div id="content">
	<div class="container">
		<div id="contents">
			<form action="${actionUrl}" method="post" id="frm" name="frm" onsubmit="return regist()">
			<input type="hidden" name="resveId" value="${result.resveId}"/>
		
			<table class="chart2">
				<caption>예약정보작성</caption>
				<colgroup>
				<col style="width:150px" />
				<col />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">프로그램명</th>
						<td>
							<input type="text" id="resveSj" name="resveSj" title="제목입력" class="q3" value="<c:out value="${result.resveSj}"/>"/>
						</td>
					</tr>
					<tr>
						<th scope="row">프로그램 종류</th>
						<td>
							<select id="resveSeCode" name="resveSeCode">
								<option value="TYPE01">선착순</option>
								<option value="TYPE02" <c:if test="${result.resveSeCode eq 'TYPE02'}">selected="selected"</c:if>>승인관리</option>
								</select> 
						</td>
					</tr>
					<tr>
						<th scope="row">운영기간</th>
						<td>
							<input type="text" id="useBeginDt" class="datepicker" name="useBeginDt" title="운영시작일" value="<c:out value="${result.useBeginDt}"/>" readonly="readonly"/>
							~ <input type="text" id="useEndDt" class="datepicker" name="useEndDt" title="운영종료일" value="<c:out value="${result.useEndDt}"/>" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<th scope="row">운영시간</th>
						<td>
							<input type="text" id="useBeginTime" class="timepicker" name="useBeginTime" title="운영시작시간" value="<c:out value="${result.useBeginTime}"/>" readonly="readonly"/>
							~ <input type="text" id="useEndTime" class="timepicker" name="useEndTime" title="운영종료시간" value="<c:out value="${result.useEndTime}"/>" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<th scope="row">신청기간</th>
						<td>
							<input type="text" id="reqstBgnde" class="datepicker" name="reqstBgnde" title="신청시작일" value="<c:out value="${result.reqstBgnde}"/>" readonly="readonly"/>
							~ <input type="text" id="reqstEndde" class="datepicker" name="reqstEndde" title="신청종료일" value="<c:out value="${result.reqstEndde}"/>" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<th scope="row">강사명</th>
						<td>
							<input type="text" id="recNm" name="recNm" title="강사명" value="<c:out value="${result.recNm}"/>"/>
						</td>
					</tr>
					<tr>
						<th scope="row">신청인원수</th>
						<td>
							<input type="number" id="maxAplyCnt" name="maxAplyCnt" title="신청인원수" value="<c:out value="${result.maxAplyCnt}"/>"/>
						</td>
					</tr>	
					<tr>
						<th scope="row">내용</th>
						<td>
							<textarea id="resveCn" name="resveCn" rows="15" title="내용입력">
								<c:out value="${result.resveCn}"/>
							</textarea>
						</td>
					</tr>	
				</tbody>
			</table>
		<div class="btn-cont ar">
			<c:choose>
				<c:when test="${not empty searchVO.resveId}">
					<c:url var="uptUrl" value="/admin/rsv/rsvRegist.do${_BASE_PARAM}">
						<c:param name="resveId" value="${result.resveId}"/>
					</c:url>
					<a href="${uptUrl}" id="btn-reg" class="btn">수정</a>
				 	
				 	<c:url var="delUrl" value="/admin/rsv/rsvDelete.do${_BASE_PARAM}">
						<c:param name="resveId" value="${result.resveId}"/>
					</c:url>
					<a href="${delUrl}" id="btn-del" class="btn"><i class="ico-del"></i>삭제</a>
				</c:when>
				<c:otherwise>
					<a href="#none" id="btn-reg" class="btn spot">등록</a>
				</c:otherwise>
			</c:choose>
			<c:url var="listUrl" value="/admin/rsv/rsvSelectList.do${_BASE_PARAM}"/>
				<a href="${listUrl}" class="btn">취소</a>
		</div>
		</div>
	</div>
</div>	
<!-- content끝 -->

<script>
$(document).ready(function(){
	//datepicker
	$(".datepicker").datepicker({
		dateFormat: 'yy-mm-dd',
		prevText : '이전 달',
		nextText : '다음 달',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames:['일','월','화','수','목','금','토'],
		dayNamesShort:['일','월','화','수','목','금','토'],
		dayNamesMin:['일','월','화','수','목','금','토'],
		showMonthAfterYear : true,
		yearSuffix:'년'
	});

	$('.timepicker').timepicker({
		timeFormat:'HH:mm',
		interval: 60,
		minTime:'10',
		maxTime: '18:00',
		startTime: '10:00',
		dropdown:true,
		scrollbar:true
	});
	//예약정보 등록
	$("#btn-reg").click(function(){
		$("#frm").submit();
		return false;
	});
	//예약정보 삭제
	$("#btn-del").click(function(){
		if(!confirm("삭제하시겠습니까?")){
			return false;	
		}
	});
	
});
function regist(){
	if(!$("#resveSj").val()){
		alert("프로그램명을 입력해주세요.");ㅣ
		return false;
		}
}

</script>





<%-- <!-- content 시작 -->
<div id="content">
	<div class="container">
		<div id="contents">
			검색영역
			<div id="bbs_search">
				<form name="frm" method="post" action="/admin/rsv/rsvSelectList.do"			
					<fieldset>
						<legend>검색조건 입력폼</legend>
							<label for="ftext" class="hdn">검색분류선택</label>
							<select name="searchCondition" id="ftext">
								<option value="0" <c:if test="${searchVO.searchCondition eq '0'}">selected="selected"</c:if>>프로그램명</option>
									<option value="1" <c:if test="${searchVO.searchCondition eq '1'}">selected="selected"</c:if>>내용</option>
						</select>
						<label for="inp_text"> class="hdn">검색어입력</label>
						<input name="searchKeyword" value="<c:out value="${searchVO.searchKeyword}"/>" type="text" class="inp_s" id="inp_text"/>
						<span class="bbtn_s"><input type="submit" value="검색" title="검색(수업용 예약관리 게시물 내)" /></span>
						</filedset>
				</form>
			</div>
			
 				목록영역
				<div id="bbs_wrap">
					<div class="total">
					총 게시물
					<strong><c:out value="${paginationInfo.totalRecordCount}"/></strong>건 | 현재페이지 <strong><c:out value="${paginationInfo.currentPageNo}"/></strong>/
					<c:out value="${paginationInfo.totalPageCount}"/>
					</div>
				<div class="bss_list">
					<table class="list_table">
						<thead>
							<tr>
								<th class="num" scope="col">번호</th>
								<th class="tit" scope="col">프로그램명</th>
								<th scope="col">신청기간</th>
								<th scope="col">운영일</th>
								<th scope="col">운영시간</th>
								<th scope="col">강사명</th>
								<th scope="col">신청자</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
					<tbody>
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td class="num"><c:out value="${paginationInfo.totalRecordCount - ((searchVO.pageIndex-1) * searchVO.pageUnit) - (status.count -1)}"/></td>
								<td class="tit">
									<c:url var="updateUrl" value="/admin/rsv/rsvRegist.do${_BASE_PARAM}">
										<c:param name="resveId" value="${result.resveId}"/>
										<c:param name="pageIndex" value="${searchVO.pageIndex}"/>
									</c:url>
									<a href="${updateUrl}">
										<c:out value="${result.resveSj}"/>
									</a>
								</td>
								<td>
									<c:out value="${result.reqstBgnde}"/>~<br/>
									<c:out value="${result.reqstEndde}"/>
								</td>							
								<td>
									<c:out value="${result.reqstBeginDt}"/>~<br/>
									<c:out value="${result.reqstEndDt}"/>
								</td>
								<td>
									<c:out value="${result.reqstBeginDt}"/>~<br/>
									<c:out value="${result.reqstEndDt}"/>
								</td>
								<td><c:out value="${result.useBeginTime}~${result.useEndTime}"/></td>
								<td><c:out value="${result.recNm}"/></td>
								<td>
									<c:url var="applyUrl" value="/admin/rsv/selectApplyList.do${_BASE_PARAM}">
											<c:param name="resveId" value="${result.resveId}"/>
											<c:param name="pageIndex" value="${searchVO.pageIndex}"/>
									</c:url>
									<a href="${applyUrl}"class="btn spot">신청자</a>
								</td>
								<td>
									<a href="${updateUrl}"class="btn spot">수정</a>
									<br/><br/>
									<c:url var="deleteUrl" value="/admin/rsv/rsvDelete.do${_BASE_PARAM}">
											<c:param name="resveId" value="${result.resveId}"/>
											<c:param name="pageIndex" value="${searchVO.pageIndex}"/>
									</c:url>
									<a href="${deleteUrl}"class="btn spot btn-del">삭제</a>
								</td>
							</tr>
					</c:forEach>
					글이 없을경우
					<c:if test="${fn:length(resultList) == 0}">
						<tr class="empty"><td colspan="8">검색데이터가 없습니다.</td></tr>
					</c:if>
					</tbody>
					</table>
				</div>
				<div id="paging">
					<c:url var="pageUrl" value="/admin/rsv/rsvSelectList.do${_BASE_PARAM}"/>
					<c:set var="pagingParam"><c:out value="${pageUrl}"/></c:set>
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="${pagingParam}"/>
				</div>
			</div>
			<div class="btn-cont ar">
				<a href="/admin/rsv/rsvRegist.do" class="btn spot"><i class="ico-check-spot"></i>등록</a>
			</div>
		</div>
	</div>
</div>
<!--  //contents 끝 -->

<script>
	<c:if test="${not empty message}">
		alert("${message}");
	</c:if>






</script>
 --%>



</body>
</html>