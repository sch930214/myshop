function zipCheck() {
	//alert('zip');
	url = "zipcheck.jsp?check=y";
	window.open(url, "post", "toolbar=no,width=350,height=300,top=200,left=300,status=yes,scrollbars=yes,menubar=no");
}
function idCheck() {
	//alert('id'); 한 번씩 확인해보면서.
	if(regForm.id.value === "") {
		alert('id를 입력하세요.');
		regForm.id.focus();
	}else{
		url = "idcheck.jsp?id=" + regForm.id.value;
		window.open(url, "id", "toolbar=no,width=300,height=150,top=200,left=300,status=yes,scrollbars=yes,menubar=no");
	}
	
}

//로그인 후 회원정보 수정
function inputCheck() {
	//alert('inputCheck');
	//입력자료 검사 후 추가 처리
	if(regForm.id.value === ""){
		alert('아이디를 입력하세요.');
		regForm.id.focus();
		return;
	}
	if(regForm.passwd.value === ""){
		alert('비밀번호를 입력하세요.');
		regForm.passwd.focus();
		return;
	}
	if(regForm.passwd.value !== regForm.repasswd.value){
		alert('비밀번호가 일치하지 않습니다.');
		regForm.repasswd.focus();
		return;
	}
	if(regForm.name.value === ""){
		alert('이름을 입력하세요.');
		regForm.name.focus();
		return;
	}
	if(regForm.email.value === ""){
		alert('이메일을 입력하세요.');
		regForm.email.focus();
		return;
	}
	
	//정규 표현식으로 이메일 검사  kor@abc.com kor@abc.co.kr
	var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
	if(!regForm.email.value.match(regExp)) {
		alert("올바른 이메일주소를 입력하세요.")
		regForm.email.focus();
		return;
	}
	if(regForm.phone.value === ""){
		alert('전화번호를 입력하세요.');
		regForm.phone.focus();
		return;
	}
	//생략...
	
	regForm.submit();
	
}
function memberUpdate(){
	//alert('a');
	//입력자료 검사 생략 ...
	document.updateForm.submit();
}
function memberUpdateCancel(){
	//alert('b');
	//history.back();
	location.href="../guest/guest_index.jsp"; //명시적
}
function memberDelete(){
	alert('회원탈퇴는 3대를 멸함');
}

//관리자가 회원수정
function memUpdate(id) {
	//alert(id);
	document.updateFrm.id.value = id;
	document.updateFrm.submit();
}

function memberUpdateAdmin() {
	//alert("a");
	document.updateFormAdmin.submit();
}

//관리자가 상품처리
function productDetail(no) {
	//alert(no);
	document.detailFrm.no.value = no;
	document.detailFrm.submit();
}

function productUpdate(no){
	//alert(no);
	document.updateFrm.no.value = no;
	document.updateFrm.submit();
}

function productDelete(no){
	//alert(no);
	if(confirm('다 팔았어?')){
		document.delFrm.no.value = no;
		document.delFrm.submit();
	}
}

//카트 처리
function cartUpdate(form){
	form.flag.value = "update";		//flag에 update달고 날아가~
	form.submit();
}

function cartDelete(form){
	form.flag.value = "del";
	form.submit();
}







