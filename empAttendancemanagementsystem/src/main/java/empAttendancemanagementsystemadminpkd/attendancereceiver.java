package empAttendancemanagementsystemadminpkd;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.*;
/**
 * Servlet implementation class attendancereceiver
 */
public class attendancereceiver extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

     	try {
    		Connection con=dbConnection.getconnection();
    		Statement st=con.createStatement();
    		HttpSession ses=request.getSession();
    		String datum=request.getParameter("date");
    		Statement st2=con.createStatement();
    		String dept=(String)ses.getAttribute("dept");
    		ResultSet rscount=st2.executeQuery("select count(*) from attendance where atttakendate=\""+datum+"\" and dept=\""+dept+"\";");
    		int count=0;
    		while(rscount.next())
    		{
    			count=rscount.getInt(1);
    		}
    		
    		ResultSet rs=st.executeQuery("select * from employee where empdep=\""+dept+"\" and adminstaff=0;");
    		String name="";
    		long millis=System.currentTimeMillis();  
			Date date=new Date(millis);  
			System.out.println(count);
         	while(rs.next()){
         		name=rs.getString(2);
         		if(count==0)
         		{
	         		PreparedStatement pst=con.prepareStatement("insert into attendance(atttakendate, dept, empname, statuss) values(?,?,?,?);");
	         		pst.setString(1, datum);
	         		pst.setString(2, dept);
	         		pst.setString(3, name);
	         		String a=request.getParameter(name);
	         		if(a==null)
	         		{
	         			pst.setBoolean(4, false);
	         		}
	         		else
	         		{
	         			pst.setBoolean(4, true);
	         		}
	         		pst.executeUpdate();
         		}
         		else
         		{
         			PreparedStatement pstupdate=con.prepareStatement("update attendance set statuss=? where atttakendate=\""+datum+"\" and dept=\""+dept+"\";");
         			String upa=request.getParameter(name);
         			if(upa==null)
	         		{
	         			pstupdate.setBoolean(1, false);
	         		}
	         		else
	         		{
	         			pstupdate.setBoolean(1, true);
	         		}
	         		pstupdate.executeUpdate();
         		}
         	}
         	response.sendRedirect("adiminstaffdashboard.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
