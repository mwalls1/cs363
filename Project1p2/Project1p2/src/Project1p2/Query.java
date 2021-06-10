package Project1p2;
import java.sql.*;
public class Query {
	//Database driver and url
	static final String jdbcDriver = "com.mysql.cj.jdbc.Driver";
	static final String dbUrl = "jdbc:mysql://localhost:3306/project1p2";
	
	//Database login info
	static final String user = "COMS363";
	static final String pass = "SPRING2021";
	
	public static void main(String[] args)
	{
		Connection conn = null;
		Statement stmt = null;
		try {
			
			Class.forName(jdbcDriver);
			
			conn = DriverManager.getConnection(dbUrl, user, pass);
			
			stmt = conn.createStatement();
			String outputString = "";
			String sql = "SELECT s.snum, s.ssn FROM students s " + 
					"	WHERE name = 'Becky'";
			ResultSet results = stmt.executeQuery(sql);
			while(results.next()) {
				outputString += results.getInt("snum") + "....";
				outputString += results.getInt("ssn") + "\n";
			}
			System.out.println(outputString);
			
			outputString = "";
			sql = "SELECT m.name, m.level " + 
					"	FROM major m " + 
					"	JOIN students s on m.snum = s.snum " + 
					"	WHERE s.ssn = 123097834";
			results = stmt.executeQuery(sql);
			while(results.next()) {
				outputString += results.getString("name") + "....";
				outputString += results.getString("level") + "\n";
			}
			System.out.println(outputString);
			
			outputString = "";
			sql = "SELECT c.name" + 
					"	FROM courses c " + 
					"    JOIN departments d on c.department_code = d.code " + 
					"    WHERE d.name = 'Computer Science'";
			results = stmt.executeQuery(sql);
			while(results.next()) {
				outputString += results.getString("name") + "\n";
			}
			System.out.println(outputString);
			
			
			outputString = "";
			sql = "SELECT d.name, d.level" + 
					"	FROM degrees d " + 
					"    JOIN departments f on d.department_code = f.code " + 
					"    WHERE f.name = 'Computer Science'";
			results = stmt.executeQuery(sql);
			while(results.next()) {
				outputString += results.getString("name") + "....";
				outputString += results.getString("level") + "\n";
			}
			System.out.println(outputString);
			
			outputString = "";
			sql = "SELECT s.name" + 
					"	FROM students s" + 
					"   JOIN minor m on s.snum = m.snum";
			results = stmt.executeQuery(sql);
			while(results.next()) {
				outputString += results.getString("name") + "\n";
			}
			System.out.println(outputString);
			
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
		
	}
	
}
