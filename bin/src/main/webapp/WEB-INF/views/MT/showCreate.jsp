﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有廣告列表</title>
<style>
td{
padding: 3px;
}
.td1{
width:150px;
word-break: break-all;
margin:5px;
font-weight:"bold";
}
</style>
</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div align="center" style="margin-top: 100px"> <br> 
		<h1>資料新增成功</h1>
	</div>
	<form action="/showCreate" method="post" modelAttribute="mtBean" enctype="multipart/form-data" >
	<div>
	</div>
		<div align='center'>
			<table border="1">
<!-- 				<tr> -->
<%-- 					<td><div>PKKKKKK: ${mtBean.pkey}</div></td> --%>
<!-- 				</tr> -->
				<tr>
					<td><div>文章編號: ${mtBean.articleId}</div></td>
				</tr>
				<tr>
					<td><div>發文者: ${mtBean.memberId}</div></td>
				</tr>
				<tr>
					<td><div>上傳時間: ${mtBean.updateDate}</div></td>
				</tr>
				<c:if test="${mtBean.status == 1}"><tr><td><div>文章狀態:上傳成功</div></td></tr></c:if>
				<tr>
					<td class="td1"><div style="width:500px;">[${ mtBean.category }] ${mtBean.title}</div></td>
				</tr>
<!-- 				<tr> -->
<%-- 					<td><div>標籤: ${mtbean.category}</div></td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<%-- 					<td><div>標題: ${mtbean.title}</div></td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<%-- 					<td><div>影片連結: ${mtbean.videoLink}</div></td> --%>
<!-- 				</tr> -->
				<tr>
					<td><div><img style="width:500px;height:300px" src="<c:url value='/getMtCreate/${mtBean.articleId}' />" /></div></td>
				</tr>
				<tr>
<%-- 					<td class="td1"><div style="width:500px;height:300px">內文: ${mtBean.article}</div></td> --%>
					<td class="td1"><div>內文: ${mtBean.article}</div></td>
				</tr>
<!-- 				<tr> -->
<%-- 					<td><div>預覽連結: <a href="${videoBean.link}">${videoBean.link}</a> --%>
<!-- 							<iframe align="center" width="500" height="300"  -->
<%-- 							src="https://www.youtube.com/embed/${videoBean.link}" frameborder="0"> </iframe> --%>
<!-- 						</div> <br> <br> <br> <br> <br></td> -->
<!-- 				</tr> -->
			</table>
			<br> <a href="<c:url value='/' />">回首頁</a> <br>
		</div>
	</form>
	
<script type='text/javascript'>
window.setTimeout(function(){
	var href = $(this).attr('href');
	location.href = href="<c:url value='/' />";
	}, 5000);
</script>
</body>
</html>