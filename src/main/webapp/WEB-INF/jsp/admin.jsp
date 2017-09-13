<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>

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
	function addTab(title, url) {
		if ($('#tt').tabs('exists', title)) {
			$('#tt').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src="'
					+ url + '" style="width:100%;height:100%;"></iframe>';
			$('#tt').tabs('add', {
				title : title,
				content : content,
				closable : true
			});
		}
	}
</script>
</head>
<body>

	<div style="margin-bottom: 10px">
		<a href="#" class="easyui-linkbutton"
			onclick="addTab('用户','${pageContext.request.contextPath}/backstageuser')">用户</a>
		<a href="#" class="easyui-linkbutton"
			onclick="addTab('商品','${pageContext.request.contextPath}/backstageProduct')">商品</a>
		<a href="#" class="easyui-linkbutton"
			onclick="addTab('商品类型','${pageContext.request.contextPath}/backstageProductType')">商品类型</a>
		<a href="#" class="easyui-linkbutton"
			onclick="addTab('订单','${pageContext.request.contextPath}/backstageOrder')">订单</a>
	</div>
	<div id="tt" class="easyui-tabs" style="width: 100%; height: 700px;"></div>

</body>

</html>