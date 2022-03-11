<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div id="wrap">
    <!-- TOP -->
    <jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>

    <div class="bannerTitle">
        <div class="bannerTitle_2">
            <span>Admin Page</span>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Member</h4>
            <p class="card-description">
                <a href="/adminMember">[ Update Member ]</a>
            </p>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>뮤지컬 제목</th>
                        <th>공연 장소</th>
                        <th>공연 기간</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${musicalList}" var="musc" begin="0" end="2">
                        <tr>
                            <td>${musc.muscNo}</td>
                            <td>${musc.muscName}</td>
                            <td>${musc.muscPlace}</td>
                            <td>${musc.muscStartDate} ~ ${musc.muscEndDate}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <%-- Musical --%>
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Musical</h4>
            <p class="card-description">
                <a href="/adminMusical">[ Update Musical ]</a>
            </p>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>뮤지컬 제목</th>
                        <th>공연 장소</th>
                        <th>공연 기간</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${musicalList}" var="musc" begin="0" end="2">
                        <tr>
                            <td>${musc.muscNo}</td>
                            <td>${musc.muscName}</td>
                            <td>${musc.muscPlace}</td>
                            <td>${musc.muscStartDate} ~ ${musc.muscEndDate}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <%-- Actor --%>
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Actor</h4>
            <p class="card-description">
                <a href="/adminActor">[ Update Actor ]</a>
            </p>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>배우 이름</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${actorList}" var="act" begin="0" end="2" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${act.actorName}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <%-- Calendar --%>
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Calendar</h4>
            <p class="card-description">
                <a href="/adminCalendar">[ Update Ticketing Plan ]</a>
            </p>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>일정</th>
                        <th>상세 내용</th>
                        <th>티켓팅 날짜</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${planList}" var="plan" begin="0" end="2">
                        <tr>
                            <td>${plan.calNo}</td>
                            <td>${plan.calTitle}</td>
                            <td>${plan.calDetail}</td>
                            <td>${plan.calStart}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <%-- Theater --%>

    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Theater</h4>
            <p class="card-description">
                <a href="#">[ Update Theater ]</a>
            </p>
            <div class="table-responsive">
                <table class="table">
                    <tr>
                        <th>번호</th>
                        <th>공연장 이름</th>
                        <th>공연장 위치</th>
                        <th>고객센터 번호</th>
                        <th></th>
                    </tr>
                    <c:forEach items="${seoulHallList}" var="hall" begin="0" end="2">
                        <tr>
                            <td>${hall.no}</td>
                            <td>${hall.name}</td>
                            <td>${hall.location}</td>
                            <td>${hall.cus}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>

    <!-- BOTTOM -->
    <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>

</div>
</body>
</html>