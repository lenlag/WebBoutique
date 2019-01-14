<%@page import="business.entity.BoutiqueItem"%>
<%@page import="java.util.List"%>
<%@page import="service.MyService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Items</title>
</head>
<body>
	<%
		MyService service = new MyService();
		List<BoutiqueItem> list = service.findAll();
	%>
	<h1 align="center">Available items</h1>
	<a href="shoppingCart.jsp" style="text-decoration: none; float: right"><input
		type="submit" value="Check cart"></a>
	<br />
	<br />
	<table border="1" width=70% align="center">
		<tr>
			<th>id</th>
			<th>code</th>
			<th>label</th>
			<th>unit price</th>
		</tr>

		<tr>
			<%
				for (BoutiqueItem bi : list) {
			%>
			<td><%=bi.getId()%></td>
			<td><%=bi.getCode()%></td>
			<td><%=bi.getLabel()%></td>
			<td><%=bi.getPrice()%></td>
			<td width="20"><a href="cartProcessing.jsp?id=<%=bi.getId()%>"
				style="text-decoration: none"><input type="button" value="add"></a></td>

			<!-- ADD btn -->

		</tr>
		<%
			}
		%>

	</table>
</body>
</html>