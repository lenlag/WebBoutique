<%@page import="entity.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="service.CartService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
<script>
	function pay() {
		if (confirm("Confirm your payment")) { // if popUp confirmed
			window.location = "creditCard.jsp"; // redirection vers une autre page
		} else { // if not confirmed
			return;
		}
	}
</script>
</head>
<body>
	<%
		CartService service = new CartService();
		List<CartItem> myList = service.list(session);

		if (myList.size() == 0) {
	%>

	<h1 align="center" style="margin-top: 20%">Ooops! Your cart in
		empty...</h1>
	<a href="index.jsp" style="text-decoration: none"><input
		type="submit" value="Go shopping"
		style="margin-left: auto; margin-right: auto; display: block; margin-top: 5%; margin-bottom: 0%"></a>
	<!-- BACK btn -->

	<%
		} else {
	%>

	<h1 align="center">Payment</h1>
	<table border="1" width=70%>
		<tr>
			<th>code</th>
			<th>label</th>
			<th>quantity</th>
			<th>Unit price</th>
			<th>Subtotal price</th>
		</tr>

		<%
			for (CartItem ci : myList) {
		%>
		<tr>
			<td><%=ci.getCode()%></td>
			<td><%=ci.getLabel()%></td>
			<td><%=ci.getQuantity()%></td>
			<td><%=ci.getPrice()%></td>
			<td><%=ci.getQuantity() * ci.getPrice()%></td>

		</tr>
		<%
			}
		%>
	</table>
	<br /> Total:
	<%=service.total(session)%>
	<br />
	<br />


	<input type="button" value="Pay" onclick="pay()" style="color: green; font-weight: bold">
	<!-- PAY btn -->

	<a href="shoppingCart.jsp" style="text-decoration: none"><input
		type="submit" value="Back" style="color: red; font-weight: bold"></a>
	<!-- BACK btn -->

	<%
		}
	%>

</body>
</html>