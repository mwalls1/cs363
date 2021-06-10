package Project1p2;
import java.sql.*;
public class ModifyRecords {
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
			
			String sql = "UPDATE students " + 
					"	SET name = 'Scott' " + 
					"	WHERE ssn = 746897816";
			stmt.executeUpdate(sql);
			
			sql = "UPDATE major " + 
					"	SET name = 'Computer Science', level = 'MS' " + 
					"    WHERE snum = (SELECT s.snum " + 
					"					FROM students s" + 
					"					WHERE s.ssn = 746897816)";
			stmt.executeUpdate(sql);
			
			sql = "DELETE " + 
					"	FROM register " + 
					"    WHERE regtime = 'Spring2021'";
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
		
	}
	
}
