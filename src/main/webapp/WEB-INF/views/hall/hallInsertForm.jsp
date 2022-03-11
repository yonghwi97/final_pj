<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="<c:url value='/css/hall2.css'/>" rel="stylesheet" type="text/css">
    <title>Insert</title>

    <!-- include libraries(jQuery, bootstrap) -->   <!--  ********* -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

</head>

<body>
<form method = "post" action="/hall/inserthall">
    공연장번호<input type="text" id="no" name="no" ><br>
    공연장이름<input type="text" id="name" name="name" ><br>
    공연장지역<input type="text" id="area" name="area" ><br>
    공연장위치<input type="text" id="location" name="location" ><br>
    공연장좌석<input type="text" id="seat" name="seat" ><br>
    <!--  ********* -->
    공연장편의시설<input type="text" id="con" name="con" ><br>
    공연장고객센터번호<input type="text" id="cus" name="cus" ><br>

    <!--  ********* -->
    <textarea id="details" name="details">   </textarea>

    <div id = "button"><input type="submit" value="등록"><input type="reset" value="취소"></div>
</form>
<!-- 바텀 -->


<!--  ********* -->
<script>
    $(document).ready(function() {
        $('#details').summernote();
    });
</script>

</body>
</html>