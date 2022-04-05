  function naverLogin() {
	  	var naver_id_login = new naver_id_login("g9H_PFbAT3lWqnRZj0yW", "http://localhost:8081/shop");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setDomain("http://localhost:8081");
	  	naver_id_login.setState(state);
	  	naver_id_login.init_naver_id_login();
}
