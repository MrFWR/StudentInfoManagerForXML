<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生信息</title>
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

.update-btn-div {
	text-align: center;
	margin-top: 20px;
}

.update-btn {
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

.log-off {
	float: right;
	height: 31px;
	line-height: 31px;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function update() {
		var id = $("#id").val();
		var age = $("#age").val();
		var tel = $("#tel").val();
		$.ajax({
			url : "${pageContext.request.contextPath }/stu/update",
			type : "post",
			data : JSON.stringify({
				id : id,
				age : age,
				tel : tel
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "text",
			success : function(data) {
				if (data == "true") {
					alert("修改成功");
					reflesh();
				} else {
					alert("修改失败");
					reflesh()
				}
			},
			error : function() {
				alert("error");
			}
		});
	}
	function reflesh() {
		window.location.href = "${pageContext.request.contextPath}/user/to_stu";
	}
</script>
</head>
<body>
	<div class="toolbar">
		<h2 style="display: inline-block">学生信息</h2>
		<div class="log-off">
			<a href="${pageContext.request.contextPath}/user/logout">注销</a>
		</div>
	</div>
	<div align="center">
		<table class="msg-table">
			<thead>
				<tr>
					<th colspan="2">学生个人信息表</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>学号：</td>
					<td><input type="text" id="id" value="${student.id }"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td>姓名：</td>
					<td><input type="text" id="name" value="${student.name }"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td><input type="text" id="sex" value="${student.sex }"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td>年龄：</td>
					<td><input type="number" id="age" value="${student.age }" /></td>
				</tr>
				<tr>
					<td>班级：</td>
					<td><input type="text" value="${banji.className }"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td>系别：</td>
					<td><input type="text" value="${banji.department }"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td>手机号码：</td>
					<td><input type="tel" id="tel" value="${student.tel }" /></td>
				</tr>
				<!-- <tr>
				<td align="center"><input type="button" value="修改"
					onclick="update()" /></td>
					<td>
						<a href="${pageContext.request.contextPath}/user/logout">注销</a>
					</td>
			</tr> -->
			</tbody>
		</table>
	</div>

	<div class="update-btn-div">
		<input class="update-btn" type="button" value="修改" onclick="update()" />
	</div>
</body>
</html>