<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>Insert title here</title>
</head>
<body onload="sub()">

  <script type="text/javascript">
  var naver_id_login = new naver_id_login("g9H_PFbAT3lWqnRZj0yW", "http://localhost:8081/shop/1234.jsp");
  // 접근 토큰 값 출력
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  
 function sub() {
	 var email = naver_id_login.getProfileData('email');
	 var name = naver_id_login.getProfileData('name');
	 
	 $.ajax({
		  	type:'post',
		  	url:'AnotherLogin', 
		  	async:true,
			data:{
				  id:email,
				  name:name
				  }, 
		  	success: function(data){
		  			if(data == '로그인 성공'){
		  				alert(data);
		  				location.href = "index.jsp";
		  			}else{
		  				alert("로그인 실패");
		  				location.href = "index.jsp?webApp=login";
		  			}
		  	},
		  	error : function() {
				alert("오류 발생");
		 	}
		});
}
</script>
</body>
</html>