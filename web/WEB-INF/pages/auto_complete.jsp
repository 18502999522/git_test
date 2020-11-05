<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/bs_typeahead/bootstrap3-typeahead.min.js"></script>
	<script>
		$(function(){

			$("#typeahead").typeahead({

				//数据源
				source: function (value, process) {
					$.get("${pageContext.request.contextPath}/complete_data", function (data) {
						process(data);
					});
				},
				//欲显示的文本
				displayText:function(item){

					return "名称:" + item.deptName + ",id:" + item.deptId + ",code:" + item.deptCode;

				},
				//选中条目之后
				afterSelect: function (item) {

					return this.$element.val(item.deptName);

				},
				//高亮显示
				highlighter: function (item) {
					var regex = new RegExp( '(' + this.query + ')', 'gi' );
					return item.replace( regex, "<span style='color:red'>$1</span>" );
				},
				//延迟提示框出现的毫秒数
				delay: 1000,
				//最多显录的条目数
				items:8,
				//键入字数多少数目开始补全
				minLength: 1
			});
		});
	</script>

</head>
<body>

	<div>
		<h3>自动补全插件示例</h3>
	</div>


	<input id="typeahead" autocomplete="off"/>

</body>
</html>