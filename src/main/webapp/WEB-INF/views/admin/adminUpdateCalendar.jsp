<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 전용 - 뮤지컬 정보 삽입 페이지</title>
    <link href="<c:url value='/css/signUp.css'/>" rel="stylesheet">
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
</head>
<body>
<div id = "wrap">
    <!-- TOP -->
    <jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>

    <!-- 삽입란 -->
    <div id="main" class="insertFrame">
        <div id="content">
            <form id="form" name="muscInsertForm" method="post"  action="<c:url value='/updateSchedule'/>">
                <h3 style="margin: 30px;text-align: center;">[일정등록]</h3><hr><br>
                <table class="insertmuscTable" style="margin: 0 auto;">
                    <tr>
                        <th>번호</th>
                        <td>
                            <input type="text" name="calNo" id="calNo" value="${calen.calNo}" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th>일정 제목</th>
                        <td>
                            <input type="text" name="calTitle" id="calTitle" value="${calen.calTitle}" maxlength="100" placeholder="일정을 등록하세요.">
                        </td>
                    </tr>
                    <tr>
                        <th>일정 상세정보</th>
                        <td>
                            <input type="text" name="calDetail" id="calDetail" value="${calen.calDetail}" placeholder="상세정보를 등록하세요">
                        </td>
                    </tr>
                    <tr>
                        <th>티켓팅 날짜</th>
                        <td>
                            <input type="text" name="calStart" id="calStart" value="${calen.calStart}">
                        </td>
                    </tr>
                    <tr>
                        <th>티켓팅 링크</th>
                        <td>
                            <input type="text" name="calURL" id="calURL" value="${calen.calURL}">
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