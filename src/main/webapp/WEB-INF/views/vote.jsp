<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
    <script src="<c:url value="/js/vote.js"/> ">ß</script>
    <link href="<c:url value='/css/vote.css'/>" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
    <!-- TOP -->
    <jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true'/>

    <div class="voteMain ">
        <input type="radio" id="tab1" name="show" checked/>
        <input type="radio" id="tab2" name="show" />

        <div class="tab">
            <label for="tab1">배우</label>
            <label for="tab2">뮤지컬</label>
        </div>

        <div class="voteContent">
            <div class="content-vote">
                <div class="voteResult">

                        <c:forEach items="${actorList}" var="act" varStatus="status" begin="0" end="2">
                      	<div class="card card-2">
                      	<div class="profileBoxTop"><img class="profile" src="<c:url value='${act.actorProfile}' /> "></div><br>
                      	<div class="profileInfo">
                      	${status.count}위<br>
                      	${act.actorName}<br>
                      	${act.actorVote}표
                      	</div>
                      	</div>

                        </c:forEach>

                </div>
                <div class="voteItem">
                    <table class="tableItem">
                        <tr>
                            <th>순위</th>
                            <th>프로필 사진</th>
                            <th>이름</th>
                            <th>출연작품</th>
                            <th>득표수</th>
                            <th></th>
                        </tr>
                        <c:forEach items="${actorList}" var="act" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td style="width: 110px"><div class="profileBox"><img class="profile" src="<c:url value='${act.actorProfile}' /> "></div></td>
                                <td>${act.actorName}</td>
                                <td>${act.actorName}의 출연작품이름과 배역 이름</td>
                                <td>${act.actorVote}</td>
			  			
				  				<c:choose>
				  				
				  					<c:when test="${memberList.voteA eq 0}"> <!-- Result값이 있다면 실행할 로직 -->
				  				 		<td>투표완료</td>
				  				 	</c:when> 
				  					<c:otherwise>  
				  					<td><a href="<c:url value="/voteActor/${act.actorNo}" />">투표</a></td> 
				  					</c:otherwise> 
								</c:choose>
			  			
			  			
			  			
			  					
			  			<%-- <c:forEach items="${memberList}" var="mem" varStatus="status">
				  				<c:choose> 
				  					<c:when test="${mem.voteA eq 0 }"> <!-- Result값이 있다면 실행할 로직 -->
				  				 		<td>투표완료</td>
				  				 	</c:when> 
				  					<c:otherwise>  
				  					<td><a href="<c:url value="/voteActor/${act.actorNo}" />">투표</a></td> 
				  					</c:otherwise> 
				  				</c:choose> 
						</c:forEach> --%>
						
								<%-- <c:choose> 
				  				<c:when test="${sessionScope.sid.voteA eq 0 }"> <!-- Result값이 있다면 실행할 로직 -->
				  				 <td>투표완료</td>
				  				 </c:when> 
				  				<c:otherwise>  <td><a href="<c:url value="/voteActor/${act.actorNo}" />">투표</a></td> </c:otherwise> 
				  				
				  				</c:choose>  --%>
				  				
                                <%--<c:choose>
                                    <c:when test="{not empty sessionScope.sid}">
                                        <td><button type="button" class="voteBtn"><a href="<c:url value='/voteActor/{actorNo}' /> ">투표</a></button></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><button type="button" class="voteBtn"><a>투표</a></button></td>
                                    </c:otherwise>
                                </c:choose>--%>
                            </tr>
                        </c:forEach>

                    </table>
                </div>
            </div>
            <div class="content-vote">
                <div class="voteResult">

                        <c:forEach items="${musicalList}" var="musc" varStatus="status" begin="0" end="2">
                      	<div class="card card-2">
                      	<div class="profileBoxTop"><img class="profile" src="<c:url value='${musc.muscImg}' /> "></div><br>
                      	<div class="profileInfo">
                      	${status.count}위<br>
                      	${musc.muscName}<br>
                      	${musc.musicalVote}표
                      	</div>
                      	</div>

                        </c:forEach>

                </div>
                <div class="voteItem">
                    <table class="tableItem">
                        <tr>
                            <th>순위</th>
                            <th>뮤지컬 포스터</th>
                            <th>뮤지컬 제목</th>
                            <th>공연 기간</th>
                            <th>득표수</th>
                            <th></th>
                        </tr>
                        <c:forEach items="${musicalList}" var="musc" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td style="width: 110px"><div class="profileBox"><img class="profile" src="<c:url value='${musc.muscImg}' /> "></div></td>
                                <td>${musc.muscName}</td>
                                <td>${musc.muscStartDate} ~ ${musc.muscEndDate}</td>
                                <td>${musc.musicalVote}</td>
                                <%-- <td><button type="button" class="voteBtn" onclick="location.href='<c:url value="/voteMusical/${musc.muscNo}" />';">투표</button></td> --%>
                            	
                            	
                            	<c:choose>
				  				
				  					<c:when test="${memberList.voteB eq 0}"> <!-- Result값이 있다면 실행할 로직 -->
				  				 		<td>투표완료</td>
				  				 	</c:when> 
				  					<c:otherwise>  
				  					<td><a href="<c:url value="/voteMusical/${musc.muscNo}" />">투표</a></td> 
				  					</c:otherwise> 
								</c:choose>
                            	
                            </tr>
                        </c:forEach>

                    </table>
                </div>
            </div>
        </div>
    </div>
    </div>






    <!-- BOTTOM -->
    <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true'/>
</body>
</html>