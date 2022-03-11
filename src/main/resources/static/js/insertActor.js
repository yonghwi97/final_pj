//중복확인 했는지 전역변수
var tf = false;

window.onload = function() {
	// id가 form인 폼의  submit 버튼이 눌러졌을 때 수행되는 이벤트 처리
	document.getElementById('form').onsubmit = function() {

		var actorNo = document.getElementById('actorNo');
		if(actorNo.value == "") {
			alert("배우 등록번호를 입력하세요.");
			actorNo.focus();
			return false; 
		}
		
		//변수에 담아주기
	    if(!tf) {
	        alert('중복확인을 눌러주세요.');
	        return false;
	    }
		
		var actorName = document.getElementById('actorName');
		if(actorName.value == ""){
			alert("배우 이름을 입력하세요.");
			actorName.focus();

			return false;	   // 서버로 전송되지 않게 함(다음 페이지로 이동 못하게)		
		}
		
		

	}
}

/**중복체크*/
$(document).ready(function(){
	$('#duplicateActorCheck').on('click', function(){
		event.preventDefault();

		$.ajax({
			type:"post",
			url:"duplicateActorCheck", //컨트롤러에 매핑 되는 액션 커맨드
			data:{"actorNo": $('#actorNo').val()},
			dataType:'text',
			success:function(result){
				if(result == "no_use"){
					alert("사용 가능한 배우 번호 입니다.");
					tf=true;
				}else{
					alert("중복된 배우 번호 입니다.");
					tf = false;
				}
			},
			error:function(data, textStatus){
				alert("배우 번호를 입력해 주세요");
			}

		});
	});

});
