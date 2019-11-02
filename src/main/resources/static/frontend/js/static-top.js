function logout() {
	sessionStorage.removeItem("user");
	location.href = "/logout";
}

var user = sessionStorage.getItem("user");
if (user != null) {
	$('.login').hide();
	$('.center').show();
	$('.logined').show();
}