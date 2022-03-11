<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="<c:url value='/css/signUp.css'/>" rel="stylesheet">
	</head>
	<body>
	<div id = "wrap">
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>
		
		<!-- 삽입란 -->
		<div id="main" class="insertFrame">
			<div id="content">
				<form id="form" name="muscInsertForm" method="post"  action="<c:url value='/insertSchedule'/>">
				<h3 style="margin: 30px;text-align: center;">[일정 등록]</h3><hr><br>
				<table class="insertmuscTable" style="margin: 0 auto;">
<%--					<tr>--%>
<%--						<th>번호</th>--%>
<%--						<td>--%>
<%--							<input type="text" name="calNo" id="calNo" readonly>--%>
<%--						</td>--%>
<%--					</tr>--%>
					<tr>
						<th>일정 제목</th>
						<td>
							<input type="text" name="calTitle" id="calTitle" maxlength="100" placeholder="일정을 등록하세요.">
						</td>
					</tr>
					<tr>
						<th>일정 상세정보</th>
						<td>
							<input type="text" name="calDetail" id="calDetail" maxlength="30" placeholder="상세정보를 입력하세요">
						</td>
					</tr>
					<tr>
						<th>티켓팅 날짜</th>
						<td>
							<input type="datetime-local" name="calStart" id="calStart">
						</td>
					</tr>
					<tr>
						<th>티켓팅 링크</th>
						<td>
							<input type="text" name="calURL" id="calURL">
						</td>
					</tr>
				</table>
				
				<br><br>
				<div class="submitBox">
				<input type="submit" id="submitBox" value="INSERT" />
				</div>
				</form>
			</div>
		</div>
		
		
		<!-- BOTTOM -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>
	
	</div>
	</body>
</html>