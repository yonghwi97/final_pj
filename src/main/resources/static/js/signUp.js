/**
 *
 */
window.onload = function (){

    document.getElementById("memAddress").addEventListener("click", function(){
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("memAddress").value = data.address; // 주소 넣기
                document.querySelector("input[name=memAddressDetail]").focus(); //상세입력 포커싱
            }
        }).open();
    });

}

//중복확인 했는지 전역변수
var tf = false;

/* 유효성 검사 섹션*/
function signUpForm_check() {
    console.log('signUpForm_check');
    var id = document.getElementById("memberID");
    var pw = document.getElementById("memberPW");
    var repw = document.getElementById("memberPW_check");
    var name = document.getElementById("memberName");
    var email = document.getElementById("memberEmail");
    var phone = document.getElementById("memberPhone");
    var address = document.getElementById("memberAddress");
    var addressdetail = document.getElementById("memberAddress_Detail");

    if (id.value == "" || id.value == null) { //해당 입력값이 없을 경우 같은말: if(!uid.value)
        alert("아이디를 입력하세요.");
        id.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
        return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
    };

    //변수에 담아주기
    if(!tf) {
        alert('중복확인을 눌러주세요.');
        return false;
    }


    var idCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,21}$/;

    if (!idCheck.test(id.value) == ""){
        alert("아이디는 6자 이상 입력해주세요.")
        id.focus();
        return false;
    };

    if (pw.value == "") {
        alert("비밀번호를 입력하세요.");
        pw.focus();
        return false;
    };

    //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
    var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{3,21}$/;

    if (!pwdCheck.test(pw.value)) {
        alert("비밀번호는 영문, 숫자 혼용하여 4자리 이상으로 사용해야 합니다.");
        pw.focus();
        return false;
    };

    if (repw.value !== pw.value) {
        alert("비밀번호가 일치하지 않습니다.");
        repw.focus();
        return false;
    };

    if (name.value == "") {
        alert("이름을 입력하세요.");
        name.focus();
        return false;
    };

    if (email.value == "") {
        alert("이메일 주소를 입력하세요.");
        email.focus();
        return false;
    }

    if (phone.value == "") {
        alert("휴대폰 번호를 입력하세요.");
        phone.focus();
        return false;
    }

    if (address.value == "") {
        alert("주소를 입력하세요.");
        address.focus();
        return false;
    }

    if (addressdetail.value == "") {
        alert("상세주소를 입력하세요.");
        address_detail.focus();
        return false;
    }



    //입력 값 전송
    document.form.submit(); //유효성 검사의 포인트
}
/* 유효성 검사 섹션 끝*/

/* 중복 확인 기능*/
function doubleCheck() {
    $.ajax({
        type:"post",
        url:"idcheck",
        data:{"id": $('#memberID').val()},
        dataType:'text',
        success:function(result){

            if(result == "no_use"){
                alert("사용 가능한 아이디입니다.");
                tf=true;
            }else{
                alert("중복된 아이디입니다.");
            }
        },
        error:function(data, textStatus){
            alert("전송 실패");
        }
    });
}

var naver_id_login = new naver_id_login("nmuFIAlAX7Na0l6ahIGv", "http://localhost:8080/signupForm");
// 접근 토큰 값 출력
$('body').append('<h4>접속토큰:'+naver_id_login.oauthParams.access_token+'</h4>');
// 네이버 사용자 프로필 조회
naver_id_login.get_naver_userprofile("naverSignInCallback()");
// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function

function naverSignInCallback() {
    const email = naver_id_login.getProfileData('email');
    const name = naver_id_login.getProfileData('name');
    const mobile = naver_id_login.getProfileData('mobile');
    const id = naver_id_login.getProfileData('id');

    $('#memberEmail').val(email);
    $('#memberName').val(name);
    $('#memberPhone').val(mobile);

}