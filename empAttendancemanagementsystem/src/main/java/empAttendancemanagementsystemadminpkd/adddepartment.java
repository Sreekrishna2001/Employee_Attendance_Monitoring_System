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
 * Servlet implementation class adddepartment
 */
@WebServlet("/adddepartment")
public class adddepartment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Connection con = dbConnection.getconnection();
			System.out.println("hello");
			PreparedStatement ps=con.prepareStatement("insert into department(dapname,depdesc) values(?,?);");
			String depname= request.getParameter("depname");
			String depdesc=request.getParameter("depdesc");
			System.out.println(depname+depdesc);
			ps.setString(1, depname);
			ps.setString(2, depdesc);
			ps.executeUpdate();
			response.sendRedirect("adminpanel.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
