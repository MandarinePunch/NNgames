function checkId() {
	var id = document.getElementById("findPwEmail").value;

	if (id == "") {
		document.getElementById("pwfind_id").innerHTML = "이 항목은 비워둘 수 없습니다.";
		return false;
	} else {
		return true;
	}
}

function pwfind_focusOut() {
	var email = document.getElementById("findPwEmail").value;

	if (email != "") {
		document.getElementById("pwfind_id").innerHTML = "";
	}
}