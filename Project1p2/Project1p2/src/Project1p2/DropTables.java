package Project1p2;
import java.sql.*;
public class DropTables {
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
			
			String sql = "DROP TABLE minor,major,register,courses,degrees,departments,students";
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
