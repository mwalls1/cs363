<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Query</title>
</head>
<body>
<p>Click "Q1" to see result of query 1</p>
			<form method = "post">
				<input type="submit" name="button1" value="Q1"/>
			</form>
			<%
			if("Q1".equals(request.getParameter("button1")))
			{
				String user = "COMS363";
				String pass = "SPRING2021";
				String connectionURL = "jdbc:mysql://localhost:3306/project1p3";
				Connection conn = null;
				Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
				conn = DriverManager.getConnection(connectionURL,user, pass);

				Statement stmt = null;
				try {
					stmt = conn.createStatement();
					String outputString = "";
					String sql = "SELECT s.snum, s.ssn FROM students s " + 
							"	WHERE name = 'Becky'";
					ResultSet results = stmt.executeQuery(sql);
					String res = "";
					while(results.next())
					{
						res+= results.getInt("snum")+" ";
						res+= results.getInt("ssn")+" ";
					}
					session.setAttribute("res1",res);
				}catch (SQLException se) {
					se.printStackTrace();
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(stmt != null)
							conn.close();
					}catch(SQLException se) {
						
					}
					try {
						if(conn != null)
							conn.close();
					}catch(SQLException se) {
						se.printStackTrace();
					}
				}
				response.sendRedirect("QueryResult1.jsp");
			}
			%>
			
<p>Click "Q2" to see result of query 2</p>
			<form method = "post">
				<input type="submit" name="button2" value="Q2"/>
			</form>
			<%
			if("Q2".equals(request.getParameter("button2")))
			{
				String user = "COMS363";
				String pass = "SPRING2021";
				String connectionURL = "jdbc:mysql://localhost:3306/project1p3";
				Connection conn = null;
				Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
				conn = DriverManager.getConnection(connectionURL,user, pass);

				Statement stmt = null;
				try {
					stmt = conn.createStatement();
					String outputString = "";
					String sql = "SELECT d.name, d.level" + 
							"	FROM degrees d " + 
							"    JOIN departments f on d.department_code = f.code " + 
							"    WHERE f.name = 'Computer Science'";
					ResultSet results = stmt.executeQuery(sql);
					String res = "";
					while(results.next()) {
						res+= "/"+results.getString("name")+"/";
						res+= results.getString("level");
					}
					session.setAttribute("res2",res);
				}catch (SQLException se) {
					se.printStackTrace();
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(stmt != null)
							conn.close();
					}catch(SQLException se) {
						
					}
					try {
						if(conn != null)
							conn.close();
					}catch(SQLException se) {
						se.printStackTrace();
					}
				}
				response.sendRedirect("QueryResult2.jsp");
			}
			%>
			
<p>Click "Q3" to see result of query 3</p>
			<form method = "post">
				<input type="submit" name="button3" value="Q3"/>
			</form>
			<%
			if("Q3".equals(request.getParameter("button3")))
			{
				String user = "COMS363";
				String pass = "SPRING2021";
				String connectionURL = "jdbc:mysql://localhost:3306/project1p3";
				Connection conn = null;
				Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
				conn = DriverManager.getConnection(connectionURL,user, pass);

				Statement stmt = null;
				try {
					stmt = conn.createStatement();
					String outputString = "";
					String sql = "SELECT c.number, c.name" + 
							"	FROM courses c " + 
							"    JOIN departments d on c.department_code = d.code " + 
							"    WHERE d.name = 'Computer Science' or d.name = 'Landscape Architect'";
					ResultSet results = stmt.executeQuery(sql);
					String res = "";
					while(results.next()) {
						res+="/"+results.getString("number")+"/";
						res+= results.getString("name");
					}
					session.setAttribute("res3",res);
				}catch (SQLException se) {
					se.printStackTrace();
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(stmt != null)
							conn.close();
					}catch(SQLException se) {
						
					}
					try {
						if(conn != null)
							conn.close();
					}catch(SQLException se) {
						se.printStackTrace();
					}
				}
				response.sendRedirect("QueryResult3.jsp");
			}
			%>
			
</body>
</html>