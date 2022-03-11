<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="<c:url value='/css/ticketDetailView.css'/>" rel="stylesheet" type="text/css">
		<title>티켓북</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/ticketDetailView.js'/>"></script>
		
		 <script>

	function deleteticket(no) {
	  if (confirm("티켓을 삭제하시겠습니까??")){    //확인
		  
		     location.href='/ticketbook/deleteticketform/' + no;

		 }else{   //취소

		     return false;

		 }
	} 
	
</script> 
	</head>
	
	<body></body>
	<div id="wrap">
    <!-- 탑 -->
    <jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>

    <!-- 티켓북 -->

    <div><h1>${sessionScope.sid1} 님의 티켓북</h1></div>
	<button type="button" onclick="location.href='/ticketbook/ticketInsertForm'" class = "addbtn">티켓추가</button>


    <%--티켓 한 개의 이미지 보이는 div -> forEach로 반복 --%>
    <div class="ticketAll">
        <c:forEach items="${ticketList}" var="ticketbook">
            <div class="all" id = "all__${ticketbook.no}">

                <table border="0" class="list">

                    <tr>
                        <td rowspan="3" align="center" id="빈칸">
                            
                        </td>

                        <td id="공연제목">
                            <div>
                            	<h2>공연제목 : <strong>${ticketbook.subject } </strong></h2><br>
									<div id = "일시">일시 : ${ticketbook.date } ${ticketbook.time }</div><br>
                        	</div>
                        </td>
                    </tr>

                    <tr>
                        <td id="내용" >
                        	<div class="info">
                            	<div>장소 : ${ticketbook.theater } <div class="price"> 가격 : ${ticketbook.price} <br></div> </div>
                            	<div>좌석 : ${ticketbook.seat } <br></div>
      							<div>캐스팅 : ${ticketbook.casting }<br></div>
                            	<div>후기 : ${ticketbook.review } <br></div>
                            	<div>
                            		<button type="button" onclick=" deleteticket(${ticketbook.no})" id = "deletebtn"  class="deletebtn">티켓삭제</button> 
                            		 <div>
							 			<button type="button" onclick="location.href='/ticketbook/updateticketform/${ticketbook.no}'" class="editbtn">티켓수정</button>
                           			 </div>
                           			 <a href="/clovaOCRForm">OCR</a><br><br>
                            	</div>
                            </div>
                        </td>
                        
                    </tr>

                </table>

            </div>

        </c:forEach>

    </div>

    <!-- 바텀 -->
    <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>

</div>

</html>