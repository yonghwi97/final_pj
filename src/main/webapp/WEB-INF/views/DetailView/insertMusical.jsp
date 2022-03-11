<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 전용 - 뮤지컬 정보 삽입 페이지</title>
		<link href="<c:url value='/css/signUp.css'/>" rel="stylesheet">
	</head>
	<body>
	<div id = "wrap">
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>
		
		<script src="<c:url value='/js/insertMusc.js'/>"></script>
		
		<!-- 삽입란 -->
		<div id="main" class="insertFrame">
			<div id="content">
				<form id="form" name="muscInsertForm" method="post"  action="<c:url value='/doInsertMusc'/>">
				<h3 style="margin: 30px;text-align: center;">[뮤지컬] 등록할 정보 목록</h3><hr><br>
				<!-- <b>뮤지컬번호, 뮤지컬 이름,해시태그, 뮤지컬 장소이름,장소링크, 뮤지컬 시작일, 종료일, 명대사, 상영시간, 시놉시스, 장르번호, 포스터 파일주소, 공지사항 사진1.2.3, 유튜브 링크</b> -->
				<table class="insertmuscTable" style="margin: 0 auto;">
					<tr>
						<th>뮤지컬 번호</th>
						<td>
							<input type="number" name="muscNo" id="muscNo" maxlength="5" placeholder="지정할 뮤지컬번호를 입력하세요.">
							<button id="duplicateCheck" type="button" class="muscNoCheck">중복확인</button>
						</td>
					</tr>
					<tr>
						<th>뮤지컬 이름</th>
						<td>
							<input type="text" name="muscName" id="muscName" maxlength="100" placeholder="등록한 뮤지컬 이름을 모두 입력하세요.">
						</td>
					</tr>
					<tr>
						<th>뮤지컬 해시태그</th>
						<td>
							<input type="text" name="muscHashtag" id="muscHashtag" maxlength="30" placeholder="#뮤지컬 #해시태그 형식으로 등록하세요.">
						</td>
					</tr>
					<tr>
						<th>공연장 이름</th>
						<td>
							<input type="text" name="muscPlace" id="muscPlace" maxlength="20" placeholder="등록한 뮤지컬의 공연장 이름을 입력하세요.">
						</td>
					</tr>
					<tr>
						<th>공연장 지도 링크</th>
						<td>
							<input type="text" name="muscPlaceLink" id="muscPlaceLink" maxlength="300" required="required" placeholder="공연장의 네이버 주소링크를 입력하세요.">
						</td>
					</tr>
					<tr>
						<th>공연 시작일</th>
						<td>
							<input type="date" name="muscStartDate" id="muscStartDate" maxlength="10" placeholder="YYYY-MM-DD">
						</td>
					</tr>
					<tr>
						<th>공연 종료일</th>
						<td>
							<input type="date" name="muscEndDate" id="muscEndDate" maxlength="10" placeholder="YYYY-MM-DD">
						</td>
					</tr>
					<tr>
						<th>뮤지컬 명대사</th>
						<td>
							<input type="text" name="muscQuote" id="muscQuote" maxlength="30" required="required" placeholder="등록할 뮤지컬의 명대사 또는 한마디">
						</td>
					</tr>
					<tr>
						<th>총 상영시간</th>
						<td>
							<input type="number" name="muscReqTime" id="muscReqTime" required="required" placeholder="숫자만 입력해주세요.ex:170분 - > 170">
						</td>
					</tr>
					<tr>
						<th>뮤지컬 시놉시스</th>
						<td>
							<input type="text" name="muscSynop" id="muscSynop" maxlength="300" required="required" placeholder="">
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
							<input type="text" name="muscImg" id="muscImg" maxlength="50" required="required" placeholder="ex)/폴더명/파일이름.jpg">
							<!-- <button type="button" class="muscNoCheck" onclick="">파일 업로드</button> -->
						</td>
					</tr>
					<tr>
						<th>공지사항 파일 주소 1</th>
						<td>
							<input type="text" name="muscInfo_1" id="muscInfo_1" maxlength="50" required="required" placeholder="ex)/폴더명/파일이름.jpg">
							<!-- <button type="button" class="muscNoCheck" onclick="">파일 업로드</button> -->
						</td>
					</tr>
					<tr>
						<th>공지사항 파일 주소 2</th>
						<td>
							<input type="text" name="muscInfo_2" id="muscInfo_2" maxlength="50" required="required" placeholder="ex)/폴더명/파일이름.jpg">
						</td>
					</tr>
					<tr>
						<th>공지사항 파일 주소 3</th>
						<td>
							<input type="text" name="muscInfo_3" id="muscInfo_3" maxlength="50" required="required" placeholder="ex)/폴더명/파일이름.jpg">
						</td>
					</tr>
					<tr>
						<th>뮤지컬 공식 유튜브 주소</th>
						<td>
							<input type="text" name="muscYoutube" id="muscYoutube" maxlength="100" required="required" placeholder="ex)https://www.youtube.com">
						</td>
					</tr>
					<tr>
						<th>공연 지역 </th>
						<td>
							<input type="text" name="location" id="location" required="required" maxlength="10" placeholder="ex)서울">
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