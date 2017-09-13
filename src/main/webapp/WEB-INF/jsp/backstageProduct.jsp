<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品管理</title>

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
					$.post('${pageContext.request.contextPath}/deleteProduct',
							{
								productId : row.productId
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
			url = '${pageContext.request.contextPath}/changeProduct?productId='
					+ row.productId;
		}
	}

	function newUser() {
		$('#dlg').dialog('open').dialog('setTitle', 'New User');
		$('#fm').form('clear');
		url = '${pageContext.request.contextPath}/addProduct';
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

	function type_formatter(val, row, index) {
		return row.type.typeName;
	}

</script>
</head>
<body>

	<table id="dg" title="商品信息" class="easyui-datagrid"
		url="showAllProduct" toolbar="#toolbar" rownumbers="true"
		fitColumns="true" singleSelect="true" pagination="true">

		<thead>
			<tr>
				<th field="productId" width="50">商品编号</th>
				<th field="productName" width="50">商品名</th>
				<th field="price" width="50">价格</th>
				<th field="describe" width="50">描述</th>
				<th field="inventory" width="50">库存</th>
				<th field="productPic" width="50">图片地址</th>
				<th field="type" width="50" formatter="type_formatter">类型对象</th>
			</tr>
		</thead>
	</table>

	<div id="toolbar">
		<a id="add" href="#" class="easyui-linkbutton" iconCls="icon-add"
			plain="true" onclick="newUser()">添加商品</a> <a href="#"
			class="easyui-linkbutton" iconCls="icon-edit" plain="true"
			onclick="editUser()">编辑商品</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true" onclick="destroyUser()">删除商品</a>
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 280px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">添加商品信息</div>
		<form id="fm" method="post">
			<div class="fitem">
				<label>商品名:</label> <input name="productName"
					class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>价格:</label> <input name="price" required="true"
					class="easyui-validatebox">
			</div>
			<div class="fitem">
				<label>描述:</label> <input name="describe" class="easyui-validatebox">
			</div>
			<div class="fitem">
				<label>库存:</label> <input name="inventory"
					class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>图片地址:</label> <input name="productPic"
					class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>类型id:</label> <input name="typeId" class="easyui-validatebox"
					required="true"> </input>
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