<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/membership</title>
<style type="text/css">
	table{margin:auto; margin-top:30px; text-align:center;}
	table caption{font-size:40px; font-family:Gabriola; color:#34597F; text-align:center;}
	table tr:nth-child(odd){background-color:#EBF3F9;}
	table tr th{font-size:17px; color:#34597F; background-color:#D1DCE8; padding:2px 25px; }
	table tr td{color:#183755; padding:2px 25px;}
	table tr td a{color:#183755;}
</style>
</head>
<body>
<c:import url="../default/header.jsp" />
	<div class="wrap">
		<table>
			<caption><b>Member Information</b></caption>	<!-- caption:제목 -->
			<tr>
				<th>ID</th><th>Password</th><th>Address</th>
			</tr>
			<c:forEach var="member" items="${memberList }">
			<tr>
				<td><a href="info?id=${member.id }">${member.id }</a></td>
				<td>${member.pw }</td>
				<td>${member.addr }</td>
			</tr>
			</c:forEach>
		</table>
	</div>
<c:import url="../default/footer.jsp" />
</body>
</html>