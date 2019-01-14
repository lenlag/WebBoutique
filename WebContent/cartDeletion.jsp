<%@page import="service.CartService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart Items Deletion</title>
</head>
<body>
<%
String myIndex = request.getParameter("index");
int index = Integer.parseInt(myIndex);
CartService service = new CartService();
service.delete(session, index-1);
response.sendRedirect("shoppingCart.jsp");
%>
</body>
</html>