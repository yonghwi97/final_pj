<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>MUTRODUCE</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<%--    <link href="<c:url value='/fullcalendar-5.10.1/lib/main.css' />" rel="stylesheet" />--%>
    <link href="<c:url value='/css/menu.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/common.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/index.css'/>" rel="stylesheet" type="text/css">
<%--    <link href="<c:url value='/css/calendar.css'/>" rel="stylesheet" type="text/css">--%>
<%--    <script src="<c:url value='/fullcalendar-5.10.1/lib/main.js' />"></script>--%>
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
    <script src="<c:url value='/js/calendar.js'/>"></script>
    <script src="<c:url value='/js/menu.js' />"></script>
    <script src="<c:url value='/js/board.js'/>"></script>
    <script src="<c:url value='/js/boardmenu.js'/>"></script>
</head>
<body>

<!-- 전체 컨텐츠 -->
<div id="wrap">
    <!-- login/join -->
    <div id="headerMenuBox">
        <div class="header_logo"><a href="/"><img src="<c:url value='/images/header_logo.png' />"></a></div>
        <div class="headerMenu">
            <ul id="dropMain">
                <%--로그인 처리 전에 보여줄 부분--%>

                    <li><a href="<c:url value='/about' />">About</a> </li>
                    <li><a href="<c:url value='/musicalAllgenre' />">Musical</a></li>
                    <li><a href="<c:url value='/vote' />">Ranking</a> </li>
                    <li>
                        <a href="<c:url value='/board' />">Community ▾</a>
                        <ul id="dropSub">
                            <li><a href="<c:url value="/board3" />">배우 게시판</a></li>
                            <li><a href="<c:url value="/board4" />">뮤지컬 게시판</a></li>
                            <li><a href="<c:url value="/boardinformation" />">포도알 이야기</a></li>
                            <li><a href="<c:url value="/board" />">공연 요청</a></li>
                        </ul>
                    </li>
                    <li><a href="<c:url value='/hall' />">Theater</a> </li>
                <c:if test="${empty sessionScope.sid}">
                    <li><a href="<c:url value='/loginForm' />">Sign In</a> </li>
                </c:if>
                <%--로그인 처리 후에 보여줄 부분--%>
                <c:if test="${not empty sessionScope.sid}">
                    <li><a href="<c:url value='/logout' />">Sign Out</a> </li>
                    <li><a href="<c:url value='/ticketbook/${sid.memId}'/>">My Page</a> </li>
                    <li><a href="<c:url value='/adminPage'/>">Admin</a> </li>
                </c:if>
            </ul>
        </div>
    </div>
</body>
</html>
