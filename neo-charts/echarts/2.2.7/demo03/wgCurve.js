/*
<script language="javascript">
   document.write("<script type='text\/javascript' src='..\/js\/echarts.js' ><\/script>");
	 document.write("<script type='text\/javascript' src='..\/js\/echarts-2.2.7\/doc\/asset\/js\/jquery.min.js'><\/script>");
</script>
*/


// 路径配置
require.config({
	paths: {
			"jquery": "./jquery.min",
			"echarts": "./"
    }
});

// 使用
require(
		[
    		"echarts",
    		"echarts/chart/bar" // 使用柱状图就加载bar模块，按需加载
    ],
    function (ec) {
        // 基于准备好的dom，初始化echarts图表
        var myChart = ec.init(document.getElementById('chart'));

				//图表显示提示信息
				myChart.showLoading({
					text: "图表数据正在努力加载..."
				});
				
				var options = {

						title: {
							text: "异步数据加载示例",
							subtext: "www.stepday.com",
							sublink: "http://www.stepday.com/myblog/?Echarts"
						},

						tooltip: {
							trigger: 'axis'
						},

						legend: {
							data: ['销量']
						},

						toolbox: {
							show: true,
							feature: {
									mark: false
							}
						},

						calculable: true,

						xAxis: [{
								type: 'category',
								data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
						}],
						
						yAxis: [{
								type: 'value',
								splitArea: { show: true }
						}],
						
						series: [{
							name:'销量',
        			type:'bar',
        			data: [5, 20, 36, 10, 10, 20]	
						}]

				};
				
				myChart.setOption(options);

        myChart.hideLoading();
        $.get("data1.json").done(function (result) {
        	options.xAxis[0].data = result.categories; //["苹果","苹果","苹果","苹果","苹果","苹果"];   
        	options.series.data = [500,280,386,190,107,207];  //result.power; 
        	//options.legend.data = result.legend;
        	
        	myChart.setOption(options);
        	
				});
				

				//alert("read end");
				
				 /*
        $.get('data1.json').done(function (wgdata) {
        	myChart.setOption({
        		title: {
        			text:'异步数据加载示例'
        		},
        		tooltip: {},
        		legend: {
        			data:['销量']
        		},
        		xAxis: {
        			data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
        		},
        		yAxis: {},
        		series:[{
        			name:'销量',
        			type:'bar',
        			data: [5, 20, 36, 10, 10, 20]
        			}]
        	});
				});
				*/
			  
    }
);


