/**
 * 
 */

// 所有分类框鼠标放上使内容呈现
$(function() {

	$(function() {
		$("#ai-topsearch").click(function() {
			$.post("../ProSerchServlet", {
				"pName" : $("#searchInput").val()
			}, function() {
				window.location.href = 'search.jsp';
			});
		})
	})

	$(".ml-22").parent().mouseover(
			function() {
				var s = $(this).find("a").text();
				$.post("../IndexAllCategoriesServlet", {
					indexAllCategories : s
				}, function(result) {
					$("a:contains('" + s + "')").parent().parent().next().find(
							".sort-side").children().remove();
					$("a:contains('" + s + "')").parent().parent().next().find(
							".sort-side").append(
							"<dl class='dl-sort'><dt><span title='" + s + "'>"
									+ s + "</span></dt></dl>");
					$.each(result, function(i, list) {
						$("a:contains('" + s + "')").parent().parent().next()
								.find(".sort-side").find("dt").after(
										"<dd><a title='" + list.typeName
												+ "' href='#'><span>"
												+ list.typeName
												+ "</span></a></dd>");
					})

					// 发送数据到ProSerchServlet
					$(".sort-side dd").click(function() {
						$.post("../ProSerchServlet", {
							"pName" : $(this).text()
						}, function() {
							window.location.href = 'search.jsp';
						});
					});
				}, "json")
			})

})
