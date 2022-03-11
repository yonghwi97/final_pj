<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 전용 - 정보 등록, 삭제 페이지</title>
		<link href="<c:url value='/css/signUp.css'/>" rel="stylesheet">
		<link href="<c:url value='/css/admin.css'/>" rel="stylesheet">
		<link href="<c:url value='/css/index.css'/>" rel="stylesheet">
	</head>
	<body>
	<div id = "wrap">
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>

		<div class="bannerTitle">
			<div class="bannerTitle_2">
				<span>Admin Page</span>
			</div>
		</div>

		<div class="adminCRUD">
			<details>
				<summary>뮤지컬</summary>
				<div class="tpt">
					<div class="adminInsertBtn">
						<button type="button" class="muscNoCheck" onclick="location.href ='/insertMusc'">등록</button>
					</div>
						<table>
						<tr>
							<th>번호</th>
							<th>뮤지컬 제목</th>
							<th>공연장소</th>
							<th>공연기간</th>
							<th>수정</th>
							<th>삭제</th>
							<th></th>
						</tr>
						<c:forEach items="${musicalList}" var="musc">
							<tr>
								<td>${musc.muscNo}</td>
								<td>${musc.muscName}</td>
								<td>${musc.muscPlace}</td>
								<td>${musc.muscStartDate} ~ ${musc.muscEndDate}</td>
								<td><button type="button" class="muscNoCheck" onclick="location.href ='/goUpdateMusc/${musc.muscNo}'">수정</button></td>
								<td><button type="button" class="muscNoCheck" onclick="location.href ='/doDeleteMusc/${musc.muscNo}'">삭제</button></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</details>
			<details>
				<summary>배우</summary>
				<div class="tpt">
					<div class="adminInsertBtn">
						<button type="button" class="muscNoCheck" onclick="location.href ='/goInsertActor'">등록</button>
					</div>

					<table>
						<tr>
							<th>번호</th>
							<th>배우 이름</th>
							<!-- <th>수정</th> -->
							<th>삭제</th>
							<th></th>
						</tr>
						<c:forEach items="${actorList}" var="act" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${act.actorName}</td>
								<!-- <td><button type="button" class="muscNoCheck" onclick="location.href ='/insertMusc'">수정</button></td> -->
								<td><button type="button" class="muscNoCheck" onclick="location.href ='/doDeleteActor/${act.actorNo}'">삭제</button></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</details>
			<details>
				<summary>캘린더</summary>
				<div class="tpt">
					<div class="adminInsertBtn">
						<button type="button" class="muscNoCheck" onclick="location.href ='/insertMusc'">등록</button>
					</div>
					<table>
						<tr>
							<th>번호</th>
							<th>뮤지컬 제목</th>
							<th>공연기간</th>
							<th>수정</th>
							<th>삭제</th>
							<th></th>
						</tr>
						<c:forEach items="${musicalList}" var="musc">
							<tr>
								<td>${musc.muscNo}</td>
								<td>${musc.muscName}</td>
								<td>${musc.muscStartDate} ~ ${musc.muscEndDate}</td>
								<td><button type="button" class="muscNoCheck" onclick="location.href ='/insertMusc'">수정</button></td>
								<td><button type="button" class="muscNoCheck" onclick="location.href ='/insertMusc'">삭제</button></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</details>
			<details>
				<summary>공연장</summary>
				<div class="tpt">
					<div class="adminInsertBtn">
						<button type="button" class="muscNoCheck" onclick="location.href ='/hall/insertform'">등록</button>
					</div>
					<table>
						<tr>
							<th>번호</th>
							<th>공연장 이름</th>
							<th>고객센터 번호</th>
							<th>수정</th>
							<th>삭제</th>
							<th></th>
						</tr>
						<c:forEach items="${seoulHallList}" var="hall">
							<tr>
								<td>${hall.no}</td>
								<td>${hall.name}</td>
								<td>${hall.cus}</td>
								<td><button type="button" class="muscNoCheck" onclick="location.href ='/hall/updateform/${hall.no}'">수정</button></td>
								<td><button type="button" class="muscNoCheck" onclick="location.href ='/hall/deleteform/${hall.no}'">삭제</button></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</details>
		</div>

		<!-- BOTTOM -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>
	
	</div>
	</body>
</html>