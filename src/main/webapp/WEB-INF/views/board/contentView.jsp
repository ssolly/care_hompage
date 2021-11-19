<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/contentView</title>
<style type="text/css">
	table{margin:auto; margin-top:30px; text-align:center;}
	table caption{font-size:40px; font-family:Gabriola; color:#34597F; text-align:center;}
	table tr th{font-size:17px; color:#34597F; background-color:#D1DCE8; padding:2px 25px; }
	table tr td{color:#183755; padding:2px 25px;}
	table tr td a{font-size:10px; color:#183755;}
	.btn{color:#183755; background-color:#B7CDE4; margin-top:20px;}
	
	#modal_wrap{	<%-- display:none 처음 페이지에서 보여지지 않게 세팅 --%>
		display: none; position: fixed; z-index: 9;
		margin: 0 auto; top:0; left: 0; right: 0;
		width:100%; height:100%;
		background-color: rgba(0, 0, 0, 0.4);
	}
	#first{ 
		font-size:15px; color:#ECF4FD;
		position: fixed; z-index: 10; margin: 0 auto;
		top:30px; left: 0; right: 0; display:none;
		background-color: rgba(37, 63, 94, 0.9);
		height:350px; width:300px;
	}
	#frm button{color:#34597F; background-color:#A8BBD1; margin-top:10px;}
	#frm hr{margin:5px 0px; }
	
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    function slideClick(){
    	$("#first").slideDown('slow'); $("#modal_wrap").show();
    }
    function slide_hide(){
    	$("#first").slideUp('fast'); $("#modal_wrap").hide();
    }
    function rep(){	//사용자가 입력한 값 반복문을 사용해 키와 값으로 세팅
    	let form={}; 
    	let arr = $("#frm").serializeArray();
    	for(i=0;i<arr.length;i++){ 
    		form[arr[i].name] = arr[i].value; 
    	}
    	$.ajax({
    		url:"addReply", type:"POST", dataType:"json", data:JSON.stringify(form),
  		    contentType:"application/json;charset=utf-8",
  		    success: function(list){
    			alert("성공적으로 답글이 달렸습니다."); 
    			$("#title").val("");	//성공 후 다시 댓글 달 때 textbox 초기화
    			$("content").val("");
    			slide_hide();
    			replyData();	//Reply DB에 접근해서 화면에 출력
   			 },
			error: function(){ alert("문제 발생!")}
  		});
    }
    function replyData(){	//DB로부터 reply답글 관련 data를 가져오기 위한 기능
        $.ajax({
           url:"replyData/"+${personalData.writeNo}, type:"GET", 	// '/'를 썻기 때문에 Path
           dataType:"json",
           success: function(rep){
              let html = ""
              rep.forEach(function(data){	//forEach문
                 let date = new Date(data.write_date)	//초 -> 년월일시분초로 형변환
                 let writeDate = date.getFullYear()+"년"+(date.getMonth()+1)+"월"
                 writeDate += date.getDate()+"일"+date.getHours()+"시"
                 writeDate += date.getMinutes()+"분"+date.getSeconds()+"초"
                 html += "<div align='left' style='color:#183755;'>";
                 html += "<label style='color:#34597F;'><b>id </b></label> : <label style='font-size:14px;'>"+data.id+"</label>  <b>|</b>  ";
                 html += "<label style='color:#34597F;'><b>date</b></label> : <label style='font-size:14px;'>"+writeDate+"</label><br>"
                 html += "<label style='color:#34597F;'><b>title</b></label> : <label style='font-size:14px;'>"+data.title+"</label><br>"
                 html += "<label style='color:#34597F;'><b>content</b></label> : <label style='font-size:14px;'>"+data.content+"</label><hr color='#DCE4EC'><br></div>"
              })
              $("#reply").html(html)	//id가 reply인 값에 추가
           },error:function(){
              alert('데이터를 가져올 수 없습니다')
           }
        })
     }
</script>

</head>
<body onload="replyData()">	<!-- page가 시작 되자마자 replyData()를 호출해서 첫 화면부터 댓글창 확인 가능 -->
	<div id="modal_wrap">
		<div id="first">
		<div style="width:250px;margin: 0 auto;padding-top: 20px;">
		<form id="frm">
			<input type="hidden" name="write_no" value="${personalData.writeNo}">
			<font style="font-family:Gabriola; font-size:30px;"><b>Reply Page</b></font> 
			<hr color="#A8BBD1">
			<b>Writer : ${loginUser}</b> 
			<hr color="#A8BBD1">
			<b>Title</b><br><input type="text" id="title" size="20" name="title">
			<hr color="#A8BBD1">
			<b>Content</b><br>
			<textarea name="content" id="content" rows="5" cols="30"></textarea>
			<hr color="#A8BBD1">
			<button type="button" onclick="rep()">REPLY</button>
			<button type="button" onclick="slide_hide()">CANCEL</button>
		</form>
		</div>
		</div>
	</div>
	
	<!-- 보통의 홈페이지 중 게시글 상세 보기 페이지 -->
	<c:import url="../default/header.jsp" />
	<div class="wrap">
	<table>
		<caption> <b>Personal Data</b></caption>
		<tr>
			<th width="100">No.</th>
			<td width="200">${personalData.writeNo}</td>
			<th width="100">Writer</th>
			<td width="200">${personalData.id}</td>
		</tr>
		<tr>
			<th>Title</th>
			<td>${personalData.title}</td>
			<th>Date</th>
			<td>${personalData.saveDate}</td>
		</tr>
		<tr>
			<th>Content</th>
			<td>${personalData.content}</td>
			<td colspan="2">
				<c:if test="${ personalData.imageFileName == 'nan' }">
					<b>No Image</b>
				</c:if> 
				<c:if test="${ personalData.imageFileName != 'nan' }">
					<a href="${contextPath}/board/download?imageFileName=${personalData.imageFileName}">
					<img width="200px" height="100px" 
					src="${contextPath}/board/download?imageFileName=${personalData.imageFileName}">
					<br>
					${personalData.imageFileName}
					</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="padding-top: 30px;">
				<div id="reply"></div>
			</td>
		</tr>
		</table>
		<c:if test="${ loginUser == personalData.id }">
			<input type="button" onclick="location.href='${contextPath }/board/modify_form?writeNo=${personalData.writeNo }'" value="MODIFY" class="btn">
			<input type="button" onclick="location.href='${contextPath }/board/delete?writeNo=${personalData.writeNo }&imageFileName=${personalData.imageFileName}'" 
				   value="DELETE" class="btn"> <!-- writeNo : DB의 내용 삭제, imageFileName : 저장소에서 파일 삭제 -->
		</c:if> 
			<input type="button" onclick="slideClick()" value="REPLY" class="btn"> 	<!-- reply : 답글달기 -->	
			<input type="button" onclick="location.href='${contextPath}/board/boardAllList'" value="LIST" class="btn">
		
	
	</div>
	<c:import url="../default/footer.jsp" />

</body>
</html>