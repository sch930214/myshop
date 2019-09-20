<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cartMgr" class="shop.order.CartMgr" scope="session" />
<jsp:useBean id="order" class="shop.order.OrderBean" />
<jsp:setProperty property="*" name="order" />

<% 
String flag = request.getParameter("flag");       //구매목록보기,수정,삭제 판단용
String id = (String)session.getAttribute("idKey");
//out.print(order.getProduct_no() + " 주문수 : " + order.getQuantity() + " " + id); 

if(id == null){
	response.sendRedirect("login.jsp");
}else{
	if(flag == null) { //Cart에 주문 상품 담기
		order.setId(id);
		cartMgr.addCart(order);
%>
	<script>
	alert("장바구니에 담은 이상 이건 꼭 사주기~");
	location.href = "cartlist.jsp";
	</script>
<%	
	}else if(flag.equals("update")) { //Cart 수정
		order.setId(id);
		cartMgr.updateCart(order);
%>
	<script>
	alert("수량 늘린거지?");
	location.href = "cartlist.jsp";
	</script>
<%
	}else if(flag.equals("del")) { //Cart 삭제
		cartMgr.deleteCart(order);
%>
	<script>
	alert("다른거라도 사줘..");
	location.href = "cartlist.jsp";
	</script>
<%
	}
}
%>