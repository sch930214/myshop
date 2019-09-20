<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberMgr" class="shop.member.MemberMgr" scope="page"/>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
boolean b = memberMgr.chkId(id);
//out.print(b);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복검사</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
</head>
<body>
<b><%=id %></b>
<% 
	if(b) {
%>
는(은) 이미 존재하는 ID입니다.<p/>
<a href="#" onclick="opener.document.regForm.id.focus(); window.close()">닫기</a>
<%		
	}else{
%>
는(은) 사용가능한  ID입니다.<p/>
<a href="#" onclick="opener.document.regForm.passwd.focus(); window.close()">닫기</a>
<%	
	}
%>
</body>
</html>