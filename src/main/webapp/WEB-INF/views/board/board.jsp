<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>MUTRODUCE</title> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<link href="<c:url value='/css/board1.css'/>" rel="stylesheet"
	type="text/css">
	

<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}
</style>


</head>
<jsp:include page="/WEB-INF/views/layout/top1.jsp" flush='true' />

<body link="blue" vlink="blue" alink="blue">
	<div class="boardcontainer">
	
		<div class="row">
			<div class="board">
				<h2 class="titlefont">공연 요청 게시판</h2>
				
				<br>
				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>게시글 번호</th><th>작성자</th><th>제목</th><th>내 용</th><th>조회 수</th><th>작성일</th><!-- <th>삭제</th> -->
						</tr>
					</thead>
					<tbody id="listArea">
					</tbody>
				</table>
				<br>
				
			</div>
		</div>
		<button type="button" class="writeBtn" id="writeBtn">글쓰기</button>
	</div>
<jsp:include page="/WEB-INF/views/layout/bottom1.jsp" flush='true' />

	
</body>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#writeBtn").click(function() {
					location.href = "write";
				})
				$.ajax({
					url : "boardList",
					success : function(result) {
						console.log("boardList");
						var html = "";
						result.forEach(function(item, index) {
							html += "<tr> <td>"+item.idx+"</td><td>"+item.memId+"</td><td><a style='text-decoration:none;' href = 'view?idx=" + item.idx
									+ "'>" + item.title + "</a></td><td>"+item.contents+"</td><td>"+item.hits+"</td><td>"+item.writedate+"</td>"
						})
						$("#listArea").append(html)
						$('#example').DataTable();	
					}
				});
				$("#deleteBtn").click(function() {
					location.href = "write";
				})
			});
	/* <td><a href='/board/deleteboard/"+item.idx+"' style='text-decoration:none;'>&#10060;</a></td> */
</script>
</html>