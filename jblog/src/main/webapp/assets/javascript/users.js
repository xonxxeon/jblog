function checkForm(frm) {
	console.log(frm);
	
	var userName = frm.userName.value.trim();
	var password = frm.password.value.trim();
	var id = frm.id.value.trim();
	var check = frm.check.value;	//	중복 이메일 체크
	
	//	TODO : 추가검증
	if (userName.length < 3) {
		alert("이름은 3자리 이상의 문자입니다.");
		frm.userName.focus();
	} else if (password.length < 4) {
		alert("비밀번호는 4자리 이상이어야 합니다.");
		frm.password.focus();
	} else if (check != "t") {	//	중복 체크 안함
		alert("아이디 중복 체크를 해 주세요.");
	} else if(agree != "agree"){
		alert("약관에 동의하셔야 가입이 가능합니다.");
	} else {	//	검증 통과
		return true;	//	폼 전송
	}
	
	return false;	//	onsubmit 이벤트에서 true 여야 전송
	
}

function checkid(idField, url) {
	console.log("id field : ", idField.value);
	
	//	Ajax 호출
	if (idField.value.trim().length == 0) {
		alert("아이디를 입력해 주세요");
		return;
	}
	
	$.ajax({
		url: url,
		type: "GET",
		dataType: "json",
		data: {
			id: idField.value.trim()
		},
		success: function(result){
			console.log("Result : ", result);
			//	hidden field : check 값을 변경
			if (result.data == true) {	//	중복 아이디
				idField.form.check.value = "f";
				alert("이미 가입된 아이디입니다.");
			} else {
				idField.form.check.value = "t";
				alert("가입할 수 있는 아이디입니다.");
			}
		},
		error: function(xhr, status, error) {
			console.error("Status : ", status);
			console.error("Response : ", xhr);
			console.error("Error : ", error);
			
			idField.form.check.value = "f";
		}
	});
	
}



