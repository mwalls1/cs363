<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, th, td {
  border: 1px solid black;
   border-collapse: collapse;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Query 2 Results</title>
</head>
<body>
This is the result of query 2
<table style="width:15%">
	<tr>
		<th>Degree Name</th>
		<th>Degree Level</th>
	</tr>
<% 	
	String results = (String)session.getAttribute("res2");
	Scanner scan = new Scanner(results);
	scan.useDelimiter("/");
	while(scan.hasNext()) {
	%>
	<tr>
		<td>
			<%= scan.next()%>
		</td>
		<td>
			<%= scan.next()%>
		</td>
	</tr>
	<%
	}
	scan.close();
%>
</table>
</body>
</html>