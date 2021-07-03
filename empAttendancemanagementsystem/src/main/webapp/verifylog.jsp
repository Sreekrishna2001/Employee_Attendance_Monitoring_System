<%@ page import="java.sql.* , java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>


<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_epdb","root","password");
	
	System.out.println("Connection Success");
	
	String username = request.getParameter("empemail");
	String password = request.getParameter("empdob");
	if(username.equals("admin@gmail.com") && password.equals("admin")){
		session.setAttribute("empname", "admin");
		String d=(String)session.getAttribute("dept");
		if(d!=null)
		{
			session.removeAttribute("dept");
		}
		response.sendRedirect("adminpanel.jsp");
	}
	else{
	
	PreparedStatement pstmt = con.prepareStatement("select * from employee where empemail=? and empdob=? ");
	pstmt.setString(1, username);
	pstmt.setString(2,password);	
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next())
	{
		System.out.println(rs.getString(2));
		if (rs.getBoolean(8)){
			session.setAttribute("empname", rs.getString(2));
			session.setAttribute("dept", rs.getString(7));
			
			response.sendRedirect("adiminstaffdashboard.jsp");
		}
		else{
		session.setAttribute("empname", rs.getString(2));
		response.sendRedirect("emppanel.jsp");
		}
	}
	
	else {
		out.println("Login Failed <a href='index.jsp'>Home</a>");
	}
			
	
	}
	
}

catch(Exception e)
{
	
	System.out.println(e);
	
	
}


%>