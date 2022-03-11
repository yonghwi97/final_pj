window.onload = function() {
	// id가 joinForm인 폼의  submit 버튼이 눌러졌을 때 수행되는 이벤트 처리
	document.getElementById('form').onsubmit = function() {

		var id = document.getElementById('id');
		if(id.value == "") {
			alert("아이디를 입력하세요.");
			id.focus();
			return false;
		}



		if(id.value.length < 3 || id.value.length > 10) {
			alert("아이디는 6자 이상이어야 합니다.");
			id.value = ""; //null  됨
			id.focus();

			return false;
		}


		var pw = document.getElementById('pw');

		if(pw.value = "" || pw.value.length<6){
			alert("비밀번호가 틀리거나 5자 이하입니다.");
			pw.value = "";
			pw.focus();

			return false;	   // 서버로 전송되지 않게 함(다음 페이지로 이동 못하게)		
		}

	}
}


$(document).ready(function(){
	$('#loginForm').on('submit', function(){
		event.preventDefault();

		$.ajax({
			type:"post",
			url:"login",
			data:{"id": $('#id').val(),
				"pw":  $('#pw').val()},
			dataType:'text',
			success:function(result){
				if(result == "ok"){
					location.href="/";
				}else{
					alert("아이디 또는 비밀번호가 일치하지 않습니다.");
				}
			},
			error:function(data, textStatus){
				alert("전송 실패");
			}

		});
	});

});

$(document).on("click", "#naverLogin", function(){
	var naverLogin = document.getElementById("naver_id_login").firstChild;
	console.log(naverLogin);
	naverLogin.click();
});


Kakao.init('971f600e86f90b148bb0b266afe4b95c');


$("#kakao-login-btn").on("click", function(){
	//1. 로그인 시도
	Kakao.Auth.login({
		success: function(authObj) {

			//2. 로그인 성공시, API 호출
			Kakao.API.request({
				url: '/v2/user/me',
				success: function(res) {
					console.log(res);
					var id = res.id;
					scope : 'account_email';
					alert('로그인성공');
					location.href="callback주소";



				}
			})
			console.log(authObj);
			var token = authObj.access_token;
		},
		fail: function(err) {
			alert(JSON.stringify(err));
		}
	});

}) //

