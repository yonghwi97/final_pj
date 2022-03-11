<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link href="<c:url value='/css/signUp.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="<c:url value='/js/signUp.js'/>"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
<div class="signUpTitle">
	<h2 class = "signUpText">회원가입</h2>
</div>

<div id="main">
	<div id="content">
		<div id="necessaryTxt_box">
			<span class="necessary">*</span> 필수입력사항
		</div>
		<hr width="670px" size="3px" color="gray" style="margin: 0 auto"><br>

		<form id="form" name="memberForm" method="post" onsubmit="return signUpForm_check();" action="/signUp">


			<table class="memberTable">
				<tbody>
				<tr class=first>
					<th>
						아이디
						<span class="necessary">
									*
								</span>
					</th>
					<td>
						<input type="text" name="memId" id="memberID" maxlength="20" placeholder="아이디는 6자 이상 입력해주세요.">
						<button type="button" class="IDdouble_check" onclick="doubleCheck()">중복확인</button>
					</td>
				</tr>

				<tr>
					<th>
						비밀번호
						<span class="necessary">
									*
								</span>
					</th>
					<td>
						<input type="password" name="memPw" id="memberPW" maxlength="20" placeholder="비밀번호를 입력해주세요.">
					</td>
				</tr>

				<tr>
					<th>
						비밀번호 확인
						<span class="necessary">
									*
								</span>
					</th>
					<td>
						<input type="password" name="memberPW_check" id="memberPW_check" maxlength="20" placeholder="비밀번호를 한 번 더 입력해주세요.">
					</td>
				</tr>

				<tr>
					<th>
						성명
						<span class="necessary">
									*
								</span>
					</th>
					<td>
						<input type="text" name="memName" id="memberName" maxlength="20" placeholder="성명을 입력해주세요.">
					</td>
				</tr>

				<tr>
					<th>
						이메일
						<span class="necessary">
									*
								</span>
					</th>
					<td>
						<input type="text" name="memEmail" id="memberEmail" maxlength="25" placeholder="이메일을 입력해주세요.">
					</td>
				</tr>

				<tr>
					<th>
						휴대폰
						<span class="necessary">
									*
								</span>
					</th>
					<td>
						<input type="text" name="memPhone" id="memberPhone" maxlength="25" placeholder="휴대폰 번호를 입력해주세요.">
					</td>
				</tr>

				<tr>
					<th>
						주소
						<span class="necessary">
									*
								</span>
					</th>
					<td>
						<input type="text" id="memAddress" name="memAddress" placeholder="주소를 입력해주세요." readonly>
					</td>
				</tr>

				<tr>
					<th>
						상세주소
						<span class="necessary">
									*
								</span>
					</th>
					<td>
						<input type="text" name="memAddressDetail" id="memberAddressDetail" placeholder="상세 주소를 입력해주세요.">

					</td>
				</tr>


				<tr>
					<th>
						좋아하는 장르
					</th>
					<td>
						<div id="checkboxBox">
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox" role="switch" name="genre" id="original" value="1">
								<label class="form-check-label" for="original">오리지널/내한공연</label><br>
								<input class="form-check-input" type="checkbox" role="switch" name="genre" id="license" value="2">
								<label class="form-check-label" for="flexSwitchCheckChecked">라이센스</label><br>
								<input class="form-check-input" type="checkbox" role="switch" name="genre" id="creation" value="3">
								<label class="form-check-label" for="flexSwitchCheckChecked">창작뮤지컬</label><br>
								<input class="form-check-input" type="checkbox" role="switch" name="genre" id="family" value="4">
								<label class="form-check-label" for="flexSwitchCheckChecked">아동/가족</label>
							</div>
						</div>
					</td>
				</tr>
				</tbody>
			</table>
			<br>
			<div class="submitBox">
				<input type="submit" id="submitBox" value=" 회원가입" />
				<br><br>
			</div>
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
</body>
</html>