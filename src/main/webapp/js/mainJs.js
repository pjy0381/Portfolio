function check_id() {
	var id = document.getElementsByName("id")[0].value;
	opener.document.all.id.value = id;
	window.close();
}

function select(zipcode, address) {
	opener.document.all.nAd.value = zipcode;
	opener.document.all.address.value = address;
	window.close();
}
function check_reg(){
	var pw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

	if(document.getElementsByName("id")[0].value.length==0){
		alert("아이디를 입력하세요");
		document.getElementsByName("id")[0].focus();
	}else if(!pw.test(document.getElementsByName("password")[0].value)){
		alert("패스워드를 입력하세요(8~16자리/특수문자 포함)");
		document.getElementsByName("password")[0].focus();
	}else if(document.getElementsByName("chkPw")[0].value.length==0){
		alert("패스워드를 확인하세요");
		document.getElementsByName("chkPw")[0].focus();
	}else if(document.getElementsByName("name")[0].value.length==0){
		alert("이름을 입력하세요");
		document.getElementsByName("name")[0].focus();
	}else if(document.getElementsByName("phone")[0].value.length==0){
		alert("전화번호를 입력하세요");
		document.getElementsByName("phone")[0].focus();
	}else if(document.getElementsByName("nAd")[0].value.length==0){
		alert("주소를 입력하세요");
		document.getElementsByName("nAd")[0].focus();
	}else if(document.getElementsByName("dAd")[0].value.length==0){
		alert("상세주소를 입력하세요");
		document.getElementsByName("dAd")[0].focus();
	}else if(document.getElementsByName("password")[0].value!=document.getElementsByName("chkPw")[0].value) {
		alert("패스워드를 확인하세요");
		document.getElementsByName("chkPw")[0].focus();
	}else{
		reg.submit();
	}
}
function myPage(){
my.submit();
}

function newP(){
	var pw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	
	if(!pw.test(document.getElementsByName("password")[0].value)){
		alert("패스워드를 입력하세요");
		document.getElementsByName("password")[0].focus();
	}else if(document.getElementsByName("chkPw")[0].value.length==0){
		alert("패스워드를 확인하세요");
		document.getElementsByName("chkPw")[0].focus();
	}else if(document.getElementsByName("password")[0].value!=document.getElementsByName("chkPw")[0].value) {
		alert("패스워드를 확인하세요");
		document.getElementsByName("chkPw")[0].focus();
	}else{
		newPW.submit();
	}
}

function modP(){
	var pw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	
	if(!pw.test(document.getElementsByName("password")[0].value)){
		alert("패스워드를 입력하세요");
		document.getElementsByName("password")[0].focus();
	}else if(document.getElementsByName("chkPw")[0].value.length==0){
		alert("패스워드를 확인하세요");
		document.getElementsByName("chkPw")[0].focus();
	}else if(document.getElementsByName("password")[0].value!=document.getElementsByName("chkPw")[0].value) {
		alert("패스워드를 확인하세요");
		document.getElementsByName("chkPw")[0].focus();
	}else{
		alert("수정완료를 눌러주세요");
		opener.document.all.password.value = document.getElementsByName("password")[0].value;
		window.close();
	}
}
function openPopup(link) {
 	var url = link
 
    var _width = '500';
    var _height = '300';
 
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/4); 
 
    window.open(url, 'popup-test', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
 
}
function openPopupA(link) {
 	var url = link
 
    var _width = '504';
    var _height = '688';
 
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/4); 
 
    window.open(url, 'popup-test', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
 
}

function ckId() {
		var _id=$("#_id").val();
		if(_id.length!=0){
		$.ajax({
			  type:'get',
			  url:'http://localhost:8081/ShoppingMall/IdChk',
			  data:{
				  id:_id,
				  }, 
			  async:true,
			  success: function(data){
			  	if(data=="yes"){
			  		 $("#chkId").text("사용 가능").css("color","blue");
			  	}else{
			  		$("#chkId").text("사용 불가능").css("color","red");
				  	}
			  },
			  error : function() {
				alert("실패");
			  }
			});
			}else{
				$("#chkId").text("필수 정보입니다.").css("color","red");
			}
	}
	
function ckPw(){
	$("#chkPw2").text("");
	var pw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	if(document.getElementsByName("password")[0].value.length==0){
		$("#chkPw").text("필수 정보입니다.").css("color","red");;
	}else if(!pw.test(document.getElementsByName("password")[0].value)){
		$("#chkPw").text("사용 불가능").css("color","red");
	}else{
		$("#chkPw").text("사용 가능").css("color","blue");
	}
}

function checkPw() {
	if(document.getElementsByName("chkPw")[0].value.length==0){
		$("#chkPw2").text("필수 정보입니다.").css("color","red");;
	}else if (document.getElementsByName("password")[0].value == document.getElementsByName("chkPw")[0].value) {
		$("#chkPw2").text("일치").css("color","blue");
	}else{
		$("#chkPw2").text("불일치").css("color","red");
	}
}

function checkName() {
	if(document.getElementsByName("chkPw")[0].value.length==0){
		$("#chkName").text("필수 정보입니다.").css("color","red");;
	}else{
		$("#chkName").text("")
	}
}

