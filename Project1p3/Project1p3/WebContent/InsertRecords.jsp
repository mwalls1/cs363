<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Records</title>
</head>
	<body>
		<p>Click "Submit" to insert records.</p>
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
				String sql = "INSERT INTO students " + 
						"	VALUES" + 
						"    (1001,654651234, 'Randy','M','2000-12-01','301 E Hall','5152700988','121 Main','7083066321'), " + 
						"    (1002,123097834,'Victor','M','2000-05-06','270 W Hall','5151234578','702 Walnut','7080366333'), " + 
						"    (1003,978012431,'John','M','1999-07-08','201 W Hall','5154132805','888 University','5152012011'), " + 
						"    (1004,746897816,'Seth','M','1998-12-30','199 N Hall','5158891504','21 Green','5154132907'), " + 
						"    (1005,186032894,'Nicole','F','2001-04-01','178 S Hall','5158891155','13 Gray','5157162071'), " + 
						"    (1006,534218752,'Becky','F','2001-05-16','12 N Hall','5157083698','189 Clark','2034367632'), " + 
						"    (1007,432609519,'Kevin','M','2000-08-12','75 E Hall','5157082497','89 Nationa','7182340772')";
				stmt.executeUpdate(sql);
				sql = "INSERT INTO departments " + 
						"	VALUES " + 
						"    (401,'Computer Science','5152982801','LAS'), " + 
						"    (402,'Mathematics','5152982802','LAS'), " + 
						"    (403,'Chemical Engineering','5152982803','Engineering'), " + 
						"    (404,'Landscape Architect','5152982804','Design')";
				stmt.executeUpdate(sql);
				sql = "INSERT INTO degrees " + 
						"	VALUES " + 
						"	( 'Computer Science ', 'BS ',401), " + 
						"	( 'Software Engineering ', 'BS ',401), " + 
						"	( 'Computer Science ', 'MS ',401), " + 
						"	( 'Computer Science ', 'PhD ',401), " + 
						"	( 'Applied Mathematics ', 'MS ',402), " + 
						"	( 'Chemical Engineering ', 'BS ',403), " + 
						"	( 'Landscape Architect ', 'BS ',404)";
				stmt.executeUpdate(sql);
				sql = "INSERT INTO major " + 
						"	VALUES " + 
						"    (1001,'Computer Science','BS'), " + 
						"    (1002,'Software Engineering','BS'), " + 
						"    (1003,'Chemical Engineering','BS'), " + 
						"    (1004,'Landscape Architect','BS'), " + 
						"    (1005,'Computer Science','MS'), " + 
						"    (1006,'Applied Mathematics','MS'), " + 
						"    (1007,'Computer Science','PhD')";
				stmt.executeUpdate(sql);
				sql = "INSERT INTO minor " + 
						"	VALUES " + 
						"	(1007, 'Applied Mathematics ', 'MS '), " + 
						"	(1005, 'Applied Mathematics ', 'MS '), " + 
						"	(1001, 'Software Engineering ', 'BS ')";
				stmt.executeUpdate(sql);
				sql = "INSERT INTO courses " + 
						"	VALUES " + 
						"    (113,'Spreadsheet','Microsoft Excel and Access',3,'Undergraduate',401), " + 
						"    (311,'Algorithm','Design and Analysis',3,'Undergraduate',401), " + 
						"    (531,'Theory of Computation','Theorem and Probability',3,'Graduate',401), " + 
						"    (363,'Database','Design Principle',3,'Undergraduate',401), " + 
						"    (412,'Water Management','Water Management',3,'Undergraduate',404), " + 
						"    (228,'Special Topics','Interesting Topics about CE',3,'Undergraduate',403), " + 
						"    (101,'Calculus','Limit and Derivative',4,'Undergraduate',402)";
				stmt.executeUpdate(sql);
				sql = "INSERT INTO register " + 
						"	VALUES " + 
						"    (1001,363,'Fall2020',3), " + 
						"	(1002,311,'Fall2020',4), " + 
						"	(1003,228,'Fall2020',4), " + 
						"    (1004,363,'Spring2021',3), " + 
						"	(1005,531,'Spring2021',4), " + 
						"    (1006,363,'Fall2020',3), " + 
						"    (1007,531,'Spring2021',4)";
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
				response.sendRedirect("InsertRecordsResult.jsp");
			}
			%>
	</body>
</html>