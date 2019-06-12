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

.right-part {
	float: right;
	height: 31px;
	line-height: 31px;
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
	function findAll() {
		$.ajax({
			url : "${pageContext.request.contextPath}/stu/all",
			type : "post",
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			success : function(stuinfos) {
				setData(stuinfos);
			},
			error : function() {
				alert("error");
			}
		});
	}
	function findById() {
		var id = $("#id").val();
		$.ajax({
			url : "${pageContext.request.contextPath}/stu/id",
			type : "post",
			data : JSON.stringify({
				id : id
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			success : function(stuinfo) {
				if (stuinfo != null) {
					setDataOne(stuinfo);
				} else {
					alert("查无此人");
				}
			},
			error : function() {
				alert("error");
			}
		});
	}
	function setData(stuinfos) {
		refresh();
		var tbody = document.getElementById("studata");
		for (var i = 0; i < stuinfos.length; i++) {
			var student = stuinfos[i].student;
			var banji = stuinfos[i].banji;
			var user = stuinfos[i].user;
			var trow = getRow(student, banji, user);
			tbody.appendChild(trow);
		}
	}
	function setDataOne(stuinfo) {
		refresh();
		var tbody = document.getElementById("studata");
		var student = stuinfo.student;
		var banji = stuinfo.banji;
		var user = stuinfo.user;
		var trow = getRow(student, banji, user);
		tbody.appendChild(trow);
	}
	function getRow(student, banji, user) {
		var row = document.createElement("tr");

		var stuIdCell = document.createElement("td");
		stuIdCell.innerHTML = student.id;
		row.appendChild(stuIdCell);

		var stuNameCell = document.createElement("td");
		stuNameCell.innerHTML = student.name;
		row.appendChild(stuNameCell);

		var sexCell = document.createElement("td");
		sexCell.innerHTML = student.sex;
		row.appendChild(sexCell);

		var ageCell = document.createElement("td");
		ageCell.innerHTML = student.age;
		row.appendChild(ageCell);

		var telCell = document.createElement("td");
		telCell.innerHTML = student.tel;
		row.appendChild(telCell);

		var classIdCell = document.createElement("td");
		classIdCell.innerHTML = student.classId;
		row.appendChild(classIdCell);

		var classNameCell = document.createElement("td");
		classNameCell.innerHTML = banji.className;
		row.appendChild(classNameCell);

		var departmentCell = document.createElement("td");
		departmentCell.innerHTML = banji.department;
		row.appendChild(departmentCell);

		var passwordCell = document.createElement("td");
		passwordCell.innerHTML = user.password;
		row.appendChild(passwordCell);

		var updateCell = document.createElement("td");
		updateCell.innerHTML = "<a href='${pageContext.request.contextPath}/stu/to_updateInfo?id="
				+ student.id + "'>修改学生信息</a>";
		row.appendChild(updateCell);

		var deletCell = document.createElement("td");
		deletCell.innerHTML = "<a href='${pageContext.request.contextPath}/stu/deleteById?id="
				+ student.id + "'>删除</a>";
		row.appendChild(deletCell);

		return row;
	}
	function refresh() {
		var tbody = document.getElementById("studata");
		var trs = tbody.childNodes;
		for (var i = trs.length - 1; i >= 0; i--) {
			tbody.removeChild(trs[i]);
		}
	}
	function toAddStuInfo() {
		window.location.href = "${pageContext.request.contextPath}/stu/toAddStuInfo";
	}
</script>
</head>
<body>
	<div class="toolbar">
		<h2 style="display: inline-block">学生信息</h2>
		<div class="right-part">
			<input type="text" id="id" /> <input type="button" value="按学号查找学生"
				onclick="findById()" /> <input type="button" value="查询所有学生信息"
				onclick="findAll()" /> <input type="button" value="添加学生信息"
				onclick="toAddStuInfo()" /> <a
				href="${pageContext.request.contextPath}/user/to_adm">返回</a>
		</div>
	</div>
	<div align="center">
		<table class="msg-table">
			<thead>
				<tr>
					<th colspan="11">学生信息表</th>
				</tr>
				<tr>
					<th>学号</th>
					<th>姓名</th>
					<th>性别</th>
					<th>年龄</th>
					<th>手机号码</th>
					<th>班级Id</th>
					<th>班级名称</th>
					<th>系别</th>
					<th>密码</th>
					<th>修改操作</th>
					<th>删除操作</th>
				</tr>
			</thead>
			<tbody id="studata">
			</tbody>
		</table>
	</div>

</body>
</html>