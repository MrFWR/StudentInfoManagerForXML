<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登陆</title>
<style>
	body {
		background: url(${pageContext.request.contextPath}/images/background.jpg) center center no-repeat;
		background-size: cover;
	}
	.login-table td {
		padding-bottom: 10px;
	}
	.login-table, .login-table tr, td {
		border: none;
	}
	.white-text {
		color: #fff;
	}
	.input-box {
		height: 29px;
		line-height: 29px;
		border-radius: 10px;
		border: 1px solid #fff;
	}
	.login-btn {
		background: #00BFFF;
		border: 1px solid #00BFFF;
		font-size: 16px;
		font-weight: bold;
		color: #fff;
		padding: 6px;
		width: 100%;
		border-radius: 10px;
		cursor: pointer;
	}
	.login-btn:hover {
		background: #87CEFA	;
	}
	.mt-100 {
		margin-top: 100px;
	}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function login() {
		var id = $("#id").val();
		var password = $("#password").val();
		$.ajax({
			url : "${pageContext.request.contextPath }/user/login",
			type : "post",
			data : JSON.stringify({
				id : id,
				password : password
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "text",
			success : function(data) {
				if (data == "1") {
					toStuPage();
				} else if (data == "2") {
					toAdmPage();
				} else if (data == "false") {
					alert("密码错误");
				}
			},
			error : function() {
				alert("用户不存在");
			}
		});
	}
	function toStuPage() {
		window.location.href = "${pageContext.request.contextPath}/user/to_stu";
	}
	function toAdmPage() {
		window.location.href = "${pageContext.request.contextPath}/user/to_adm";
	}
</script>
</head>
<body>
	<h2 class="white-text mt-100" align="center">学生信息管理系统</h2>
	<table class="login-table white-text" align="center" border="1">
		<tr>
			<td>
				账号：
				<input class="input-box" type="text" id="id" />
			</td>
		</tr>
		<tr>
			<td>
				密码：
				<input class="input-box" type="password" id="password" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input class="login-btn" type="button" value="登   录" onclick="login()" />
			</td>
		</tr>
	</table>
</body>
</html>