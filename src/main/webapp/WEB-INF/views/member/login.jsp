<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/login</title>
<style type="text/css">
	table{margin:auto; margin-top:20px;}
	table tr td{padding:2px 8px;}
	table tr th{color:#34597F; padding:2px 8px;}
	table label{font-size:13px; color:#183755;}
	.chkBox{font-size:13px; color:#183755; margin-left:10px;}
	.btn_login{padding:14px 9px; background-color:#C6D4E2;}
</style>
</head>
<body>
 <c:import url="../default/header.jsp" />
 
 <div class="wrap">
 	<form action="${contextPath }/member/user_check" method="post" >
 		<table>
 			<tr>
 				<th>ID</th>
 				<td><input type="text" name="id" placeholder="input id"></td>
 				<td rowspan="2"> <input type="submit" value="LOGIN" class="btn_login"></td>
 			</tr>
 			<tr>
 				<th>PASSWORD</th>
 				<td><input type="password" name="pw" placeholder="input password"></td>
 			</tr>
 			<tr>
 				<td colspan="3" style="text-align:right;">
 					<label class="mem_reg" onclick="location.href='register_form'"> join membership</label>
 					&ensp; <!-- label 안쓰고 a href 태그 사용 가능 -->
 					<label> find id/password </label>
 					<input type="checkbox" name="autoLogin" class="chkBox"><label>auto login</label> &ensp;
 				</td>
 			</tr>
 		</table>
 	</form>
 </div>
 	
 <c:import url="../default/footer.jsp" />
</body>
</html>