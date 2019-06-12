<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加学生信息</title>
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
	text-align: center;
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
		var name = $("#name").val();
		var age = $("#age").val();
		var tel = $("#tel").val();
		var classId = $("#classId").val();
		var password = $("#password").val();
		var sex = $("#sex").val();
		$.ajax({
			url : "${pageContext.request.contextPath }/stu/addStuInfo",
			type : "post",
			data : JSON.stringify({
				id : id,
				name : name,
				age : age,
				tel : tel,
				classId : classId,
				password : password,
				sex : sex
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "text",
			success : function(data) {
				if (data == "true") {
					alert("添加成功");
					gotoStuInfo();
				} else {
					alert("添加失败");
					gotoStuInfo();
				}
			},
			error : function() {
				alert("error");
			}
		});
	}
	function gotoStuInfo() {
		window.location.href = "${pageContext.request.contextPath}/stu/toStudentPage";
	}
</script>
</head>
<body>
	<div class="toolbar">
		<h2 style="display: inline-block">添加学生信息</h2>
		<div class="go-back">
			<input type="button" value="返回" onclick="gotoStuInfo()" />
		</div>
	</div>
	<div align="center">
		<table class="msg-table">
			<thead>
				<tr>
					<th colspan="7">学生信息表</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>学号：</td>
					<td><input type="text" id="id" /></td>
				</tr>
				<tr>
					<td>姓名：</td>
					<td><input type="text" id="name" /></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td><input type="text" id="sex" /></td>
				</tr>
				<tr>
					<td>年龄：</td>
					<td><input type="number" id="age" /></td>
				</tr>
				<tr>
					<td>班级Id：</td>
					<td><input type="text" id="classId" /></td>
				</tr>
				<tr>
					<td>手机号码：</td>
					<td><input type="tel" id="tel" /></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="text" id="password" /></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="add-btn-div">
		<input class="add-btn" type="button" value="添加" onclick="add()" />
	</div>
</body>
</html>