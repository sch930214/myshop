<%@page import="shop.member.ZipcodeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="MemberMgr" class="shop.member.MemberMgr" scope="page"/>
<%
request.setCharacterEncoding("utf-8");

String check = request.getParameter("check"); // y 또는 n값을 받을 것이다
String p_area3 = request.getParameter("area3");	//동이름

ArrayList<ZipcodeBean> list = MemberMgr.zipcodeRead(p_area3);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("btnZipFind").onclick = dongCheck;
	document.getElementById("btnZipClose").onclick = function(){
		window.close();
	};
};

function dongCheck(){
	//alert("dong");
	if(zipForm.area3.value === ""){
		alert("검색할 동이름 입력");
		zipForm.area3.focus();
		return;
	}
	zipForm.submit();
}

function send(zipcode, area1, area2, area3, area4){
	//alert(zipcode + " " + area1);
	opener.document.regForm.zipcode.value = zipcode;
	var addr = area1 +" "+ area2 +" "+ area3 +" "+ area4;
	opener.document.regForm.address.value = addr;
	window.close();
}
</script>
</head>
<body>
<b>*우편번호 찾기*</b>
<form action="zipcheck.jsp" name="zipForm" method="post">
<table>
	<tr>
		<td>
		동 이름 입력 : <input type="text" name="area3">
		<input type="button" value="검색" id="btnZipFind">
		<input type="button" value="닫기" id="btnZipClose">
		<input type="hidden" value="n" name="check">
		</td>
	</tr>
</table>
</form>
<%
	if(check.equals("n")){
		if(list.isEmpty()){
%>			
	<b>검색결과가 없어용~</b>
<% 
		}else{
%>
	<table>
		<tr style="text-align: center;">
		 <td>검색자료를 클릭하면 자동으로 주소가 입력됩니다.</td>
		</tr>
		<tr>
		 <td>
		 <%
		 	for(int i=0; i<list.size();i++){
		 		ZipcodeBean bean = list.get(i);
		 		String zipcode = bean.getZipcode();
		 		String area1 = bean.getArea1();
		 		String area2 = bean.getArea2();
		 		String area3 = bean.getArea3();
		 		String area4 = bean.getArea4();
		 		if(area4 == null) area4 = "";
		 %>		
		 		<a href="javascript:send('<%=zipcode%>','<%=area1%>','<%=area2%>','<%=area3%>','<%=area4%>')">
		 		<%=zipcode%> <%=area1%> <%=area2%> <%=area3%> <%=area4%>
		 		</a>
		 		<br>
		 <%		
		 	}
		 %>	 
		 </td>
		</tr>
	</table>
<%
		}
		
	}
%>			

</body>
</html>