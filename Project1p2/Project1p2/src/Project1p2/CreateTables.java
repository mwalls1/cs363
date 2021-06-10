package Project1p2;
import java.sql.*;
public class CreateTables {
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
		
	}
	
}
