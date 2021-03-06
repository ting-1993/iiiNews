<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<title>iiiNews 上架廣告欄位</title>
<style>
/*在此設定margin 以防止被navbar壓到*/
.iiinewsContainer {
	margin-top: 100px;
	margin-bottom: 100px;
	position: relative;
}
	html{
		margin-left:calc(100vw - 100%);
		overflow-y: scroll;
	}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;

		if (date.getMonth() < 10) {
			month = "0" + (date.getMonth() + 1);
		}

		if (date.getDate() < 10) {
			day = "0" + date.getDate();
		}

		var today = date.getFullYear() + "-" + month + "-" + day;
		console.log(today);

		var nextYear = date.getFullYear();
		var nextMonth = month + 2;
		var nextDay = 1;
		if (nextMonth == 13) {
			nextMonth = 1;
			nextYear += 1;
		}
		if (nextMonth == 14) {
			nextMonth = 2;
			nextYear += 1;
		}
		if (nextMonth < 10) {
			nextMonth = "0" + (nextMonth);
		}

		if (nextDay < 10) {
			nextDay = "0" + nextDay;
		}

		var nextdate = nextYear + "-" + nextMonth + "-" + nextDay;
		console.log(nextdate);

		$("#idDate").attr("min", today);
		$("#idDate").attr("max", nextdate);

		$("#idDate").attr("value", today);
	}
</script>
</head>
<body>
	<!-- 要套Bootstrap可能會出現navbar下拉選單被疊在下層的情況 可以試試看在這裡加上
	class="navbar fixed-top"  讓navbar也套用bootstrap屬性讓他們同一層 -->
	<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<!-- 而因為navbar會佔頁首一些位置 我是手寫讓下方開始時自動留100px top 還沒想到更好的做法QQ -->
	<div class="iiinewsContainer">
		<div class="container">
			<div class="row">
				<div class="col-md-6 grid-margin stretch-card">
					<div class="card">
						<div class="card-header bg-info text-white">
							<h2>廣告欄位上架</h2>
						</div>
						<div class="card-body">
							<form:form method="POST" modelAttribute="adBean">
								<fieldset>
									<div class="form-group row">
										<label for="idTitle" class="col-sm-3 col-form-label">標題:
										<span class="text-danger"><b>*</b></span></label>
										<div class="col-sm-9">
											<form:input class="form-control" type="text" id="idTitle"
												name="idTitle" path="adTitle" />
											<span class="text-danger"><form:errors path="adTitle" cssClass="error" /></span>
										</div>
									</div>
									<div class="form-group row">
										<label for="category" class="col-sm-3 col-form-label">欄位位置:
										<span class="text-danger"><b>*</b></span></label>
										<div class="col-sm-9">
											<form:select class="form-control" path="categoryNo" onchange="changeimg()" id="idCategoryNo">
												<form:option value="-1">分類項目</form:option>
												<form:option value="100">A&nbsp;頭版頁首</form:option>
												<form:option value="200">B&nbsp;頭版側標</form:option>
												<form:option value="300">C&nbsp;內頁頁首</form:option>
												<form:option value="400">D&nbsp;內頁側標</form:option>
												<form:option value="500">E&nbsp;內文小廣告</form:option>
											</form:select>
											<span class="text-danger"><form:errors path="categoryNo" cssClass="error" /></span>
										</div>
									</div>
									<div class="form-group row">
										<label for="idWidth" class="col-sm-3 col-form-label">寬:
										<span class="text-danger"><b>*</b></span></label>
										<div class="col-sm-9">
											<form:input class="form-control" type="number" id="idWidth"
												name="idWidth" path="width" placeholder="請輸入寬" />
											<span class="text-danger"><form:errors path="width" cssClass="error" /></span>
										</div>
									</div>
									<div class="form-group row">
										<label for="idHeight" class="col-sm-3 col-form-label">高:
										<span class="text-danger"><b>*</b></span></label>
										<div class="col-sm-9">
											<form:input class="form-control" type="number" id="idHeight"
												name="idHeight" path="height" placeholder="請輸入高" />
											<span class="text-danger"><form:errors path="height" cssClass="error" /></span>
										</div>
									</div>
									<div class="form-group row">
										<label for="idDate" class="col-sm-3 col-form-label">廣告時間:
										<span class="text-danger"><b>*</b></span></label>
										<div class="col-sm-9">
											<form:input class="form-control" type="date" id="idDate"
												name="idDate" path="adDate" placeholder="請輸入時間" />
											<span class="text-danger"><form:errors path="adDate" cssClass="error" /></span>
										</div>
									</div>
									<div class="form-group row">
										<label for="idPrice" class="col-sm-3 col-form-label">價錢:
										<span class="text-danger"><b>*</b></span></label>
										<div class="col-sm-9">
											<form:input class="form-control" type="number" min="0"
												id="idPrice" name="idPrice" path="price" placeholder="請輸入價錢" />
											<span class="text-danger"><form:errors path="price" cssClass="error" /></span>
										</div>
									</div>
									<div class="form-group row">
										<label for="idStock" class="col-sm-3 col-form-label">欲販售數量:
										<span class="text-danger"><b>*</b></span></label>
										<div class="col-sm-9">
											<form:input class="form-control" type="number" step="1"
												min="1" max="20" id="idStock" name="idStock" path="stock"
												placeholder="請輸入庫存" />
											<span class="text-danger"><form:errors path="stock" cssClass="error" /></span>
										</div>
									</div>
									<div class="form-group row">
										<label for="idStatement" class="col-sm-3 col-form-label">備註:</label>
										<div class="col-sm-9">
											<form:textarea class="form-control" type="text" id="idStatement"
												name="idStatement" path="statement" style="resize:none;"/>
											<span class="text-danger"><form:errors path="statement" cssClass="error" /></span>
										</div>
									</div>
								</fieldset>
								<div class="sub">
									<!-- 								<input type="submit" name="submit" id="submit" value="送出" -->
									<!-- 									class="btn btn-primary mr-2"> -->

									<button type="submit" class="btn btn-primary btn-icon-text">
										<i class="fa fa-file-o btn-icon-prepend"></i>&nbsp送出
									</button>
									<button type="reset" class="btn btn-danger btn-icon-text">
										<i class="fa fa-refresh btn-icon-prepend"></i>&nbsp清除
									</button>
									<button type="button" class="btn btn-outline-info btn-icon-text" onclick="onebuttontodata()">
										<i class="fa fa-refresh btn-icon-prepend"></i>&nbsp一鍵輸入
									</button>

