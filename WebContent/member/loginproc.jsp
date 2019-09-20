<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberMgr" class="shop.member.MemberMgr"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

boolean b = memberMgr.loginChk(id,passwd);

	if(b){
		//request.setAttribute(name, o) ---현재 jsp에서만 유효(request)
		//application.setAttribute("aa","kbs"); --- 어디서든 유효
		session.setAttribute("idKey", id);
		//response.sendRedirect("login.jsp");
		response.sendRedirect("../guest/guest_index.jsp");
	}else{
		response.sendRedirect("loginfail.html");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>