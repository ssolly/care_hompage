<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/writeForm</title>
<style type="text/css">
	h2{font-size:40px; font-family:Gabriola; color:#34597F; margin-top:35px;}
	.bold{color:#34597F; font-size:15px; font-weight:bold;}
	.line{width:400px; margin-top:10px; margin-bottom:10px; margin-left:300px;}
	.btn{color:#183755; background-color:#B7CDE4; margin-top:20px;}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   function readURL(input) {
      var file = input.files[0] //사용자가 선택한 파일에 대한 정보
      console.log(file)
      if (file != '') {
         var reader = new FileReader();	//js의 객체 중 하나로, 파일을 읽어주는 객체
         reader.readAsDataURL(file); //파일의 정보를 토대로 파일을 읽고 data의 url을 얻어온다 
         reader.onload = function (e) { // 파일 로드해서 값을 표현한다, e:파일에 대한 정보가 들어간다
          //e : 이벤트 안에 result값이 파일의 정보를 가지고 있다.
           $('#preview').attr('src', e.target.result);	//target까지 쓰면 파일 정보까지 출력, result:파일이 있는 경로
          }
      }
  }  
</script>

</head>
<body>
<!-- 파일 업로드 의존성 필요 : pom.xml에 추가 -->
<c:import url="../default/header.jsp" />
	<div class="wrap">
	<h2>Write</h2>
	<form method="post" action="${contextPath }/board/writeSave" enctype="multipart/form-data" >
	<label class="bold" style="margin-right:320px;">Writer</label><br>
	<input type="text" name="id" value="${loginUser }" readonly style="margin-right:190px;"/>
	<hr class="line">
	<label class="bold" style="margin-right:335px;">Title</label><br>
	<input type="text" name="title" style="width:350px;  margin-right:10px;"/>
	<hr class="line">
	<label class="bold" style="margin-right:314px;">Content</label><br>
	<textarea name="content" rows="10" cols="50"></textarea>
	<hr class="line">
	<label class="bold" style="margin-right:300px;">ImageFile</label><br>
	<input type="file" name="image_file_name" onchange="readURL(this);" style="font-size:11px;">
	<img id="preview" src="#" width=100 height=100 alt="There's no image selected." style="font-size:11px;">
	<hr class="line">
	<input type="submit" value="SAVE" class="btn" />
	<button type="button" class="btn" onclick="location.href='${pageContext }/board/boardAllList'">LIST</button>
	</form>
	</div>
<c:import url="../default/footer.jsp" />
</body>
</html>