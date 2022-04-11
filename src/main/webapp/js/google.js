 
 var googleUser = {};

     function onSuccess(googleUser) {
     	var email = googleUser.getBasicProfile().getEmail();
     	var name = googleUser.getBasicProfile().getName();
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
    }
    function onFailure(error) {
      console.log(error);
    }
 
     function renderButton() {
      gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 231,
        'height': 50,
        'longtitle': true,
        'theme': 'while',
        'onsuccess': onSuccess,
        'onfailure': onFailure
      });
    }