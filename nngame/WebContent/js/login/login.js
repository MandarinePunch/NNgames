window.Kakao.init('2788fa75d20354b2832aeccb222e3e25');		// JavaScript API키

function checkLogin() {
	var id = document.getElementById("login_InputEmail").value;
	var pw = document.getElementById("login_InputPassword").value;

	if (id == "") {
		document.getElementById("login_pid").innerHTML = "이메일을 입력해주세요.";
		return false;
	} else if (pw == "") {
		document.getElementById("login_ppw").innerHTML = "비밀번호를 입력해주세요.";
		return false;
	} else {
		return true;
	}
}

function login_focusOut() {
	var email = document.getElementById("login_InputEmail").value;
	var pw = document.getElementById("login_InputPassword").value;

	if (email != "") {
		document.getElementById("login_pid").innerHTML = "";
	}
	if (pw != "") {
		document.getElementById("login_ppw").innerHTML = "";
	}
}

function kakaoLogin() {
    window.Kakao.Auth.login({
    	scope: 'profile_nickname, account_email, age_range, birthday', // 동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값
    	success: function(authObj) {
    		console.log(authObj)
    		window.Kakao.API.request({
        		url: '/v2/user/me',
        		success: (res) => {
            	const kakao_account = res.kakao_account;
            	console.log(kakao_account);
            	console.log(kakao_account.email);
            	
            	let frm = document.getElementById('kakaofrm');
            	
            	document.getElementById('kakao_nick').value = kakao_account.profile.nickname;
            	document.getElementById('kakao_email').value = kakao_account.email;
            	document.getElementById('kakao_age').value = kakao_account.age_range;
            	document.getElementById('kakao_birth').value = kakao_account.birthday;
            	
            	frm.submit();
        		}
   			});
        // window.location.href='/login/kakao_loginData.jsp' // 리다이렉트 되는 코드
		},
    	fail: function(error) {
	    	console.log(error);
		}
	});
}