<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">	
<title>TrkNews</title>
<style>

/* img{ */
/* width:450px; */
/* height:350; */
/* } */
p{
font-family:Microsoft JhengHei;
font-size:medium
}
.title1
{

/* 背景顏色 #eeeeee */
background-color:#eeeeee;
/*左側框線寬度(5px)、solid(實線)、顏色(orange)*/
border-left:5px solid orange; 
/*行內文字間距(5px)*/
padding:5px;
/*垂直置中*/
}
</style>

</head>
<body style="margin-top:5rem">
     <nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
	</nav>
<!-- <div class="input-group mb-3" style="margin:100px ; width:500px" > -->
<!--   <div class="input-group-prepend"> -->
<!--   <!-- <a href='httpclient1'> --> 
<!--     <button onclick="searchByWord()" class="btn btn-outline-secondary" type="button" id="button-addon1">TVBS SERCH</button></a> -->
<!--   </div> -->
<!--   <input   id="wordChoose"  size="1" type="text" class="form-control" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1" > -->
<!-- </div> -->
	<!-- <section>
		<div>
			<div class="container" style="text-align: center">
				<h2>產品資料</h2>
			</div>
		</div>
	</section> -->
	      
	      
	       
	       
	       
	       
	       
	<section class="container" style=" background-color:#9D9D9D; float:left; width:650px;margin:80px" >
	              
		<div  class="row" style="margin-left:;" >
			      
			<div class="col-md-5" >
			<!-- 追蹤主要頁面 -->
				<h1 class="title1" style="font-size:3em;background-color:;width:620px;font-family:Microsoft JhengHei">${trkNew.title}</h1>
				      <figure style="width:500px;height:400px" class="figure">
                           <img style="width:500px;height:400px" src="<c:url value='/getPictureTK/${trkNew.trackId}' />" class="figure-img img-fluid rounded" alt="...">
                           <figcaption class="figure-caption"></figcaption>
                      </figure>
				<p style="background-color:;width:500px;text-align:right">建立人: ${trkNew.founder}</p>
				<p style="width:300px">建立時間: ${trkNew.fondtime}</p>
				<p>追蹤人數: ${trkNew.trcnum}</p>
				 <div >
				<p class="alert alert-primary" role="alert" style="font-family:Microsoft JhengHei; width:610px;font-size:large;">內容: ${trkNew.descript}</p>
				</div>
				<p>發生地點: ${trkNew.ocplace}</p>
				<p style="width:300px">發生時間: ${trkNew.octime}</p>
				<p>點閱人數: ${trkNew.clicnum}</p>
				<div style="background-color:;width:500px;text-align:center">
                <p class="badge badge-info" style="font-size:medium; text-align:center">標籤: ${trkNew.tag}</p>
                </div>
                <p style="font-family:Microsoft JhengHei">新聞分類: ${trkNew.type}</p>
              
             

              
				<%-- 	<c:choose>
					<c:when test='${product.discount != 1.0 }'>
						<p>
							折扣: ${product.discountStr} &nbsp;&nbsp; 
							實售: <font color='red'>${product.price*product.discount}元</font>
						</p>
					</c:when>
					<c:otherwise>
						<p>&nbsp;</p>
					</c:otherwise>
				</c:choose> --%>
				<%-- 	<p>書商: ${product.companyBean.name}</p> --%>
				
				<p>
					<strong>追蹤編號: </strong> <span class='label label-warning'>
						${trkNew.trackId} </span>
				</p>
				<p>
					<a href="<spring:url value='/trkNews' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>返回
					</a> <a href="<spring:url value='/editNews/${trkNew.trackId}'/>"
						class='btn btn-warning btn-large'> <!-- 跳轉網頁連結 --> <span
						class=''></span>修改追蹤新聞
					</a>
<%-- 					<form:form method='POST' modelAttribute="ImageBean" class='form-horizontal' --%>
<%-- 			                enctype="multipart/form-data" > --%>
<!-- 			                <fieldset > -->
<%-- 			                <form:input id="Image" path="Image" type='file' onchange="readURL(this)"  --%>
<%--        				targetID="preview_progressbarTW_img" class='form:input-large' accept="image/gif, image/jpeg, image/png" />  --%>
					   
<!-- 					     </fieldset> -->
<%-- 					</form:form> --%>
				</p>
			</div>
		</div>
		
	</section>
