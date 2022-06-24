function checkJoin() {
	var email = document.getElementById("join_Email").value;
	var pw = document.getElementById("join_Password1").value;
	var pwcheck = document.getElementById("join_Password2").value;
	var nickname = document.getElementById("join_Nickname").value;
	var phnum = document.getElementById("join_PhoneNum").value;
	var birthday = document.getElementById("join_Birth").value;

	if (email == "") {
		document.getElementById("join_pid").innerHTML = "이메일을 입력해주세요.";
		return false;
	} else if (pw != pwcheck) {
		document.getElementById("join_ppw").innerHTML = "비밀번호가 일치하지 않습니다.";
		return false;
	} else if (pw == pwcheck && pw.length < 4) {
		document.getElementById("join_ppw").innerHTML = "비밀번호는 4글자 이상이여야 합니다.";
		return false;
	} else if (nickname == "") {
		document.getElementById("join_pnickname").innerHTML = "닉네임을 입력해주세요.";
		return false;
	} else if (phnum == "") {
		document.getElementById("join_pphnum").innerHTML = "전화번호를 입력해주세요.";
		return false;
	} else if (phnum.length > 14) {
		document.getElementById("join_pphnum").innerHTML = "전화번호를 정확히 입력해주세요.";
		return false;
	} else if (birthday == "") {
		document.getElementById("join_pbirth").innerHTML = "생년월일을 입력해주세요.";
		return false;
	} else {
		return true;
	}
}

function join_focusOut() {
	var email = document.getElementById("join_Email").value;
	var pw = document.getElementById("join_Password1").value;
	var pwcheck = document.getElementById("join_Password2").value;
	var nickname = document.getElementById("join_Nickname").value;
	var phnum = document.getElementById("join_PhoneNum").value;
	var birthday = document.getElementById("join_Birth").value;

	if (email != "") {
		document.getElementById("join_pid").innerHTML = "";
	}
	if (pw != "") {
		document.getElementById("join_ppw").innerHTML = "";
	}
	if (nickname != "") {
		document.getElementById("join_pnickname").innerHTML = "";
	}
	if (phnum != "") {
		document.getElementById("join_pphnum").innerHTML = "";
	}
	if (birthday != "") {
		document.getElementById("join_pbirth").innerHTML = "";
	}
}