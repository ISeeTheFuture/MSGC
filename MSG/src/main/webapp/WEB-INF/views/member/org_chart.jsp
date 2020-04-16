<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/select_box.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/paging.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/hrBoard.css"
	type="text/css">
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/listForm.js"></script>
<title>인사 조직도</title>
</head>
<title>조직도</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<section>
		<div>
			<article>
                <div class="subNav">
                    <h3>인사관리</h3>
                    <ul>
                        <li onclick="location.href='${pageContext.request.contextPath}/member/empLogBoard.do'">근태관리</li>
                        <li onclick="location.href='${pageContext.request.contextPath}/member/ioLog.do'">출입기록</li>
                        <li onclick="location.href='${pageContext.request.contextPath}/member/orgChart.do'">조직도</li>
	                    <li onclick="location.href='${pageContext.request.contextPath}/leave/update.do'">휴가관리</li>
                        <li onclick="location.href='${pageContext.request.contextPath}/leave/list.do'">휴가내역</li>
                     	<li onclick="location.href='${pageContext.request.contextPath}/leave/select.do'">나의휴가내역</li>
                     </ul>
                </div>
			    <div class="content">
			        <table class="board">
			            <tr>
			                <th></th>
			                <th>부서</th>
			                <th>사번</th>
			                <th>이름</th>
			                <th>아이디</th>
			                <th>직위</th>
			            </tr>
			            <c:choose>
				            <c:when test="${memberLoggedIn.authority eq 'H' || memberLoggedIn.authority eq 'A' }">
					            <c:forEach items="${list }" var="emp" varStatus="vs">
						            <tr>
						                <td>${vs.count }</td>
						                <td>${emp.deptName }</td>
						                <td><a href="${pageContext.request.contextPath}/member/empInfo.do?empNo=${emp.empNo}">${emp.empNo }</a></td>
						                <td><a href="${pageContext.request.contextPath}/member/empInfo.do?empNo=${emp.empNo}">${emp.empName }</a></td>
						                <td><a href="${pageContext.request.contextPath}/member/empInfo.do?empNo=${emp.empNo}">${emp.userId }</a></td>
						                <td>${emp.jobName }</td>
						            </tr>
				            	</c:forEach>
			            	</c:when>
		            		<c:otherwise> 
			            		<c:forEach items="${list }" var="emp" varStatus="vs">
				            		<tr>
						                <td>${vs.count }</td>
						                <td>${emp.deptName }</td>
						                <td><a href="${pageContext.request.contextPath}/member/empInfoThird.do?empNo=${emp.empNo}">${emp.empNo }</a></td>
						                <td><a href="${pageContext.request.contextPath}/member/empInfoThird.do?empNo=${emp.empNo}">${emp.empName }</a></td>
						                <td><a href="${pageContext.request.contextPath}/member/empInfoThird.do?empNo=${emp.empNo}">${emp.userId }</a></td>
						                <td>${emp.jobName }</td>
						            </tr>
				            	</c:forEach>
		            		</c:otherwise>	
		            	</c:choose>
			        </table>
			        <div class="pagination">
							<c:if test="${paging.startPage != 1 }">
								<a
									href="${pageContext.request.contextPath}/member/empLog.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchBy=${searchBy}&keyword=${keyword}"
									class="arrow" style="margin-left: 0px; margin-right: 0px;">&laquo;</a>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
								var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<a class="active">${p }</a>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<a
											href="${pageContext.request.contextPath}/member/orgChart.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchBy=${searchBy}&keyword=${keyword}">${p }</a>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<a
									href="${pageContext.request.contextPath}/member/orgChart.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchBy=${searchBy}&keyword=${keyword}"
									class="arrow" style="margin-left: 0px; margin-right: 0px;">&raquo;</a>
							</c:if>
						</div>
					</form>
					<table class="board" style="margin-top: 100px;">
						<tr>
							<th></th>
							<th>부서</th>
							<th>사번</th>
							<th>이름</th>
							<th>아이디</th>
							<th>직위</th>
						</tr>
						<c:choose>
							<c:when
								test="${memberLoggedIn.authority eq 'H' || memberLoggedIn.authority eq 'A' }">
								<c:forEach items="${list }" var="emp" varStatus="vs">
									<tr>
										<td>${vs.count }</td>
										<td>${emp.deptName }</td>
										<td><a
											href="${pageContext.request.contextPath}/member/empInfo.do?empNo=${emp.empNo}">${emp.empNo }</a></td>
										<td><a
											href="${pageContext.request.contextPath}/member/empInfo.do?empNo=${emp.empNo}">${emp.empName }</a></td>
										<td><a
											href="${pageContext.request.contextPath}/member/empInfo.do?empNo=${emp.empNo}">${emp.userId }</a></td>
										<td>${emp.jobName }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list }" var="emp" varStatus="vs">
									<tr>
										<td>${vs.count }</td>
										<td>${emp.deptName }</td>
										<td><a
											href="${pageContext.request.contextPath}/member/empInfoThird.do?empNo=${emp.empNo}">${emp.empNo }</a></td>
										<td><a
											href="${pageContext.request.contextPath}/member/empInfoThird.do?empNo=${emp.empNo}">${emp.empName }</a></td>
										<td><a
											href="${pageContext.request.contextPath}/member/empInfoThird.do?empNo=${emp.empNo}">${emp.userId }</a></td>
										<td>${emp.jobName }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<div class="pagination">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="${pageContext.request.contextPath}/member/empLog.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchBy=${searchBy}&keyword=${keyword}"
								class="arrow" style="margin-left: 0px; margin-right: 0px;">&laquo;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<a class="active">${p }</a>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a
										href="${pageContext.request.contextPath}/member/orgChart.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchBy=${searchBy}&keyword=${keyword}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="${pageContext.request.contextPath}/member/orgChart.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchBy=${searchBy}&keyword=${keyword}"
								class="arrow" style="margin-left: 0px; margin-right: 0px;">&raquo;</a>
						</c:if>
					</div>
					<button type="button" class="yellowBtn"
								onclick="location.href='${pageContext.request.contextPath}/member/addEmp.do'" style="
    position: absolute;
    margin-top: -16px;
    float: right;
    margin-left: 148px;
">사원추가</button>
				</div>
			</article>
		</div>
	</section>
</body>

</html>