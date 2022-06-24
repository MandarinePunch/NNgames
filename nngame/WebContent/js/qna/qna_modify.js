const form = document.querySelector(".checkForm");
const comments = document.querySelector(".checkComments");
const commentsLength = document.querySelector(".commentsLength");

// 초기 값 세팅
commentsLength.innerHTML = `${comments.value.length}/300`;

// 공백 validation 체크
function checkWrite(event) {
	const title = document.querySelector(".checkTitle");
	const select = document.querySelector(".checkSelect");

	if (select.value === "0") {
		event.preventDefault();
		alert("문의 내용을 선택해주세요");
	} else if (title.value === "") {
		event.preventDefault();
		alert("제목을 입력해주세요");
	} else if (comments.value === "") {
		event.preventDefault();
		alert("내용을 입력해주세요");
	}
}

// keyup 이벤트 발생시 글자 카운트
function countComments(event){
	let contents = comments.value;
	
	commentsLength.innerHTML = `${contents.length}/300`;
	
	if(len > 300){
		contents = contents.substring(0, 300);
	}
}

comments.addEventListener("keyup", countComments);
form.addEventListener("submit", checkWrite);