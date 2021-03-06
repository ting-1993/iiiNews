<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員已賣出的列表</title>
	<script>
	function status(num){
		console.log(num);
		let status = document.getElementById("statusTd");
		if(num == 0){
			status.innerHTML = "未付款";
		}else if(num == 1){
			status.innerHTML = "已付款";
		}else{
			status.innerHTML = "狀態異常";
		}
	}
	</script>
		<style>
		html{
			margin-left:calc(100vw - 100%);
			overflow-y: scroll;
		}
	</style>
</head>
<body onload="status(${orderInfo.paymentStatus})">
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>

	<div align="center" style="margin-top:100px;">
		<h2>商業會員已賣出的列表</h2>
		<a href="<c:url value='/' />">回首頁</a>
	</div>
	<span>${msgMap.addStatus}</span>
	<hr>
	<div align="center">
		<table border="1" >
		<tr align="right"></tr>
			<tr>
				<td>item PK</td>
				<td>廣告編號</td>
				<td>賣家</td>
				<td>廣告日期</td>
				<td>欄位分類</td>
				<td>寬</td>
				<td>高</td>
				<td>單價</td>
				<td>售出日期</td>
				<td>圖片</td>
				<td>設定</td>
			</tr>
			<c:forEach var="items" items="${CpSoldList}">
				<tr>
					<td>${items.itemPk}</td>
					<td>${items.adNo}</td>
					<td>${items.buyerMemberId}</td>
					<td>${items.adDate}</td>
					<td>${items.categoryNo}</td>
					<td>${items.width}</td>
					<td>${items.height}</td>
					<td>${items.unitPrice}</td>
					<td>${fn:substring(items.soldDate,0,19)}</td>
					<td><c:if test="${empty items.adImage}">購買會員尚未上傳圖片</c:if></td>
					<td>
						<a href="<c:url value="/getOneItem/${items.itemPk}" />" onclick="return confirm('Are you sure?')">檢視詳細內容</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>