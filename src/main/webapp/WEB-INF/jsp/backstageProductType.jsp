<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品类型管理</title>

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
	function destroyUser() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$.messager.confirm('Confirm', '你真的要删除萌萌哒的我吗?', function(r) {
				if (r) {
					$.post('${pageContext.request.contextPath}/deleteType', {
						typeId : row.typeId
					}, function(result) {
						if (result.success) {
							$('#dg').datagrid('reload'); // reload the user data
						} else {
							$.messager.show({ // show error message
								title : 'Error',
								msg : result.errorMsg
							});
						}
					}, 'json');
				}
			});
		}
	}

	function editUser() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$('#dlg').dialog('open').dialog('setTitle', 'Edit User');
			$('#fm').form('load', row);
			url = '${pageContext.request.contextPath}/changeType?typeId='
					+ row.typeId;
		}
	}

	function newUser() {
		$('#dlg').dialog('open').dialog('setTitle', 'New User');
		$('#fm').form('clear');
		url = '${pageContext.request.contextPath}/addType';
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
		url="showAllType" toolbar="#toolbar" rownumbers="true"
		fitColumns="true" singleSelect="true">
		<thead>
			<tr>
				<th field="typeId" width="50">类型编号</th>
				<th field="typeName" width="50">类型名</th>
				<th field="parentType" width="50">父类型</th>
			</tr>
		</thead>
	</table>

	<div id="toolbar">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			onclick="newUser()">添加商品类型</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="editUser()">编辑商品类型</a> <a
			href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
			onclick="destroyUser()">删除商品类型</a>
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 280px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">修改商品类型</div>
		<form id="fm" method="post">
			<div class="fitem">
				<label>类型Id:</label> <input name="typeId" required="true"
					class="easyui-validatebox">
			</div>
			<div class="fitem">
				<label>类型名:</label> <input name="typeName" required="true"
					class="easyui-validatebox">
			</div>
			<div class="fitem">
				<label>父类型:</label> <input name="parentType"
					class="easyui-validatebox">
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