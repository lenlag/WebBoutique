<%@page import="service.MyService"%>
<%@page import="persistence.dao.BoutiqueDao"%>
<%@page import="service.CartService"%>
<%@page import="business.entity.BoutiqueItem"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart Processing</title>
</head>
<body>
	<%
		String sId = request.getParameter("id");
		long id = 0L;
		id = Long.parseLong(sId);
		MyService myservice = new MyService();
		BoutiqueItem bi = myservice.findById(id);
		CartService service = new CartService();
		service.add(session, bi);
		response.sendRedirect("shoppingCart.jsp");
	%>
</body>
</html>