//중복확인 했는지 전역변수
var tf = false;

window.onload = function() {
	// id가 form인 폼의  submit 버튼이 눌러졌을 때 수행되는 이벤트 처리
	document.getElementById('form').onsubmit = function() {

		var muscNo = document.getElementById('muscNo');
		if(muscNo.value == "") {
			alert("뮤지컬 등록번호를 입력하세요.");
			muscNo.focus();
			return false; 
		}
		
		//변수에 담아주기
	    if(!tf) {
	        alert('중복확인을 눌러주세요.');
	        return false;
	    }
		
		var muscName = document.getElementById('muscName');

		if(muscName.value.length<2){
			alert("뮤지컬 이름이 없거나 2자 미만입니다.");
			muscName.focus();

			return false;	   // 서버로 전송되지 않게 함(다음 페이지로 이동 못하게)		
		}
		
		var muscHashtag = document.getElementById('muscHashtag');
		if(muscHashtag.value == "") {
			alert("뮤지컬 해시태그를 입력하세요.");
			muscHashtag.focus();
			return false;
		}
		
		var muscPlace = document.getElementById('muscPlace');
		if(muscPlace.value == "") {
			alert("공연장 이름을 입력하세요.");
			muscPlace.focus();
			return false;
		}
		
		var muscStartDate = document.getElementById('muscStartDate');
		if(muscStartDate.value == "") {
			alert("공연 시작일을 입력하세요.");
			muscStartDate.focus();
			return false;
		}
		
		var muscEndDate = document.getElementById('muscEndDate');
		if(muscEndDate.value == "") {
			alert("공연 종료일을 입력하세요.");
			muscEndDate.focus();
			return false;
		}

	}
}

/**중복체크*/
$(document).ready(function(){
	$('#duplicateCheck').on('click', function(){
		event.preventDefault();

		$.ajax({
			type:"post",
			url:"duplicateCheck", //컨트롤러에 매핑 되는 액션 커맨드
			data:{"muscNo": $('#muscNo').val()},
			dataType:'text',
			success:function(result){
				if(result == "no_use"){
					alert("사용가능한 뮤지컬 번호 입니다.");
					tf=true;
				}else{
					alert("중복된 뮤지컬 번호 입니다.");
					tf = false;
				}
			},
			error:function(data, textStatus){
				alert("뮤지컬 번호를 입력해 주세요");
			}

		});
	});

});
