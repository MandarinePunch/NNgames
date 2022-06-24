function checkCard() {
	var card_str = document.getElementById("select_card");
	var paycard_name = card_str.options[card_str.selectedIndex].text;

	var paycard_Num = document.getElementById("cardNum").value;
	var paycard_Date = document.getElementById("cardDate").value;
	var paycard_Pw = document.getElementById("cardPw").value;

	if (paycard_name == "카드사 선택") {
		document.getElementById("select_pcard").innerHTML = "카드를 선택해 주세요";
		return false;
	} else if (paycard_Num == "") {
		document.getElementById("pcardNum").innerHTML = "카드번호를 입력해 주세요";
		return false;
	} else if(paycard_Num.length < 16){
		document.getElementById("pcardNum").innerHTML = "최소 16자리를 입력해 주세요";
		return false;
	} else if (paycard_Date == "") {
		document.getElementById("pcardDate").innerHTML = "카드 유효기간을 입력해 주세요";
		return false;
	} else if (paycard_Pw == "") {
		document.getElementById("pcardPw").innerHTML = "카드 비밀번호를 입력해 주세요";
		return false;
	}
	window.location.href = '/payment/paycomplete.jsp';
}

function card_focusOut() {
	var card_str = document.getElementById("select_card");
	var paycard_name = card_str.options[card_str.selectedIndex].text;

	var paycard_Num = document.getElementById("cardNum").value;
	var paycard_Date = document.getElementById("cardDate").value;
	var paycard_Pw = document.getElementById("cardPw").value;

	if (paycard_name != "카드사 선택") {
		document.getElementById("select_pcard").innerHTML = "";
	}
	if (paycard_Num != "") {
		document.getElementById("pcardNum").innerHTML = "";
	}
	if (paycard_Date != "") {
		document.getElementById("pcardDate").innerHTML = "";
	}
	if (paycard_Pw != "") {
		document.getElementById("pcardPw").innerHTML = "";
	}
}