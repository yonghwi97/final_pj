<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
    <link href="<c:url value='/css/signUp.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/admin.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/index.css'/>" rel="stylesheet">
</head>
<body>
<div id="wrap">
    <!-- TOP -->
    <jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>

    <div class="bannerTitle">
        <div class="bannerTitle_2">
            <span>Admin Page - Calendar</span>
        </div>
    </div>

    <%-- Musical --%>
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Calendar</h4>
            <p class="card-description">
                <button type="button" class="muscNoCheck"
                        onclick="location.href ='/insertScheduleForm'">일정 등록
                </button>
            </p>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>티켓팅 날짜</th>
                        <th>수정</th>
                        <th>삭제</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${planList}" var="plan">
                        <tr>
                            <td>${plan.calNo}</td>
                            <td>${plan.calTitle}</td>
                            <td>${plan.calStart}</td>
                            <td>
                                <button type="button" class="muscNoCheck"
                                        onclick="location.href ='/updateScheduleForm/${plan.calNo}'">수정
                                </button>
                            </td>
                            <td>
                                <button type="button" class="muscNoCheck"
                                        onclick="location.href ='/doDeleteMusc/${musc.muscNo}'">삭제
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- BOTTOM -->
    <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>

</div>
</body>
</html>