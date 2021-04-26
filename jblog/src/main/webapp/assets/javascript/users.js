function checkForm(frm) {
	console.log(frm);
	
	var userName = frm.userName.value.trim();
	var password = frm.password.value.trim();
	var id = frm.id.value.trim();
	var check = frm.check.value;	//	중복 아이디 체크
	var agree = frm.value;
	var checkFlag = $("#agree").is(':checked');

	//	TODO : 추가검증
	if (userName.length < 3) {
		alert("이름은 3자리 이상의 문자입니다.");
		frm.userName.focus();
	} else if (password.length < 4) {
		alert("비밀번호는 4자리 이상이어야 합니다.");
		frm.password.focus();
	} else if (check != "t") {	//	중복 체크 안함
		alert("아이디 중복 체크를 해 주세요.");
	} else if(checkFlag != true){
		alert("약관에 동의하셔야 가입이 가능합니다.");
	} else {	//	검증 통과
		return true;	//	폼 전송
	}
	
	return false;	//	onsubmit 이벤트에서 true 여야 전송
	
}

function alertWrite(write){
	console.log(write);
	var postTitle = write.postTitle.value.trim();
	var postContent = write.postContent.value.trim();
	
	if(postTitle.length < 1){
		alert("글 제목을 입력해주세요.");
		write.postTitle.focus();
	} else if(postContent.length < 1){
		alert("글 내용을 입력해주세요.");
		write.postContent.focus();
	} else {
		alert("게시물이 작성되었습니다.");
		return true;
	}
	
	return false;
}

function checkPost(post){
	var postCount = post.postCount.value;
	
	if(postCount > 0){
		alert("삭제할 수 없습니다.");
	} else if(postCount == 0){
		return true;
	}
	
	return false;
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

function checkAddCate(ac){
	var cateName = ac.cateName.value.trim();
	var description = ac.description.value.trim();
	
	if(cateName.length < 1){
		alert("카테고리명을 입력해 주세요");
		ac.cateName.focus();
	} else if (description.length < 1){
		alert("설명을 입력해 주세요");
		ac.description.focus();
	} else {
		alert("카테고리가 등록되었습니다");
		return true;
	}
	return false;
}