<!-- 									<input type="reset" value="" class="btn btn-light"> -->
<!-- 									<input type="button" value="one(尚未設定)" onclick="onebuttontodata()" -->
<!-- 										class="btn btn-light"> -->
								</div>
							</form:form>
						</div>
					</div>
				</div>
				<div class="col-md-6 grid-margin stretch-card">
					<div class="card">
						<div class="card-header">
							<h2>服務使用說明</h2>
						</div>
						<div class="card-body text-left p-3">
							<h4>歡迎使用廣告欄位上架功能</h4>
							<p>可依分類上傳欄位項目，並設定廣告欄位大小尺寸</p>
							<div class="row">
								<div class="col-6 text-center">
									<img class="img-fluid w-100" src="/iiiNews/img/ad_header.jpeg" alt="Sample" id="sampleHeader">
								</div>
								<div class="col-6 text-center">
									<img class="img-fluid w-100" src="/iiiNews/img/ad_article.jpeg" alt="Sample" id="sampleArticle">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script>
function onebuttontodata(){
	console.log("hello")
	document.getElementById("idWidth").value = '600';
	document.getElementById("idHeight").value = '300';
	document.getElementById("idPrice").value = '2000';
	document.getElementById("idStock").value = '5';
	document.getElementById("idDate").value = '2020-12-31';
	document.getElementById("idTitle").value = '跨年';
}

function changeimg(){
	console.log("change img");
	var cateValue = document.getElementById("idCategoryNo").value;
	console.log("cateValue:"+cateValue);
	var jquerycatevalue = $("#idCategoryNo").val();
	if(jquerycatevalue == 100){
		$("#sampleHeader").attr("src","/iiiNews/img/ad_header_A.jpg");
		$("#sampleArticle").attr("src","/iiiNews/img/ad_article_ALL.jpg");
	}else if(jquerycatevalue == 200){
		$("#sampleHeader").attr("src","/iiiNews/img/ad_header_B.jpg");
		$("#sampleArticle").attr("src","/iiiNews/img/ad_article_ALL.jpg");
	}else if(jquerycatevalue == 300){
		$("#sampleHeader").attr("src","/iiiNews/img/ad_header_ALL.jpg");
		$("#sampleArticle").attr("src","/iiiNews/img/ad_article_C.jpg");
	}else if(jquerycatevalue == 400){
		$("#sampleHeader").attr("src","/iiiNews/img/ad_header_ALL.jpg");
		$("#sampleArticle").attr("src","/iiiNews/img/ad_article_D.jpg");
	}else if(jquerycatevalue == 500){
		$("#sampleHeader").attr("src","/iiiNews/img/ad_header_ALL.jpg");
		$("#sampleArticle").attr("src","/iiiNews/img/ad_article_E.jpg");
	}else{
		$("#sampleHeader").attr("src","/iiiNews/img/ad_header.jpeg");
		$("#sampleArticle").attr("src","/iiiNews/img/ad_article.jpeg");
	}
	console.log("jquerycatevalue:"+jquerycatevalue);
}

</script>
</body>
</html>