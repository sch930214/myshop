<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("btnLogin").addEventListener("click", funcLogin, false);
	document.getElementById("btnNewMember").addEventListener("click", funcNew, false);
}

function funcLogin(){
	//alert("a");
	if(loginForm.id.value === ""){
		alert("아이디 입력");
		//dialogue가 더 좋은방법
		loginForm.id.focus();
	}else if(loginForm.passwd.value === ""){
		alert("비밀번호 입력");
		loginForm.passwd.focus(); 
	}else{
		loginForm.action="loginproc.jsp";
		loginForm.method="post";
		loginForm.submit();
	}
}	

function funcNew(){
	//alert("b");
	location.href = "register.jsp";
}
</script>
</head>
<body>
<%
	if(id != null){
%>
	<b><%=id %></b>님 환영합니다.<p/>
	<!-- 
	준비된 기능 사용 가능<br>
	<a href="logout.jsp">로그아웃</a> 
	-->
	
<%			
	}else{
%>
	<form name="loginForm">
		<table>
			<tr>
				<td colspan="2">* 로그인 *</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="button" value="로 그 인" id="btnLogin">
					<input type="button" value="회 원 가 입" id="btnNewMember">
				</td>
			</tr>
		</table>
	</form>
<%			
	}
%>
</body>
</html>