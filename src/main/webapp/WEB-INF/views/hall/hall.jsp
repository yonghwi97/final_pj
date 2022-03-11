<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="<c:url value='/css/hall.css'/>" rel="stylesheet" type="text/css">
    <title>공연장 안내</title>
</head>

<body>
<div id="wrap">
    <!-- 탑 -->
    <jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>

    <!-- 공연장안내 -->
    <div class="bannerTitle" style="margin-top: 60px; margin-bottom: 100px;">
        <div class="bannerTitle_2">
            <span>Theather</span>
        </div>
    </div>


    <div id="지역">서울</div>
    <div class="list-border">
        <table border="1" class="list">

            <c:forEach items="${seoulHallList}" varStatus="status" var="hall">
                <c:if test="${status.index % 5 == 0 }"><tr></c:if>
                <th>
                    <a href="<c:url value='/hall/detailView/${hall.no}'/>">
                        <img src="./images/${hall.name }.JPG">
                    </a>
                </th>
                <c:if test="${status.index % 5 == 4 }"></tr></c:if>
            </c:forEach>

        </table>
    </div>

    <div id="지역">경기</div>
    <div class="list-border">
        <table border="1" class="list">

            <c:forEach items="${ggHallList}" varStatus="status" var="hall">
                <c:if test="${status.index % 5 == 0 }"><tr></c:if>
                <th>
                    <a href="<c:url value='/hall/detailView/${hall.no}'/>">
                        <img src="./images/${hall.name }.JPG">
                    </a>
                </th>
                <c:if test="${status.index % 5 == 4 }"></tr></c:if>
            </c:forEach>

        </table>
    </div>

    <div id="지역">그 외 지역들</div>
    <div class="list-border">
        <table border="1" class="list">

            <c:forEach items="${etcHallList}" varStatus="status" var="hall">
                <c:if test="${status.index % 5 == 0 }"><tr></c:if>
                <th>
                    <a href="<c:url value='/hall/detailView/${hall.no}'/>">
                        <img src="./images/${hall.name }.JPG">
                    </a>
                </th>
                <c:if test="${status.index % 5 == 4 }"></tr></c:if>
            </c:forEach>

        </table>
    </div>
</div>


<!-- 바텀 -->
<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>

</div>
</body>
</html>
