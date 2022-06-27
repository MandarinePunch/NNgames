// search페이지 검색어입력체크
function checkForm(){
	let frmSc = document.searchFormSearch;
	
	if( !frmSc.searchTerm.value ){
		alert('검색어를 입력해 주세요');
	    frmSc.searchTerm.focus();
	    return false;
	}
	
	frmSc.submit();		
	
}

// hearder페이지 검색어입력체크
function checkFormHeader(){
	let frmHd = document.searchFormHearder;
	
	if( !frmHd.searchTerm.value ){
	      alert('검색어를 입력해 주세요');
	      frmHd.searchTerm.focus();
	      return false;
	}
	
	frmHd.submit();
}