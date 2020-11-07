<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>申請客服表單</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
window.onload=function(){

	$("#image").change(function(){
		readURL(this);// this代表<input id="imgInput">
		let context = "<br>預覽中，送出後才儲存";
		$("#imgspan")[0].innerHTML = context;
		
	
 	});
	
	$("#reset").click(function(){
		let context = "";
		$("#imgspan")[0].innerHTML = context;
		 $("#preview_img").attr('src',"<c:url value='/image/CR2.jpg' />");
	});
	
	$("#cancel").click(function(){
		let context = "";
		$("#imgspan")[0].innerHTML = context;
		 $("#preview_img").attr('src',"<c:url value='/image/CR2.jpg' />");
	});

	function readURL(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function (e) {
		 	  $("#preview_img").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	var yourImg = document.getElementById('preview_img');
	if(yourImg && yourImg.style) {
	    yourImg.style.height = ${oneItem.height}+'px';
	    yourImg.style.width = ${oneItem.width}+'px';
	}
	

	
	
}

</script>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>
<section style="margin-top:100px">
<div align="center">
       <h3 class="title" >客服表單申請</h3>
       </div>
       <div align="center">
        <form:form method="post" modelAttribute="crBean" 
        id="forms" enctype="multipart/form-data">       
            <table class="table" border="1" >
            <tr><td>
		<form:input type="text" path="memberId" id ="memberId" value="1"></form:input>
		</td>
		</tr>
                <tr>
                    <td>客服類別:</td>
                    <td>
                    <form:select path="crClass" id="crClass">
                    	<option>帳號相關</option>
                    	<option>交易相關</option>                    	
                    	<option>商品相關</option>
                    	<option>申請合作</option>
                    	<option>提議</option>
                    	<option>其他</option>
                    </form:select>                   										
                    </td>
                </tr>
                <tr>
                    <td>客服主題:</td>
                    <td>
                    <form:input type="text" placeholder="請輸入客服主題" path="crTitle" id="crTitle"></form:input>
                    </td>
                </tr>
                	<tr>
                    <td>客服內容:</td>
                    <td>
                    <form:input type="textarea" cols="30" rows="5" path="crContent" id="crContent"></form:input>
                    
                    </td>
                    <td>
                    <span id="num"></span>
                    </td>
                	</tr>
                     <tr>
                    <td>附件檔案:</td>
                    <td>
                    <input type="file" name="image" id="image">
                	</tr>
                	<tr>
				<td colspan="3">
					<img style="width:300px;height:200px;" id="preview_img" src="<c:url value='/image/CR2.jpg' />" />
					<span id="imgspan"></span>
				</td>
			</tr>
           <tr><td colspan="2" align="center">
            <input type="submit" value="送出表單" /> 
            <input type="reset" id='reset' value="重設" />
            <input type="button" id='cancel' value="取消申請"  onclick="return()"/>
            </td></tr>
       
 </table>
       </form:form> 
</div>

</section>
<script>
document.getElementById("crContent").change=function(){
	var length = document.getElementById("crContent").value.length;
	document.getElementById("num").innerHTML = length;
	};
</script>
</body>
</html>