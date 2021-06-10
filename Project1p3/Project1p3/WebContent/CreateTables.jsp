<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Tables</title>
</head>
<body>
<p>Click "Submit" to create tables.</p>
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
				String sql = "CREATE TABLE students ("+
							 " snum integer, "+
							 " ssn integer,"+
							 " name varchar(10), "+
							 " gender varchar(1), "+
							 " dob datetime, "+
							 " c_addr varchar(20), "+
							 " c_phone varchar(10), "+
							 " p_addr varchar(20), "+
							 " p_phone varchar(10), "+
							 " PRIMARY KEY(ssn), "+
							 " UNIQUE(snum))";
				stmt.executeUpdate(sql);
				sql = "CREATE TABLE departments ("+
						 " code integer, "+
						 " name varchar(50),"+
						 " phone varchar(10), "+
						 " college varchar(20), "+
						 " PRIMARY KEY(code), "+
						 " UNIQUE(name))";
				stmt.executeUpdate(sql);
				sql = "CREATE TABLE degrees ("+
						 " name varchar(50), "+
						 " level varchar(5),"+
						 " department_code integer, "+
						 " PRIMARY KEY(name, level), "+
						 " FOREIGN KEY(department_code) REFERENCES departments(code))";
				stmt.executeUpdate(sql);
				sql = "CREATE TABLE courses ("+
						 " number integer, "+
						 " name varchar(50),"+
						 " description varchar(50), "+
						 " credithours integer, "+
						 " level varchar(20), "+
						 " department_code integer,"+ 
						 " PRIMARY KEY(number), "+
						 " FOREIGN KEY(department_code) REFERENCES departments(code))";
				stmt.executeUpdate(sql);
				sql = "CREATE TABLE register ("+
						 " snum integer, "+
						 " course_number integer,"+
						 " regtime varchar(20), "+
						 " grade integer, "+
						 " PRIMARY KEY(snum, course_number), "+
						 " FOREIGN KEY(snum) REFERENCES students(snum), "+
						 " FOREIGN KEY(course_number) REFERENCES courses(number))";
				stmt.executeUpdate(sql);
				sql = "CREATE TABLE major ("+
						 " snum integer, "+
						 " name varchar(50),"+
						 " level varchar(5), "+
						 " PRIMARY KEY(snum, name, level), "+
						 " FOREIGN KEY(snum) REFERENCES students(snum), "+
						 " FOREIGN KEY(name,level) REFERENCES degrees(name,level))";
				stmt.executeUpdate(sql);
				sql = "CREATE TABLE minor ("+
						 " snum integer, "+
						 " name varchar(50),"+
						 " level varchar(5), "+
						 " PRIMARY KEY(snum, name, level), "+
						 " FOREIGN KEY(snum) REFERENCES students(snum), "+
						 " FOREIGN KEY(name,level) REFERENCES degrees(name,level))";
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
				response.sendRedirect("CreateTablesResult.jsp");
			}
			%>
</body>
</html>