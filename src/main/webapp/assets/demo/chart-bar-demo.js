// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example
var ctx = document.getElementById("myBarChart");

function minusMonth(i){
var today = new Date(); 
var month = today.getMonth();
today.setMonth(month-i);
return today.getMonth()+1+"월";
}

function getMonth(i) {
	function getMonth2(i) {
		var today = new Date(); 
		var month = today.getMonth();
		today.setMonth(month-i);
		var year = today.getFullYear();
		var month2 = today.getMonth()+1;
		var result = year+"/"+month2;
	
		return result	
	}
	
	var result = "";
	$.ajax({
			  type:'post',
			  url:'http://localhost:8081/ShoppingMall/MonthSales', 
			  async:false,
			  	data:{
			  		month:getMonth2(i),
			  		nextMonth:getMonth2(i-1)
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
  type: 'bar',
  data: {
    labels: [minusMonth(5), minusMonth(4), minusMonth(3), minusMonth(2), minusMonth(1), minusMonth(0)],
    datasets: [{
      label: "월 매출",
      backgroundColor: "rgba(2,117,216,1)",
      borderColor: "rgba(2,117,216,1)",
      data: [getMonth(5), getMonth(4), getMonth(3), getMonth(2), getMonth(1), getMonth(0)],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'month'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 6
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 2000000,
          maxTicksLimit: 5
        },
        gridLines: {
          display: true
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
