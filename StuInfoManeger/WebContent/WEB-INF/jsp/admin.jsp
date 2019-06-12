<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员页面</title>
<style>
	* {
		margin: 0;
		padding: 0;
	}
	body {
		background: url(${pageContext.request.contextPath}/images/background.jpg) center center no-repeat;
		background-size: cover;
	}
	.toolbar {
		background: #EBEBEB;
		padding: 10px;
		text-align: center;
	}
	.btn-table {
		margin: 20px auto;
	}
	.btn-table td {
		padding: 10px;
		text-align: center;
	}
	.btn-table td:hover {
		color: #87CEFA;
	}
	.check-box {
		cursor: pointer;
		background: #fff;
		padding: 10px;
		border-radius: 10px;
		color: #00BFFF;
	}
	.check-box:hover {
		color: #87CEFA;
	}
	.check-btn {
		width: 150px;
		height: 150px;
		margin-bottom: 10px;
	}
	.class-btn {
		background: url('${pageContext.request.contextPath}/images/class-1.png') center center no-repeat;
		background-size: contain;
	}
	.student-btn {
		background: url('${pageContext.request.contextPath}/images/student-1.png') center center no-repeat;
		background-size: contain;
	}
	.logout-btn {
		background: url('${pageContext.request.contextPath}/images/logout-1.png') center center no-repeat;
		background-size: contain;
	}
	.check-box:hover .class-btn {
		background: url('${pageContext.request.contextPath}/images/class-2.png') center center no-repeat;
		background-size: contain;
	}
	.check-box:hover .student-btn {
		background: url('${pageContext.request.contextPath}/images/student-2.png') center center no-repeat;
		background-size: contain;
	}
	.check-box:hover .logout-btn {
		background: url('${pageContext.request.contextPath}/images/logout-2.png') center center no-repeat;
		background-size: contain;
	}
</style>
<script>
	function gotoBanjiPage() {
		window.location.href = "${pageContext.request.contextPath}/banji/to_banjiPage";
	}
	function gotoStudentPage() {
		window.location.href = "${pageContext.request.contextPath}/stu/toStudentPage";
	}
	function logout() {
		window.location.href = "${pageContext.request.contextPath}/user/logout";
	}
</script>
</head>
<body>
	<div class="toolbar">
		<h2 style="display: inline-block">管理员页面</h2>
	</div>
	<table class="btn-table">
		<tbody>
			<tr>
				<td>
					<div class="check-box" onclick="gotoBanjiPage()">
						<div class="check-btn class-btn"></div>
						<h3>班级信息管理</h3>
					</div>
				</td>
				<td>
					<div class="check-box" onclick="gotoStudentPage()">
						<div class="check-btn student-btn"></div>
						<h3>学生信息管理</h3>
					</div>
				</td>
				<td>
					<div class="check-box" onclick="logout()">
						<div class="check-btn logout-btn"></div>
						<h3>注销</h3>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	<!-- <a href="${pageContext.request.contextPath}/banji/to_banjiPage">班级信息管理</a>
	<a href="${pageContext.request.contextPath}/stu/toStudentPage">学生信息管理</a>
	<a href="${pageContext.request.contextPath}/user/logout">注销</a> -->
</body>
</html>