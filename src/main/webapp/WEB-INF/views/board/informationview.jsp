<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>과제</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value='/css/board.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/board1.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/board2.css'/>" rel="stylesheet" type="text/css">
<script src="<c:url value='/js/replycheck.js'/>"></script>
</head>
<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
<nav id="boardmenu">
		<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;
			</span>
		<div class="menu-btn">
			<div class="line line--1"></div>
			<div class="line line--2"></div>
			<div class="line line--3"></div>
		</div>
		<div class="nav-links">
			<div id="mySidenav" class="sidenav">
				<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
				<ul id="menuGroup">
					<li class="menu link"><a href="/board">공연 요청</a></li>
					<li class="menu link"><a href="#">장르별 추천</a>
						<ul class="hide">
							<li class="subMenu"><a href="<c:url value='/board3'/>">배우 별</a></li>
							<li class="subMenu"><a href="<c:url value='/board4'/>">뮤지컬 별</a></li>
						</ul></li>
					<li class="menu link"><a href="/boardinformation">정보 게시판</a></li>
				</ul>
			</div>
		</div>
	</nav>

<body>
<div class="viewcontainer" style="text-align:left;">
	<div class="row">
		<div class="col-sm-12" style="text-align:right;">
	     <h2 class="titlefont" style="text-align:left;" id = "title" ></h2>
	     
	     <div id="buttenArea">
				<button type="button" class="btn" onclick="location.href='javascript:deleteCheck();' ">게시글 삭제</button>
           		<button type="button" class="btn" onclick="location.href='javascript:update();' ">게시글 수정</button> 
			</div>
		</div>
	</div> 
	<div class="row">
		<div class="col-sm-6">
			<div class="row">
				<div class="col-sm-12">
			      <h3 id = "contents"></h3>
				</div>
				<br>
				<br>
			</div>
		</div>
		<div class="col-sm-6">
	      <div id="image" ></div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="row">
		<div class="col-sm-12">
	      <h2 id = "cnt"></h2>
	      <hr>
	      <br>
	      <div id = "replyArea"></div>
		</div>
	</div>
	<div><button class="listbtn" type="button" onclick="location.href='/boardinformation'">글 목록</button></div>
</div>
<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
</body>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="<c:url value='/js/board.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<style>
.fakeimg {
  height: 200px;
  background: #aaa;
}
.subReply {
    padding-left: 50px;
}
</style>


<script>
function drawReply(replys) {
	$("#cnt").text("등록된 댓글 - " + replys.length)
	var html = '';
	html += '<h4>댓글 작성</h4><form class="form-inline replyform" id="replyform" name="replyform" action="writeReply2" method="post" onSubmit="return Checkreplyform()" ><input type="hidden" name="idx" value = "' + IDX + '"><input type="hidden" name="replyIdx" value = "0"><input type="text" class="contents replymaininput form-control mb-2 mr-sm-2" id="contents" placeholder="댓글" name="contents"><button class="replybtn" type="submit" >등록</button></form>';
	html += '<hr>'
	replys.forEach(function(reply, tempIndex){ 
		if (reply.replyIdx == 0) {
			var rc = 0;
			replys.forEach(function(i){
				if (reply.idx == i.replyIdx) rc++;
			})
			html += '<div class="row"><div class="col-sm-12">';
			html += '<form class="form-inline" id="replyform1" action="writeReply2" method="post" onSubmit="return CheckRereplyform(' + tempIndex + ')"><label for="pwd" class="mr-sm-2">댓글 내용 :  <font size="5">' + reply.contents + '</font>  (대댓글 수 : ' + rc + ')'  +'<a href="/board/deletereply/'+ IDX + '/'+reply.idx+ '" style="text-decoration:none;"> &#10060;</a></label>';
			html += '<input type="hidden" name="idx" value = "' + IDX + '"><input type="hidden" name="replyIdx" value = "' + reply.idx + '"><input type="text" class="contents replyinput form-control mb-2 mr-sm-2" id="contents' + tempIndex + '" placeholder="댓글" name="contents"><input type="submit" class="replybtn" value="등록" /></form>';
			html += '<div class="row"><div class="col-sm-12 sub' + reply.idx + '"></div></div></div></div>';
		}
	})
	
	$("#replyArea").append(html);

	replys.forEach(function(reply, tempIndex1){ 
		if (reply.replyIdx != 0) {
			var rc = 0;
			replys.forEach(function(i){
				if (reply.idx == i.replyIdx) rc++;
			})
			var subHtml = '';
			subHtml = '<div class="row"><div class="col-sm-12 subReply">';
			subHtml += '<form class="form-inline" action="writeReply2" method="post" onSubmit="return CheckRereplyform(' + tempIndex1 + ')"><label for="pwd" class="mr-sm-2">↳댓글 내용 :  <font size="5">' + reply.contents + '</font>  (대댓글 수:' + rc + ')'  +'<a href="/board/deletereply2/'+ IDX + '/'+reply.idx+ '" style="text-decoration:none;"> &#10060;</a></label>'
			subHtml += '<input type="hidden" name="idx" value = "' + IDX + '"><input type="hidden" name="replyIdx" value = "' + reply.idx + '"><input type="text"class="replyinput form-control mb-2 mr-sm-2"  id="contents' + tempIndex1 + '" placeholder="댓글" name="contents"><button class="replybtn"  type="submit" >등록</button></form>';
			subHtml += '<div class="row"><div class="col-sm-12 sub' + reply.idx + '"></div></div></div></div>';
			$(".sub" + reply.replyIdx).append(subHtml);
		}
	})
}


 var IDX = getQueryStringObject().idx;
 function getQueryStringObject() {
    var a = window.location.search.substr(1).split('&');
    if (a == "") return {};
    var b = {};
    for (var i = 0; i < a.length; ++i) {
        var p = a[i].split('=', 2);
        if (p.length == 1)
            b[p[0]] = "";
        else
            b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
    }
    return b;
}

 var idx;
  $.ajax({url: "boardView2?idx="+IDX, 
	success: function(result){
		idx=result.idx;
		if(result.memId != "${sessionScope.sid1}"){
			// alert("숨기기")
			$('#buttenArea').css("display", "none");
		}
		
		$("#image").append('<img src="<c:url value="/images1/'+result.image+'"/>"  style="width: 400px;" onerror="this.style.display=\'none\';" />');
	  $("#title").text(result.title);
	  $("#memID").text(result.memID)
	  $("#contents").text(result.contents);
   }});

  $.ajax({url: "replyList2?idx="+IDX, success: function(replys){
	  drawReply(replys)
   }});
  
  
  
  function deleteCheck(){
		var answer = confirm("선택한 게시글을 삭제하시겠습니까?");
		if(answer == true){
			location.href="/board/deleteboard2/" + IDX;
		}
	}
  
  function deleteReplyCheck(){
		var answer = confirm("선택한 댓글을 삭제하시겠습니까?");
		if(answer == true){
			//location.href="/board/deletereply/" + pageIDX + "/" + IDX;
			location.href="/board/deletereply2/18/" + IDX;
		}
	}
  
  function update(){

			location.href="/board/update2/" + IDX;

	}

  </script>
</html>
