<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/register</title>
<style type="text/css">
	table{margin:auto; margin-top:30px; text-align:center; width:300px;}
	table caption{font-size:40px; font-family:Gabriola; color:#34597F; text-align:center; }
	table tr td b{font-size:15px; color:#34597F; padding:2px 20px;}
	.join_btn{background-color:#B7CDE4; margin-top:20px;}
</style>
<script src="<%=request.getContextPath() %>/resources/js/daumpost.js" ></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	<!-- jquery -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function register() {
		addr1 = $("#addr1").val()
		addr2 = $("#addr2").val()
		addr3 = $("#addr3").val()
		addr = addr1 + "/" + addr2 + "/" + addr3
		$("#addr1").val(addr)
		fo.submit()
	}
</script>
</head>
<body>
<c:import url="../default/header.jsp" />
	<div class="wrap">
		<form action="register" method="post" id="fo">
			<table>
				<caption><b>Join Membership</b></caption>
				<tr>
					<td><b>ID</b></td>
					<td><input type="text" name="id" placeholder="input id"></td>
				</tr>
				<tr>
					<td><b>Password</b></td>
					<td><input type="password" name="pw" placeholder="input password"></td>
				</tr>
				<tr>
					<td rowspan="4" style="padding-bottom:60px;"><b>Address</b></td>
					<td><input type="text" readonly id="addr1" name="addr" placeholder="click zonecode" style="width:45%;">
					<input type="button" onclick="daumPost()" value="ZoneCode" style="background-color:#C6D4E2;"></td>
				</tr>
				<tr>
					<td><input type="text" readonly id="addr2" placeholder="address"></td>
				</tr>
				<tr>
					<td><input type="text" id="addr3" placeholder="detail address">
				</tr>
				<tr>
					<td colspan="3"><input type="button" onclick="register()" value="JOIN" class="join_btn"></td>
				</tr>
			</table>
		</form>
	</div>
<c:import url="../default/footer.jsp" />
</body>
</html>