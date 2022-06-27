const form = document.getElementById("discountForm");
const input = document.getElementById("mainIconParam");

function goToDiscount() {
	input.value = "DISCOUNT";
	form.submit();
}

function goToPopular() {
	input.value = "ASC";
	form.submit();
}

function goToRecommend() {
	input.value = "DESC";
	form.submit();
}