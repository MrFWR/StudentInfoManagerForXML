<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加班级</title>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background:
		url(${pageContext.request.contextPath}/images/background.jpg) center
		center no-repeat;
	background-size: cover;
}

.toolbar {
	background: #EBEBEB;
	padding: 10px;
	text-align: center;
}

.add-btn-div {
	text-align: center;
	margin-top: 20px;
}

.add-btn {
	padding: 3px 10px;
	cursor: pointer;
}

.msg-table {
	width: 1268px;
	margin: 10 auto 0 auto;
	border: none;
	text-align: center;
}

.msg-table th, td {
	background: #EBEBEB;
	border: 1px solid #fff;
	padding: 5px;
}

.go-back {
	float: right;
	margin-top: 5px;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function add() {
		var id = $("#id").val();
		var className = $("#className").val();
		var department = $("#department").val();
		var studentNumber = $("#studentNumber").val();
		$.ajax({
			url : "${pageContext.request.contextPath}/banji/add",
			type : "post",
			data : JSON.stringify({
				id : id,
				className : className,
				department : department,
				studentNumber : studentNumber
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "text",
			success : function(data) {
				if (data == "true") {
					alert("添加成功！");
					gotoBanjiPage();
				} else {
					alert("班级ID已存在！");
				}

			},
			error : function() {
				alert("error");
			}
		});
	}
	function gotoBanjiPage() {
		window.location.href = "${pageContext.request.contextPath}/banji/to_banjiPage";
	}
</script>
</head>
<body>
	<div class="toolbar">
		<h2 style="display: inline-block">添加班级</h2>
		<div class="go-back">
			<input type="button" value="返回" onclick="gotoBanjiPage()" />
		</div>
	</div>
	<div align="center">
		<table class="msg-table">
			<thead>
				<tr>
					<th colspan="4">添加班级信息</th>
			</thead>
			<tbody id="banjidata">
				<tr>
					<td>班级ID：</td>
					<td><input type="text" id="id" /></td>
				</tr>
				<tr>
					<td>班级名称：</td>
					<td><input type="text" id="className" /></td>
				</tr>
				<tr>
					<td>系别：</td>
					<td><input type="text" id="department" /></td>
				</tr>
				<tr>
					<td>人数：</td>
					<td><input type="number" id="studentNumber" /></td>
				</tr>
				<!-- <tr>
				<td align="center"><input type="button" value="添加"
					onclick="add()" /></td>
				<td><input type="button" value="返回" onclick="gotoBanjiPage()" /></td>
			</tr> -->
			</tbody>
		</table>
	</div>

	<div class="add-btn-div">
		<input class="add-btn" type="button" value="添加" onclick="add()" />
	</div>
</body>
</html>