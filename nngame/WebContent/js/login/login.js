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
	} else if (pw.length < 4) {
		document.getElementById("login_ppw").innerHTML = "비밀번호는 4글자이상입니다.";
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

// 카카오 로그인 연동
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

// 네이버 로그인 연동
var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "M_PF7i1iZSNbJ5ywRFvF", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:9090/login/login.jsp", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	
	naverLogin.init();
	document.getElementById('naverIdLogin_loginButton').addEventListener('click', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문
			if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
			console.log(naverLogin.user);
			
    		let frm = document.getElementById('naverfrm');
    		
    		document.getElementById('naver_nick').value = naverLogin.user.getName();
    		document.getElementById('naver_email').value = naverLogin.user.getEmail();
    		document.getElementById('naver_age').value = naverLogin.user.getBirthyear();
    		document.getElementById('naver_birth').value = naverLogin.user.getBirthday();
    		document.getElementById('naver_phone').value = naverLogin.user.getMobile();
    		
    		frm.submit();
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});
