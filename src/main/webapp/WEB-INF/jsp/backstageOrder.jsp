<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理</title>

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
	function editUser() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$('#dlg').dialog('open').dialog('setTitle', 'Edit User');
			$('#fm').form('load', row);
			url = '${pageContext.request.contextPath}/changeOrder?orderId='
					+ row.orderId;
		}
	}

	function saveUser() {
		$('#fm').form('submit', {
			url : url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success : function(result) {
				if (result.errorMsg) {
					$.messager.show({
						title : 'Error',
						msg : result.errorMsg
					});
				} else {
					$('#dlg').dialog('close'); // close the dialog
					$('#dg').datagrid('reload'); // reload the user data
				}
			}
		});
	}
</script>
</head>
<body>

	<table id="dg" title="My Users" class="easyui-datagrid"
		url="showAllOrder" toolbar="#toolbar" rownumbers="true"
		fitColumns="true" singleSelect="true">
		<thead>
			<tr>
				<th field="orderId" width="50">订单编号</th>
				<th field="userId" width="50">用户编号</th>
				<th field="addressId" width="50">地址编号</th>
				<th field="orderDate" width="50">订单日期</th>
				<th field="orderStatus" width="50">订单状态</th>
			</tr>
		</thead>
	</table>

	<div id="toolbar">
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
			onclick="editUser()">修改订单状态</a>
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 280px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">修改订单状态</div>
		<form id="fm" method="post">
			<div class="fitem">
				<label>订单编号:</label> <input name="orderId"
					class="easyui-validatebox" required="true" readonly="readonly">
			</div>
			<div class="fitem">
				<label>用户编号:</label> <input name="userId" required="true"
					class="easyui-validatebox" readonly="readonly">
			</div>
			<div class="fitem">
				<label>地址编号:</label> <input name="addressId" class="easyui-validatebox" readonly="readonly">
			</div>
			<div class="fitem">
				<label>订单日期:</label> <input name="orderDate"
					class="easyui-validatebox" required="true" readonly="readonly">
			</div>
			<div class="fitem">
				<label>订单状态:</label> <input name="orderStatus"
					class="easyui-validatebox" required="true" >
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="saveUser()">Save</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
	</div>

</body>

</html>