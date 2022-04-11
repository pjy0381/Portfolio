/**
 * 
 */
function kakaoLogin() {
Kakao.init('2eb5689fe1f3c4cbf5bbdcccc9e5132b'); 
 Kakao.Auth.login({
      success: function () {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
  		        var email = response.kakao_account.email;
  		        var name = response.properties.nickname;
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
			  				$('#h_id').val(email); 
			  				$('#h_name').val(name); 
			  				$('#hiddenF').submit();
			  			}
			  	},
			  	error : function() {
					alert("오류 발생");
			 	}
			});
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }


