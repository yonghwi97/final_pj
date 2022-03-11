<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<meta charset="UTF-8">
	<link href="<c:url value='/css/login.css'/>" rel="stylesheet">
</head>

<body>
<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
<script src="<c:url value='/js/login.js'/>"></script>
<div id="main">
	<div id="content">
		<div class="loginSection">
			<form method="post" id = "loginForm">
				<div id="logintitle_text">
					<h3 class="logintitle">로그인</h3></div><br>
				<hr width="397px" size="2px" color="black" style="margin: 0 auto"><br>
				<input type="text" id="id" name="id" size="20" placeholder="아이디를 입력해주세요.">
				<input type="password" id="pw" name="pw" size="20" placeholder="비밀번호를 입력해주세요."><br/>


				<input type="submit" class="loginButton" value="로그인">
				<button type="button" class="SingupButton" onclick="location.href='/signupForm'">
					<span class="text_type">회원가입</span>
				</button>

			</form>
			<div id="naver_id_login" style="display:none;" ></div>
			<a href="#" class="naver-login" id="naverLogin"><img src="/images/btnG_완성형.png" id="naver_button"></a>

			<!-- //네이버아이디로로그인 버튼 노출 영역 -->
			<script type="text/javascript">
				var naver_id_login = new naver_id_login("nmuFIAlAX7Na0l6ahIGv", "http://localhost:8080/signupForm");
				var state = naver_id_login.getUniqState();
				naver_id_login.setButton("white", 2,40);
				naver_id_login.setDomain("http://localhost:8080");
				naver_id_login.setState(state);
				naver_id_login.init_naver_id_login();
			</script>

			<div class="button-login" align ="center" >
				<a id="kakao-login-btn" >
					<img src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="83%" height ="50px" />
				</a>
			</div>

		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
</body>

</html>
</html>