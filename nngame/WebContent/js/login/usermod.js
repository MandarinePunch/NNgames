function checkModNick() {
	var nickname = document.getElementById("mod_nickname").value;
	var phnum = document.getElementById("mod_phone").value;

	if (nickname == "") {
		alert('닉네임을 입력해주세요.');
		return false;
	} else if (phnum == "") {
		alert('전화번호를 입력해주세요.');
		return false;
	} else if (phnum.length > 14) {
		alert('전화번호를 정확히 입력해주세요.');
		return false;
	} else {
		alert('정보수정 완료!');
		return true;
	}
}

function checkModPw() {
	var beforepw = document.getElementById("mod_beforepass").value;
	var newpw1 = document.getElementById("mod_newpass").value;
	var newpw2 = document.getElementById("mod_newpasscheck").value;

	if (beforepw == "") {
		alert('현재 패스워드를 입력해주세요.');
		return false;
	} else if (newpw1 == "") {
		alert('새로운 패스워드를 입력해주세요.');
		return false;
	} else if (newpw1 != newpw2) {
		alert('새로운 패스워드가 일치하지 않습니다.');
		return false;
	} else if (newpw2.length < 4) {
		alert('새로운 패스워드는 4글자 이상이여야 합니다.');
		return false;
	} else {
		return true;
	}
}