<%-- 	 <a href="<c:url value='/addimage'/>" class='btn btn-warning btn-large'>  <!-- 跳轉網頁連結 -->  --%>
<!-- 					    <span class=''></span>新增相關影像</a> -->
	<!-- 媒體搜尋區域  -->
	           <section style="margin-left:85rem;">
				   <div style="float:left; margin-top:100px;">
			            <h3 id="002" class="display-4" style="font-family:Microsoft JhengHei" >各媒體相關報導</h3> 
			            <div style="border-style: outset ;font-family:Microsoft JhengHei; width:550px;height:400px;font-size:larger;">
                            <div style="background: ">
                            <button onclick="searchByWord()" style="text-align:center color:#4F4F4F" type="button" class="btn btn-primary btn-lg">TVBS新聞</button>
                            <button onclick="searchByWord()" style="text-align:center" type="button" class="btn btn-secondary btn-lg">三立新聞</button>
                            <button onclick="searchByWord()" style="text-align:center" type="button" class="btn btn-primary btn-lg">東森新聞</button>
                            <button onclick="searchByWord()" style="text-align:center" type="button" class="btn btn-secondary btn-lg">壹新聞</button>
                            </div>
                            	<div id="news1"></div>
<%-- 			      <img src="<c:url value='/getPictureTK/${trkNew.trackId}' />" class="figure-img img-fluid rounded" alt="..."> --%>
			            </div>
			      </div>
			      
			      <div style="float:left; margin-top:10px;">
			      <h3  class="display-4" style="font-family:Microsoft JhengHei" >追蹤報導</h3> 
			            <div style="overflow:scroll;border-style: outset ;font-family:Microsoft JhengHei; width:550px;height:200px;font-size:larger;">
                                <div id="tnews0" style="background:;" >
                                </div>
                        </div>   	
			      </div>
			  </section>    
	<!-- 點擊累加 -->
	 <%-- <%
		Integer hitsCount = (Integer) application.getAttribute("hitCounter");
		if (hitsCount == null || hitsCount == 0) {
			/* 第一次访问 */
			out.println("欢迎访问菜鸟教程!");
			application.getAttribute("trkNew");
			hitsCount = 1;
		} else {
			/* 返回访问值 */
			out.println("欢迎再次访问菜鸟教程!");
			hitsCount += 1;
		}
		application.setAttribute("hitCounter", hitsCount);
	%>

	<p>
		页面访问量为:
		<%=hitsCount%>
		
	</p> --%>
	<!-- 點擊累加 --> 
	<script>
	var NewsId2 = ${trkNew.trackId};
	var caution = false
	
	//var clicnum = document.getElementById(${trkNew.clicnum});
	
	
	function setCookie(name, value, expires, path, domain, secure) {
	        var curCookie = name + "=" + escape(value) +
	                ((expires) ? "; expires=" + expires.toGMTString() : "") +
	                ((path) ? "; path=" + path : "") +
	                ((domain) ? "; domain=" + domain : "") +
	                ((secure) ? "; secure" : "")
	        if (!caution || (name + "=" + escape(value)).length <= 4000)
	                document.cookie = curCookie
	        else
	                if (confirm("Cookie exceeds 4KB and will be cut!"))
	                        document.cookie = curCookie
	}
	function getCookie(name) {
	        var prefix = name + "="
	        var cookieStartIndex = document.cookie.indexOf(prefix)
	        if (cookieStartIndex == -1)
	                return null
	        var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex + prefix.length)
	        if (cookieEndIndex == -1)
	                cookieEndIndex = document.cookie.length
	        return unescape(document.cookie.substring(cookieStartIndex + prefix.length, cookieEndIndex))
	}
	function deleteCookie(name, path, domain) {
	        if (getCookie(name)) {
	                document.cookie = name + "=" +
	                ((path) ? "; path=" + path : "") +
	                ((domain) ? "; domain=" + domain : "") +
	                "; expires=Thu, 01-Jan-70 00:00:01 GMT"
	        }
	}
	function fixDate(date) {
	        var base = new Date(0)
	        var skew = base.getTime()
	        if (skew > 0)
	                date.setTime(date.getTime() - skew)
	}
	var now = new Date()
	fixDate(now)
	now.setTime(now.getTime() + 365 * 24 * 60 * 60 * 1000)
	var visits = getCookie("counter")
	var clicnum = ${trkNew.clicnum};
	
	if (!visits){
	        visits = 1
	}else{
	        visits = parseInt(visits) + 1
	}
	setCookie("counter", visits, now)
	if(visits>1){
		var t1 = 1 + clicnum;
	}else{
		var t1 = 0 + clicnum;
	}
	console.log("Session人數="+visits);
	
