<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="${pageContext.request.contextPath}/js/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
<script type="text/javascript">

	window.onload = function(){

		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));

		// 指定图表的配置项和数据
		var option = {
			title: {
				text: '市场活动年统计图'
			},
			tooltip: {},
			legend: {
				data:['活动举办数量']
			},
			xAxis: {
				data: ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]
			},
			yAxis: {},
			series: [{
				name: '活动举办数量',
				type: 'bar',
				data: ${integerList}
			}]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);


	}

</script>
</head>
<body>

		<div style="position: relative; left: 10px; top: -10px;">
			<div class="page-header">
				<h3>市场活动统计图</h3>
			</div>
		</div>



			<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
			<div id="main" style="width: 1000px;height:550px;"></div>




</body>
</html>