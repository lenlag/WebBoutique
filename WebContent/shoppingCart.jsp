<%@page import="entity.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="service.CartService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Cart</title>
</head>
<body>
	<%
		CartService service = new CartService();
		List<CartItem> myList = service.list(session);
		int index = 0;
		
	%>
	<h1 align="center">Your shopping cart</h1>
	<form action="cardUpdate.jsp" method="get">
	<table border="1" width=70%>
		<tr>
			<th>Code</th>
			<th>Label</th>
			<th>Quantity</th>
			<th>Unit price</th>
			<th>Subtotal price</th>
		</tr>

	<%for (CartItem ci : myList) { %>
		<tr>
			<td><%=ci.getCode() %></td>
			<td><%=ci.getLabel()%></td>
			<td><input type="text" name="editor_<%=index%>" size="10" value="<%=ci.getQuantity() %>"></td> 
			<!-- Quantity edition box -->
			<td><%=ci.getPrice() %></td>
			<td><%=ci.getPrice()*ci.getQuantity()%></td>
			<%index++; %>
			
			<td width="20"><a href="cartDeletion.jsp?index=<%=index%>" name="deleteItem" style="text-decoration: none"> <!-- DELETE button -->
					<input type="button" value="delete"> </a></td>
		</tr>
	<% } %>	
	</table>
	<br /> 
	Total: <%=service.total(session) %>
	<br />
	<br />
	<input type="submit" value="Update card"> <!-- UPDATE card btn -->
	</form>
	<br />
	<br />
	
	<a href="index.jsp" style="text-decoration: none"><input
		type="submit" value="Continue shopping"></a>
	<a href="payment.jsp" style="text-decoration: none"><input
		type="submit" value="Purchase"></a>
</body>
</html>