// 	document.write("您是到訪的第" + t1 + "位用户！");
	
	
	
	window.onload = function() {
		
    var xhr = new XMLHttpRequest();
	xhr.open("PUT", "<c:url value='/editNews5/' />" + NewsId2, true);
	var jsontrkNewsBean = {
			"trackId": NewsId2,
			"clicnum": t1  
	               }
	console.log("Bean物件:"+jsontrkNewsBean);
	console.log("pk值:"+NewsId2);
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.send(JSON.stringify(jsontrkNewsBean));
	};
	console.log("累積點閱數:"+t1);
</script>
<script>

function searchByWordURL(responseData){
	var responseDatatit = responseData
	//let word = document.getElementById("wordChoose").value;
	let word = "${trkNew.tag}";
	
	var queryStringWord = "?word=" + word;
	console.log(queryStringWord);
	var xhr0 = new XMLHttpRequest(); 
	xhr0.open("GET", "<c:url value='/httpclient2' />" + queryStringWord , true);
	xhr0.send();
	xhr0.onreadystatechange = function() {
		if (xhr0.readyState == 4 && xhr0.status == 200) {
	    var responseDataURL = xhr0.responseText;
	    displayPageAds(responseDatatit, responseDataURL);
	   // console.log("URL值收值:"+responseDataURL);
		}
	}
}


function searchByWord(){
	//let word = document.getElementById("wordChoose").value;
	let word = "${trkNew.tag}";
	console.log("搜尋字值:"+word);
	
	var queryStringWord = "?word=" + word;
	console.log(queryStringWord);
	var xhr0 = new XMLHttpRequest(); 
	xhr0.open("GET", "<c:url value='/httpclient1' />" + queryStringWord , true);
	xhr0.send();
	xhr0.onreadystatechange = function() {
		if (xhr0.readyState == 4 && xhr0.status == 200) {
	    var responseData = xhr0.responseText;
	        searchByWordURL(responseData);
			
		}
	}
}
        
function displayPageAds(responseDatatit, responseDataURL) {
	var content ="<table><th>新聞標題:</th>";
	var ad = JSON.parse(responseDatatit); // 傳回一個陣列
	var adURL = JSON.parse(responseDataURL)
	
//	console.log("URL值印:"+buildByWord0(ad, adURL));
		for(var i=0; i < ad.length; i++) {
			content += "<tr style='line-height: 40px;letter-spacing: 3px'><td ><a id='tid"+ i +"' target='_blank' href='https://www.setn.com/"+adURL[i]+"'>"+ ad[i] +"</a>"+
			"<button onclick='buildByWord("+i+")' type='button' class='btn btn-outline-info'>追蹤</button></td></tr>"; //沒有td(沒有依照語法順序會亂掉) 變數會進不去
		}
	var newsDiv = document.getElementById("news1");
	newsDiv.innerHTML = content +"</table>";
 	/* console.log(newsDiv.innerHTML); */
	
}
//var ad =null;
//var adURL=null;
function buildByWord(ad){
	var n = ad
	var v = ad+1
	console.log(v)
	var tid = document.getElementById("tid"+n);
    var ti1 = tid.text
	var hr1 = tid.getAttribute("href")
//	console.log("建標題"+ ti1);
//	console.log("建標題網址"+ hr1);
	var content ="<table id='tnew'>"
		content +="<tr style='line-height:40px;letter-spacing:3px'><td><a id='tid"+ n +"' target='_blank' href='"+ hr1 +"'>"+ ti1 +"</a></td></tr></table>"
		
    var buildword = document.getElementById("tnews0")  
    //新增 div--v
    var div = document.createElement("div");                                 
	     //設定 div 屬性，如 id--v
        div.setAttribute("id", "newDiv");　  

	     div.innerHTML = content ;
	     
　　     buildword.appendChild(div);
　　     insertRpt(n);
　　     
}

function  insertRpt(n){
	var inst = document.getElementById("tid"+n)
	var instt = inst.text
	var instURL = inst.getAttribute("href")
	var trfk ="${trkNew.trackId}"
	console.log(instt)
	console.log(instURL)
	console.log(trfk)
}

// function addElementDiv() {
// 　　var parent = document.getElementById("tnews0");
// 　　//新增 div
// 　　var div = document.createElement("div");
// 　　//設定 div 屬性，如 id
// 　　div.setAttribute("id", "newDiv");
// 　　div.innerHTML = "js 動態新增div";
// 　　parent.appendChild(div);
// }



</script> 
<!-- <div id="parent1">addtest=================================================================</div> -->
<!-- <input onclick="addElementDiv()" type="button" value="一化網頁設計" name="按鈕名稱" style="width:150px;height:50px;"> -->
</body>
</html>
