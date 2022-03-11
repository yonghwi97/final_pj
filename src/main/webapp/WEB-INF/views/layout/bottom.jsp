<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="<c:url value='/js/chatbot.js'/>"></script>	
<link rel="stylesheet" type="text/css" href="<c:url value='/css/chatbot.css'/>">
</head>
		<!-- 챗봇 섹션 display none -->
		<a id="openPop"><img id="chatBtn" src="<c:url value="/images/chatBtn.png" />" width="75" height="75"></a>
		<div id= "modal"> 
		</div>
		<div id="popUp">
			<div id="chatHeader">
				<button id="btnClose"> &lt; </button>
			</div>
		
		<!-- 채팅 내용 출력 -->
			
			<!-- 응답 메시지 출력  -->
			<div id="chatBox"></div>
			<!-- 질문 메시지 입력 폼 -->
			<form id="chatForm">
				<input type="text" id="message" name="message" size="30" placeholder="질문을 입력하세요">	
				<input type="submit" id="submit" value="전송하기">		
			</form>
		</div>
		
<!-- footerBox -->
<footer class="footerBox">
    <div class="footerMenuWrap">
        <div class="footerInner">
            <div class="footerMutroduce">
                <div class="footerInfoTitle">
                    <span>MUTRODUCE</span>
                </div>
                <address>서울특별시 강남구 삼성로 512</address>
                <div class="footerContact">
                    <span>DEV</span>
                    <span>정현지, 김용휘, 유승희, 손지원, 박재훈</span>
                </div>
            </div>
            <div class="footerMutroduce">
                <div class="footerInfoTitle">
                    <span>고객센터</span>
                </div>
                <span>서울 금천구 벚꽃로 278 SJ테크노빌 빌딩 15층 인터파크 고객센터</span>
                <div class="footerContact">
                    <span>고객센터</span>
                    <span>02-1111-1111</span>
                </div>
            </div>
            <div class="footerMutroduce">
                <div class="footerInfoTitle">
                    <span>전자금융거래 분쟁처리 담당</span>
                </div>
                <div class="footerContact">
                    <span>쇼핑 1588-1555 도서 1577-2555</span>
                    <span>티켓 1544-1555 팩스 02-6924-9001</span>
                </div>
            </div>
        </div>
    </div>
</footer>

</body>
</html>
