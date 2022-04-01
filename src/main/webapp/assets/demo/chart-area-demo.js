// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example
var ctx = document.getElementById("myAreaChart");

function minusDay(i){
var today = new Date(); 
var day = today.getDate();
today.setDate(day-i);
return today.getMonth()+1+"/"+today.getDate();
}

function daily(i) {
	function daily2(i) {
		var today = new Date();
		var day = today.getDate();
		today.setDate(day-i);
		var year = today.getFullYear();
		var result = year+"/"+minusDay(i)
	
		return result	
	}
	
	var result = "";
	$.ajax({
			  type:'post',
			  url:'DailySales', 
			  async:false,
			  	data:{
			  		day:daily2(i),
			  		tom:daily2(i-1)
					  }, 
			  success: function(data){
			  	result = data;
			  },
			  error : function() {
				alert("오류 발생");
			  }
			});
	return result		
}		

var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: [minusDay(12), minusDay(11), minusDay(10), minusDay(9), minusDay(8), minusDay(7), minusDay(6), minusDay(5), minusDay(4), minusDay(3), minusDay(2), minusDay(1), minusDay(0)],
    datasets: [{
      label: "일 매출",
      lineTension: 0.3,
      backgroundColor: "rgba(2,117,216,0.2)",
      borderColor: "rgba(2,117,216,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [daily(12) , daily(11), daily(10), daily(9), daily(8), daily(7), daily(6), daily(5), daily(4), daily(3), daily(2), daily(1), daily(0)],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 1000000,
          maxTicksLimit: 5
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
