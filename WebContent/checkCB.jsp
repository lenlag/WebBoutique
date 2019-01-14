<%@page import="service.CartService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CB checking</title>
</head>
<body>
	<%
		String cardNumber = request.getParameter("CardNumber");		
		CartService service = new CartService();
		boolean ok = true;
		Integer count = null;
		
		if (!cardNumber.equals("0123456789")) {
			ok = false;
			count = (Integer)session.getAttribute("COUNTER"); //we create count for the session
			if (count == null) {
				count = 1; // when the 1st error occurs, count is 1
				session.setAttribute("COUNTER", count); //we set the count attribute for the session (on the 1st error)
			} else {
				if (count >= 2) { //within 3 errors,we put 2 here, as we increment after the "}" = > "count++" 
					service.clear(session); // we empty the card
					response.sendRedirect("index.jsp"); 
					session.removeAttribute("COUNTER");
					return; // mandatory! otherwise the rest of the loop will not be executed 
				}
				count ++; // incrementation
				session.setAttribute("COUNTER", count); // we set the count attribute for the session (on the 2nd error)
			}
		} else {
			
	session.removeAttribute("COUNTER"); // within 3 errors we reset the counter attribute	
	service.clear(session); // we empty the cart if the card number is accepted
	
		}
		
		if (!ok) { 	%>
		
		Errors = <%=count %> <!-- To check number of errors occured -->

	<h1 align="center" style="margin-top: 20%">Wrong card number!</h1>
	<a href="creditCard.jsp" style="text-decoration: none"><input
		type="button" value="Try again"
		style="margin-left: auto; margin-right: auto; display: block; margin-top: 5%; margin-bottom: 0%"></a>

	<%
		} else {
	%>

	<h1 align="center" style="margin-top: 20%">Your payment has been accepted. Thank you for your purchase!</h1>

	<a href="index.jsp" style="text-decoration: none"><input
		type="button" value="Back to homepage"
		style="margin-left: auto; margin-right: auto; display: block; margin-top: 5%; margin-bottom: 0%"></a>

	<%
		}
	%>


</body>
</html>