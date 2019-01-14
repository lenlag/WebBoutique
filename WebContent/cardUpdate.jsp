<%@page import="service.CartService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		List<Integer> intList = new ArrayList<Integer>(); // to stock new quantities(int) in List<Integer> 
		int i = 0;
		while (true) { // infinite loop
			String newQuantity = request.getParameter("editor_" + i); // we retrieve the value of "editor_x" from the page shoppingCart.jsp, i.e. the NEW Quantity
			if (newQuantity == null) {
				break;
			}
			intList.add(Integer.parseInt(newQuantity));
			i++;

		}

		CartService service = new CartService();
		service.update(session, intList);
		response.sendRedirect("shoppingCart.jsp");
	%>

</body>
</html>