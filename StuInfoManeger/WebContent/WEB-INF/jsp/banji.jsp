<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>班级信息</title>
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
			url : "${pageContext.request.contextPath }/banji/all",
			type : "get",
			dataType : "json",
			success : function(data) {
				setData(data);
			},
			error : function() {
				alert("false");
			}
		});
	}
	function findOne() {
		var cid = $("#classid").val();
		$.ajax({
			url : "${pageContext.request.contextPath }/banji/one",
			type : "post",
			data : JSON.stringify({
				id : cid
			}),
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			success : function(data) {
				setData2(data);
			},
			error : function() {
				alert("没有该班级");
			}
		});
	}
	function setData(data) {
		refresh();
		var tbody = document.getElementById("banjidata");
		for (var i = 0; i < data.length; i++) {
			var trow = getRow(data[i]);
			tbody.appendChild(trow);
		}
	}
	function setData2(data) {
		refresh();
		var tbody = document.getElementById("banjidata");
		var trow = getRow(data);
		tbody.appendChild(trow);
	}
	function getRow(banji) {
		var row = document.createElement("tr");

		var idCell = document.createElement("td");
		idCell.innerHTML = banji.id;
		row.appendChild(idCell);

		var classNameCell = document.createElement("td");
		classNameCell.innerHTML = banji.className;
		row.appendChild(classNameCell);

		var departmentCell = document.createElement("td");
		departmentCell.innerHTML = banji.department;
		row.appendChild(departmentCell);

		var studentNumberCell = document.createElement("td");
		studentNumberCell.innerHTML = banji.studentNumber;
		row.appendChild(studentNumberCell);

		return row;
	}
	function refresh() {
		var tbody = document.getElementById("banjidata");
		var trs = tbody.childNodes;
		for (var i = trs.length - 1; i >= 0; i--) {
			tbody.removeChild(trs[i]);
		}
	}
	function gotoAdd() {
		window.location.href = "${pageContext.request.contextPath}/banji/toAdd";
	}
</script>
</head>
<body>
	<div class="toolbar">
		<h2 style="display: inline-block">班级信息</h2>
		<div class="right-part">
			<input type="text" id="classid" /> <input type="button"
				value="按ID查找班级" onclick="findOne()" /> <input type="button"
				value="查询所有班级信息" onclick="findAll()" /> <input type="button"
				value="添加班级信息" onclick="gotoAdd()"> <a
				href="${pageContext.request.contextPath}/user/to_adm">返回</a>
		</div>
	</div>
	<div align="center">
		<table class="msg-table">
			<thead>
				<tr>
					<th colspan="4">班级信息表</th>
				<tr>
					<th>ID</th>
					<th>名称</th>
					<th>系别</th>
					<th>人数</th>
				</tr>
			</thead>
			<tbody id="banjidata">
			</tbody>
		</table>
	</div>

</body>
</html>