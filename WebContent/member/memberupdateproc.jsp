<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mbean" class="shop.member.MemberBean"/>
<jsp:setProperty property="*" name="mbean"/>
<jsp:useBean id="memberMgr" class="shop.member.MemberMgr"/>
<%
String id = (String)session.getAttribute("idKey");
//String id = mbean.getId(); hidden을 쓰면 이거로 가능


boolean b = memberMgr.memberUpdate(mbean, id);

if(b){
%>
	<script>
		alert("수정 성공");
		location.href="../guest/guest_index.jsp";
	</script>
<%}else{%>
	<script>
		alert("수정 실패\n관리자에게 문의 바랍니다.");
		history.back();
	</script>
<%	
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