<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改学生信息</title>
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

.go-back {
	float: right;
	margin-top: 5px;
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
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function update() {
		var id = $("#id").val();
		var name = $("#name").val();
		var age = $("#age").val();
		var tel = $("#tel").val();
		var classId = $("#classId").val();
		var password = $("#password").val();

		$.ajax({
			url : "${pageContext.request.contextPath }/stu/updateInfo",
			type : "post",
			data : JSON.stringify({
				id : id,
				name : name,
				age : age,
				tel : tel,
				classId : classId,
				password : password
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "text",
			success : function(data) {
				if (data == "true") {
					alert("修改成功");
					gotoStuInfoPage();
				} else if(data == "false"){
					alert("修改失败");
					gotoStuInfoPage();
				}
			},
			error : function() {
				alert("error");
			}
		});
	}
	function gotoStuInfoPage() {
		window.location.href = "${pageContext.request.contextPath}/stu/toStudentPage";
	}
</script>
</head>
<body>
	<div class="toolbar">
		<h2 style="display: inline-block">修改学生信息</h2>
		<div class="go-back">
			<input type="button" value="返回" onclick="gotoStuInfoPage()" />
		</div>
	</div>
	<div align="center">
		<table class="msg-table">
			<thead>
				<tr>
					<th colspan="2">学生信息表</th>
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
					<td><input type="text" id="name" value="${student.name }" /></td>
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
					<td>班级Id：</td>
					<td><input type="text" id="classId"
						value="${student.classId }" /></td>
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
				<tr>
					<td>密码：</td>
					<td><input type="text" id="password" value="${user.password }" /></td>
				</tr>
				<!-- <tr>
				<td align="center"><input type="button" value="修改"
					onclick="update()" /></td>
				<td align="center"><input type="button" value="返回"
					onclick="gotoStuInfoPage()" /></td>
			</tr> -->
			</tbody>
		</table>
	</div>

	<div class="update-btn-div">
		<input class="update-btn" type="button" value="修改" onclick="update()" />
	</div>
</body>
</html>