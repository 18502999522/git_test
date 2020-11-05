<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

		option = {
			title: {
				text: '交易量'
			},
			tooltip: {
				trigger: 'axis',
				axisPointer: {
					type: 'cross',
					label: {
						backgroundColor: '#6a7985'
					}
				}
			},
			legend: {
				data: ${typeList}
			},
			toolbox: {
				feature: {
					saveAsImage: {}
				}
			},
			grid: {
				left: '3%',
				right: '4%',
				bottom: '3%',
				containLabel: true
			},
			xAxis: [
				{
					type: 'category',
					boundaryGap: false,
					data: ['1月', '2月', '3月', '4月','5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
				}
			],
			yAxis: [
				{
					type: 'value'
				}
			],
			series: [
				{
					name: '已有业务',
					type: 'line',
					stack: '总量',
					areaStyle: {},
					data: ${dataList[0]}
				},
				{
					name: '拓展业务',
					type: 'line',
					stack: '总量',
					areaStyle: {},
					data: ${dataList[1]}
				},
				{
					name: '新业务',
					type: 'line',
					stack: '总量',
					areaStyle: {},
					data: ${dataList[2]}
				}
			]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);


	}

</script>
</head>
<body>

		<div style="position: relative; left: 10px; top: -10px;">
			<div class="page-header">
				<h3>交易统计图</h3>
			</div>
		</div>



			<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
			<div id="main" style="width: 1000px;height:550px;"></div>




</body>
</html>