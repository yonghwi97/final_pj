<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 전용 - 뮤지컬 정보 수정 페이지</title>
		<link href="<c:url value='/css/signUp.css'/>" rel="stylesheet">
	</head>
	<body>
	<div id = "wrap">
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>
		
		<!-- 삽입란 -->
		<div id="main" class="insertFrame">
			<div id="content">
				<form id="form" name="muscInsertForm" method="post"  action="<c:url value='/doUpdateMusc/${muscData.muscNo}'/>">
				<h3 style="margin: 30px;text-align: center;">[뮤지컬] 등록할 정보 목록</h3><hr><br>
				<!-- <b>뮤지컬번호, 뮤지컬 이름,해시태그, 뮤지컬 장소이름,장소링크, 뮤지컬 시작일, 종료일, 명대사, 상영시간, 시놉시스, 장르번호, 포스터 파일주소, 공지사항 사진1.2.3, 유튜브 링크</b> -->
				<table class="insertmuscTable" style="margin: 0 auto;">
					<tr>
						<th>뮤지컬 번호</th>
						<td>
							<input type="text" name="muscNo" id="" maxlength="5" required="required" value="${muscData.muscNo}"> 
							<!-- <button type="button" class="muscNoCheck" onclick="overlapCheck()">중복확인</button> -->
						</td>
					</tr>
					<tr>
						<th>뮤지컬 이름</th>
						<td>
							<input type="text" name="muscName" id="" maxlength="100" required="required" value="${muscData.muscName}">
						</td>
					</tr>
					<tr>
						<th>뮤지컬 해시태그</th>
						<td>
							<input type="text" name="muscHashtag" id="" maxlength="30" required="required" value="${muscData.muscHashtag}">
						</td>
					</tr>
					<tr>
						<th>공연장 이름</th>
						<td>
							<input type="text" name="muscPlace" id="" maxlength="20" required="required" value="${muscData.muscPlace}">
						</td>
					</tr>
					<tr>
						<th>공연장 지도 링크</th>
						<td>
							<input type="text" name="muscPlaceLink" id="" maxlength="300" required="required" value="${muscData.muscPlaceLink}">
						</td>
					</tr>
					<tr>
						<th>공연 시작일</th>
						<td>
							<input type="text" name="muscStartDate" id="" maxlength="10" required="required" value="${muscData.muscStartDate}">
						</td>
					</tr>
					<tr>
						<th>공연 종료일</th>
						<td>
							<input type="text" name="muscEndDate" id="" maxlength="10" required="required" value="${muscData.muscEndDate}">
						</td>
					</tr>
					<tr>
						<th>뮤지컬 명대사</th>
						<td>
							<input type="text" name="muscQuote" id="" maxlength="30" required="required" value="${muscData.muscQuote}">
						</td>
					</tr>
					<tr>
						<th>총 상영시간</th>
						<td>
							<input type="text" name="muscReqTime" id="" required="required" value="${muscData.muscReqTime}">
						</td>
					</tr>
					<tr>
						<th>뮤지컬 시놉시스</th>
						<td>
							<input type="text" name="muscSynop" id="" maxlength="300" required="required" value="${muscData.muscSynop}">
						</td>
					</tr>
					<tr>
						<th>뮤지컬 장르 번호</th>
						<td>
							<div id="checkboxBox">									
								<input type="checkbox" name="muscGenre" id="original" value="1">
									<label for="original">오리지널/내한공연</label>
								<input type="checkbox" name="muscGenre" id="license" value="2">
									<label for="license">라이센스</label><br>									
								<input type="checkbox" name="muscGenre" id="creation" value="3">
									<label for="creation">창작뮤지컬</label>
								<input type="checkbox" name="muscGenre" id="family" value="4">
									<label for="family">아동/가족</label>
							</div>
						</td>
					</tr>
					<tr>
						<th>뮤지컬 포스터 파일 주소</th>
						<td>
							<input type="text" name="muscImg" id="" maxlength="50" required="required" value="${muscData.muscImg}">
							<!-- <button type="button" class="muscNoCheck" onclick="">파일 업로드</button> -->
						</td>
					</tr>
					<tr>
						<th>공지사항 파일 주소 1</th>
						<td>
							<input type="text" name="muscInfo_1" id="" maxlength="50" required="required" value="${muscData.muscInfo_1}">
							<!-- <button type="button" class="muscNoCheck" onclick="">파일 업로드</button> -->
						</td>
					</tr>
					<tr>
						<th>공지사항 파일 주소 2</th>
						<td>
							<input type="text" name="muscInfo_2" id="" maxlength="50" required="required" value="${muscData.muscInfo_2}">
						</td>
					</tr>
					<tr>
						<th>공지사항 파일 주소 3</th>
						<td>
							<input type="text" name="muscInfo_3" id="" maxlength="50" required="required" value="${muscData.muscInfo_3}">
						</td>
					</tr>
					<tr>
						<th>뮤지컬 공식 유튜브 주소</th>
						<td>
							<input type="text" name="muscYoutube" id="" maxlength="100" required="required" value="${muscData.muscYoutube}">
						</td>
					</tr>
					<tr>
						<th>공연 지역 </th>
						<td>
							<input type="text" name="location" id="" maxlength="10" required="required" value="${muscData.location}">
						</td>
					</tr>
				</table>
				
				<br><br>
				<div class="submitBox">
				<input type="submit" id="submitBox" value="UPDATE" />
				</div>
				</form>
			</div>
		</div>
		
		
		<!-- BOTTOM -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>
	
	</div>
	</body>
</html>