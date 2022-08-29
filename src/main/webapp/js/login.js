/**
 * 
 */
 function fn_sendMember(){
				let frmMember = document.frmMember;
				let id = frmMember.id.value;
				let pwd = frmMember.pwd.value;
				let name = frmMember.name.value;
				let email = frmMember.email.value;
				if(id.length == 0 || id==""){
					alert("아이디 입력안하냐ㅡㅡ?");
				}else if(pwd.length == 0 || id==""){
					alert("비밀번호 입력안하냐고");
					alert("이름!!!! 이름!!!!!!!!");
					alert("이메일 입력해야지 팍씨");
				}else if(name.length == 0 || id==""){
					alert("이름!!!! 이름!!!!!!!!");
					alert("이메일 입력해야지 팍씨");
				}else if(email.length == 0 || id==""){
					alert("이메일 입력해야지 팍씨");
				}else{
					alert("가입 완료!");
					frmMember.method = "post";
					frmMember.action = "../process/registMember.jsp";
					
					frmMember.submit();
				}
			}
			
function loginMember(){
				let frmMember = document.frmMember;
				let id = frmMember.id.value;
				let pwd = frmMember.pwd.value;
				if(id.length == 0 || id==""){
					alert("아이디를 입력해주세요");
				}else if(pwd.length == 0 || id==""){
					alert("비밀번호를 입력해주세요");
				}else{
					frmMember.method = "post";
					frmMember.action = "../list/loginCheck.jsp";
					frmMember.submit();
				}
}

function altMember(){
	let frmMember = document.frmMember;
				frmMember.method = "post";
				frmMember.action = "../process/updateMember.jsp";
				frmMember.submit();
}
