<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//session.invalidate(); 모든 세션 삭제
session.removeAttribute("idKey");
%>
<script type="text/javascript">
alert("로그아웃 성공");
//location.href = "login.jsp";
location.href = "../guest/guest_index.jsp";
</script>
</body>
</html>