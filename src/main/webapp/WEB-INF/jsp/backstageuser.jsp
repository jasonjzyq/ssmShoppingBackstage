<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="js/jquery-easyui-1.5.2/themes/default/easyui.css" />

<link rel="stylesheet" type="text/css"
	href="js/jquery-easyui-1.5.2/themes/icon.css" />

<script type="text/javascript"
	src="js/jquery-easyui-1.5.2/jquery.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>

<script type="text/javascript"
	src="js/jquery-easyui-1.5.2/easyloader.js"></script>

<script type="text/javascript"
	src="js/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>

<script>
	var url;
	var choose = 0;
	//查看所有用户
	$(function() {
		$('#dg').datagrid({
			url : 'showAllUsers',
			title : '用户列表',
			inconCls : 'icon-search',
			columns : [ [ {
				field : 'userId',
				title : '用户ID',
				width : '12%',
				align : 'center'
			}, {
				field : 'account',
				title : '账户',
				width : '13%',
				align : 'center'
			}, {
				field : 'password',
				title : '密码',
				width : '13%',
				align : 'center'
			}, {
				field : 'userName',
				title : '用户名',
				width : '12%',
				align : 'center'
			}, {
				field : 'sex',
				title : '用户性别',
				width : '12%',
				align : 'center'
			}, {
				field : 'tel',
				title : '电话',
				width : '13%',
				align : 'center'
			}, {
				field : 'email',
				title : '邮箱',
				width : '13%',
				align : 'center'
			}, {
				field : 'logo',
				title : '用户类型（代表状态）',
				width : '12%',
				align : 'center'
			} ] ],
			toolbar : '#toolbar',
			singleSelect : true
		});

		//点击跳出修改框
		$("#changeUserStatus").click(function() {

			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$('#dlg').dialog('open').dialog('setTitle', '修改用户状态');
				$('#fmedit').form('load', row);
			}
		})

		//点击保存事件
		$("#saveedit").click(function() {
			$.post("changeUserStatus", {
				account : $("#dlg").find("input[name='account']").val(),
				logo : $("#dlg").find("input[name='logo']").val()
			},function(result){
				if (result == "flase") {
					alert("请输入正确的状态码，1.普通用户，2.管理员，3.被锁定的用户");
				} else {
					alert("状态修改成功")
					$('#dlg').dialog('close'); // close the dialog
					$('#dg').datagrid('reload'); // reload the user data
				}
			},"text");
		})
	})
</script>
</head>
<body>
	<!-- 展示商品 -->
	<table id="dg"></table>

	<div id="toolbar">
		<a href="#" id="changeUserStatus" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">修改用户码</a>
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 280px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttonsedit">
		<form id="fmedit" method="post">
			<div class="fitem">
				<label>用户账户:</label> <input name="account"
					class="easyui-validatebox" type="text" readOnly="true">
			</div>
			<div class="fitem">
				<label>用户状态:</label> <input name="logo" class="easyui-validatebox"
					type="text">
			</div>
		</form>
	</div>

	<div id="dlg-buttonsedit">
		<a href="#" id="saveedit" class="easyui-linkbutton" iconCls="icon-ok">Save</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-cancel"
			onclick="javascript:$('#dlgedit').dialog('close')">Cancel</a>
	</div>



</body>

</html>