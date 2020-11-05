<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				text: '线索数量统计图',
				subtext: '',
				left: 'center'
			},
			tooltip: {
				trigger: 'item',
				formatter: '{a} <br/>{b} : {c} ({d}%)'
			},
			legend: {
				orient: 'vertical',
				left: 'left',
				data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
			},
			series: [
				{
					name: '数量',
					type: 'pie',
					radius: '55%',
					center: ['50%', '60%'],
					data:

					[
					   <c:forEach varStatus="vs" var="data" items="${integerList}">
						{value: ${data}, name: '${vs.count}月'}${!vs.last ? ",":""}
						</c:forEach>
					]
					,
					emphasis: {
						itemStyle: {
							shadowBlur: 10,
							shadowOffsetX: 0,
							shadowColor: 'rgba(0, 0, 0, 0.5)'
						}
					}
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
				<h3>线索统计图</h3>
			</div>
		</div>



			<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
			<div id="main" style="width: 1000px;height:550px;"></div>




</body>
</html>