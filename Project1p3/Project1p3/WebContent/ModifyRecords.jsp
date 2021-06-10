<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modify Records</title>
</head>
<body>
<p>Click "Submit" to modify records.</p>
		<form method = "post">
				<input type="submit" name="button1" value="Submit"/>
			</form>
			<%
			if("Submit".equals(request.getParameter("button1")))
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
				String sql = "UPDATE students " + 
						"	SET name = 'Scott' " + 
						"	WHERE ssn = 746897816";;
				stmt.executeUpdate(sql);
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
				response.sendRedirect("ModifyRecordsResult.jsp");
			}
			%>
</body>
</html>