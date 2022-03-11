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
            <span>Admin Page - Member</span>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Member</h4>
           <%-- <p class="card-description">
                <a href="/adminMember">[ Update Member ]</a>
            </p>--%>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>회원 아이디</th>
                        <th>회원 이름</th>
                        <th>연락처</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${musicalList}" var="musc" begin="0" end="4">
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
    <!-- BOTTOM -->
    <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>

</div>
</body>
</html>