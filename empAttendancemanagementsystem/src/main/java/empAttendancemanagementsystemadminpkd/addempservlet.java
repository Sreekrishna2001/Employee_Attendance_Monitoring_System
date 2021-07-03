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
 * Servlet implementation class addempservlet
 */

public class addempservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection con = dbConnection.getconnection();
			HttpSession session=request.getSession();
			PreparedStatement ps=con.prepareStatement("insert into employee values(?,?,?,?,?,?,?,?);");
			String id= request.getParameter("empid");
			int empd=Integer.parseInt(id);
			String empname=request.getParameter("empname");
			String empemail=request.getParameter("empemail");
			String empage=request.getParameter("empage");
			String empgender=request.getParameter("empgender");
			String empdob=request.getParameter("empdob");
			String empdep=request.getParameter("empdep");
			
			String staff=request.getParameter("adminstaff");
			boolean adminstaff;
			System.out.println(empdep);
			if(staff.equals("Yes"))
			{
				adminstaff=true;
			}
			else {
				adminstaff = false;
			}
			if(empdep==null)
			{
				empdep=(String)session.getAttribute("dept");
			}
			ps.setInt(1, empd);
			ps.setString(2, empname);
			ps.setString(3, empemail);
			ps.setString(4, empage);
			ps.setString(5, empgender);
			ps.setString(6, empdob);
			ps.setString(7, empdep);
			ps.setBoolean(8, adminstaff);
			ps.executeUpdate();
			String abc=(String)session.getAttribute("empname");
			if (abc.equals("admin"))
				response.sendRedirect("adminpanel.jsp");
			else
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
