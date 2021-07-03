package empAttendancemanagementsystemadminpkd;
import java.sql.*;

public class dbConnection
{
	public static String username="root";
	public static String passwordDB="password";
	public static String url="jdbc:mysql://localhost:3306/final_epdb";
	public static Connection getconnection() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,username,passwordDB);
		System.out.println("database Was Connected!!!!!");
		return con;
	}	
}
