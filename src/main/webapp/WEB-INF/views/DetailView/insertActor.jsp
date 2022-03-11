<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 전용 - 배우 정보 삽입 페이지</title>
		<link href="<c:url value='/css/signUp.css'/>" rel="stylesheet">
	</head>
	<body>
	<div id = "wrap"><!-- sdfsdf -->
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>
		
		<script src="<c:url value='/js/insertActor.js'/>"></script>
		
		<!-- 삽입란 -->
		<div id="main" class="insertFrame">
			<div id="content">
				<form id="form" name="muscInsertForm" method="post" action="<c:url value='/doInsertActor'/>">
				<h3 style="margin: 30px;text-align: center;">[배우] 등록할 정보 목록</h3><hr><br>
				<table class="insertmuscTable" style="margin: 0 auto;">
					<tr>
						<th>배우 번호</th>
						<td>
							<input type="number" name="actorNo" id="actorNo" maxlength="5" placeholder="지정할 배우번호를 입력하세요.">
							<button type="button" id="duplicateActorCheck" class="actorNoCheck" >중복확인</button>
						</td>
					</tr>
					<tr>
						<th>배우 이름</th>
						<td>
							<input type="text" name="actorName" id="actorName" maxlength="100" placeholder="등록할 배우이름을 입력하세요.">
						</td>
					</tr>
					<tr>
						<th>배우 프로필 링크</th>
						<td>
							<input type="text" name="actorProfile" id="actorProfile" maxlength="300" placeholder="ex) https://search.naver.com">
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