function modify(f) {
	var _id=$("#_id").val();
	var _pw=$("#_"+f).val();
	
	$.ajax({
			  type:'post',
			  url:'http://localhost:8081/ShoppingMall/Modify',
			  data:{
				  id:_id,
				  newInfo:_pw,
				  mod:f
				  }, 
			  async:true,
			  success: function(data){
			  	alert(data);
			  	location.reload();
			  },
			  error : function() {
				alert("수정 실패");
			  }
			});
}
function modifyA() {
	var _id=$("#_id").val();
	var _nAd=$("#_nAd").val();
	var _dAd=$("#_dAd").val();
	var _address=$("#_address").val();
	
	$.ajax({
			  type:'post',
			  url:'http://localhost:8081/ShoppingMall/Modify',
			  data:{
				  id:_id,
				  nAd:_nAd,
				  dAd:_dAd,
				  address:_address
				  }, 
			  async:true,
			  success: function(data){
			  	alert(data);
			  },
			  error : function() {
				alert("수정 실패");
			  }
			});
}
function descSearch() {
	var _color=$("#_color").val();
	
	$.ajax({
			  type:'get',
			  url:'http://localhost:8081/ShoppingMall/DescP',
			  data:{
				  color:_color,
				  }, 
			  async:true,
			  success: function(data){
			  	var arr = data		
			  	alert(arr);
			  	location.reload();
			  },
			  error : function() {
				alert("수정 실패");
			  }
			});
}

function totalR(i) {
	
	$.ajax({
			  type:'get',
			  url:'http://localhost:8081/ShoppingMall/Reviews?id='+i, 
			  async:true,
			  success: function(data){
				  	$("#"+i).text("("+data+")");
			  },
			  error : function() {
				alert("수정 실패");
			  }
			});
}
function avgG(i) {
	
	$.ajax({
			  type:'get',
			  url:'http://localhost:8081/ShoppingMall/ProductG?id='+i, 
			  async:true,
			  success: function(data){
				  	return data;
			  },
			  error : function() {
				alert("수정 실패");
			  }
			});
}

function addBasket(i) {
	var _size=$("#_size").val();
	var _quantity=$("#_quantity").val();
	
	if(_size=="사이즈 선택"){
		alert("사이즈를 선택해주세요.");
	}else{
	if(_quantity>0){
	$.ajax({
			  type:'post',
			  url:'http://localhost:8081/ShoppingMall/Basket', 
			  async:true,
			  data:{
				  size:_size,
				  quantity:_quantity,
				  id:i
				  }, 
			  success: function(data){
				  	alert("장바구니에 추가되었습니다.")
				  	$('.header').load(location.href+' .header');
			  },
			  error : function() {
				alert("오류 발생");
			  }
			});
			}else{
				alert("0개는 주문할 수 없습니다.")
			}
		}
			
}

function dropBasket(i) {
	
	$.ajax({
			  type:'get',
			  url:'http://localhost:8081/ShoppingMall/DropBasket?num='+i, 
			  async:true,
			  success: function(data){
				  	alert("삭제되었습니다.")
					location.reload();
			  },
			  error : function() {
				alert("오류 발생");
			  }
			});
}

function allDrop() {
	
	$.ajax({
			  type:'get',
			  url:'http://localhost:8081/ShoppingMall/DropBasket', 
			  async:true,
			  success: function(data){
				  	alert("삭제되었습니다.")
					location.reload();
			  },
			  error : function() {
				alert("오류 발생");
			  }
			});
}

	function pay() {
			var temp = $('input:radio[name="pay"]:checked').val();
			$("#payment").val(temp);
		}

		function NewOrder(i) {
			for(var k=0;k<i;k++){
			
				var _id = $("#id"+k).val();
				var _p_id = $("#p_id"+k).val();
				var _name = $("#name"+k).val();
				var _o_name = $("#o_name"+k).val();
				var _phone = $("#phone"+k).val();
				var _nAd = $("#nAd"+k).val();
				var _address = $("#address"+k).val();
				var _dAd = $("#dAd"+k).val();
				var _payment = $("#payment"+k).val();
				var _price = $("#price"+k).val();
				
				$.ajax({
				  	type:'post',
				  	url:'http://localhost:8081/ShoppingMall/NewOrder', 
				   	data:{
					  id:_id,
					  p_id:_p_id,
					  name:_name,
					 o_name:_o_name,
					  phone:_phone,
					  nAd:_nAd,
					  address:_address,
					  dAd:_dAd,
					  price:_price,
					  payment:_payment
					  }, 
				  	async:true,
			  		error : function() {
						alert("오류 발생");
			  		}
				});
			}
			alert("주문 완료");
			location.href="index.jsp";

		}
		
		function movePay(i) {
		if(i==0){
			alert("등록된 상품이 없습니다.");
		}else{
			location.href="orderPage.jsp";
		}
		}
		
function pick(i,p) {
	
	if(i == 'null'){alert("로그인 후 이용 가능합니다.")}
	else{
	$.ajax({
			  type:'get',
			  url:'http://localhost:8081/ShoppingMall/Pick', 
			  async:true,
			  	data:{
					  id:i,
					  p_id:p
					  }, 
			  success: function(data){
				  	alert("위시리스트에 추가 되었습니다.");
				  	$("#heart").css({"color":"red"});
			  },
			  error : function() {
				alert("오류 발생");
			  }
			});}
}