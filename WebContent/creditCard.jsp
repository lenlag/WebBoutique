<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style/style.css" />
<title>Your credit card information</title>
</head>
<body align="center" style="margin-top: 20%">
	<h1 align="center">Please, enter your credit card details</h1>
	<table border="1" color="lightGray" align="center">
		<tr>
			<td>
				<form action="checkCB.jsp" method="post">
					<!-- POST -->
					Card number :&nbsp;
			</td>
			<td><input type="text" name="CardNumber" value=""
				placeholder="10-digit number" required maxlength="10"
				patten="[0-9]{10}"></td>
		</tr>
		<tr>
			<td>Expiration date :&nbsp;</td>
			<td>month : <select name="month-select" id="month-select">
					<%
						for (int i = 1; i < 13; i++) {
					%>
					<option value=""><%=i%></option>
					<%
						}
					%>
			</select> year : <select name="year-select" id="year-select">
					<%
						for (int i = 2018; i < 2026; i++) {
					%>
					<option value=""><%=i%></option>
					<%
						}
					%>
			</select>
			</td>
		</tr>
		<tr>
			<td>Security code : &nbsp;</td>
			<td><input type="text" placeholder="3-digit code" required
				minlength="3" maxlength="3" pattern="[0-9]{3}"></td>
		</tr>
	</table>
	<br />
	<table align="center">
		<tr>
			<td><input type="submit" value="Proceed"></td>
			<!-- PROCEED btn, enclosed in the form -->
			</form>
			<td><a href="index.jsp" style="text-decoration: none"><input
					type="button" value="Back"></a></td>
		</tr>
	</table>
</body>
</html>