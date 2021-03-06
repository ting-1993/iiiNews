<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html><html lang="en">
<head>
    <meta charset="UTF-8">
    <title>聊天室</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/base/vendor.bundle.base.css">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@300;400&display=swap" rel="stylesheet">
<style type="text/css">
    .msg_board {
        width: 322px;
        height: 100px;
        border: solid 1px darkcyan;
        padding: 5px;
        overflow-y: scroll;
        // 文字長度大於div寬度時換行顯示
        word-break: break-all;
    }
    /*set srcoll start*/
    ::-webkit-scrollbar
    {
        width: 10px;
        height: 10px;
        background-color: #D6F2FD;
    }
    ::-webkit-scrollbar-track
    {
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
        /*border-radius: 5px;*/
        background-color: #D6F2FD;
    }
    ::-webkit-scrollbar-thumb
    {
        height: 20px;
        /*border-radius: 10px;*/
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
        background-color: #89D7F7;
    }
    /*set srcoll end*/
</style>
<body>

<jsp:include page="/fragment/navbar.jsp"></jsp:include>
<section style="margin-top:100px;">
<div class="card-body" align="center">
<label>房間名</label>
<input id="input_roomName" size="10" maxlength="10">
<input type="button"  value="進入聊天室" onclick="initWebSocket()" />
<input type="button" value="退出聊天室" onclick="closeWs()" /><br>
<div class="msg_board" style="text-align:left;"></div>
<input id="input_msg" size="43" maxlength="40">
<input type="button" value="傳送" onclick="send_msg()" />
</div>
</section>
</body>
<script type="text/javascript">
    var webSocket;

    function send_msg() {
        if (webSocket != null) {
            var input_msg = document.getElementById("input_msg").value.trim();
            if (input_msg == "") {
                return;
            }
            webSocket.send(input_msg);
            // 清除input框裡的資訊
            document.getElementById("input_msg").value = "";
        } else {
            alert("您已掉線，請重新進入聊天室...");
        }
    };

    function closeWs() {
        webSocket.close();
    };

    function initWebSocket() {
        var roomName = document.getElementById("input_roomName").value;
        // 房間名不能為空
        if (roomName == null || roomName == "") {
            alert("請輸入房間名");
            return;
        }
        if ("WebSocket" in window) {
//            alert("您的瀏覽器支援 WebSocket!");
            if (webSocket == null) {
                var url = "ws://localhost:8080/iiiNews/webSocket/chat/" + roomName;
                // 開啟一個 web socket
                webSocket = new WebSocket(url);
            } else {
                alert("您已進入聊天室...");
            }

            webSocket.onopen = function () {
                alert("已進入聊天室");
            };

            webSocket.onmessage = function (evt) {
                var msg_board = document.getElementsByClassName("msg_board")[0];
                var received_msg = evt.data;
                var old_msg = msg_board.innerHTML;
                msg_board.innerHTML= old_msg + received_msg +"<br>";
                // 讓滾動塊往下移動
                msg_board.scrollTop = msg_board.scrollTop + 40;
            };

            webSocket.onclose = function () {
                // 關閉 websocket，清空資訊板
                alert("連線已關閉...");
                webSocket = null;
                document.getElementsByClassName("msg_board")[0].innerHTML = "";
            };
        }
        else {
            // 瀏覽器不支援 WebSocket
            alert("您的瀏覽器不支援 WebSocket!");
        }
    }
</script>
</html>