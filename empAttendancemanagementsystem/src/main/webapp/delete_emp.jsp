<%@ page import="java.sql.* , java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_epdb","root","password");
	
	String id=request.getParameter("empid");
	Statement st=con.createStatement();
	st.executeUpdate("delete from employee where empid="+id);
	response.sendRedirect("adminpanel.jsp");
}

catch(Exception e)
{
	System.out.println(e);
}


%>