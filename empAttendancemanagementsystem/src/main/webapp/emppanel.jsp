<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<% 
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/final_epdb","root","password");
	Statement st=con.createStatement();
	String dept=(String)session.getAttribute("dept");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
<style>
@import url("https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap");
body {
	background: #f9f9f9;
	font-family: "Roboto", sans-serif;
}

.main-content {
	padding-top: 100px;
	padding-bottom: 100px;
}

.leaderboard-card {
	background: #fff;
	margin-bottom: 30px;
	border-radius: 5px;
	overflow: hidden;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}
.leaderboard-card.leaderboard-card--first {
	transform: scale(1.05);
}
.leaderboard-card.leaderboard-card--first .leaderboard-card__top {
	background: linear-gradient(45deg, #7e57c2, #ab47bc);
	color: #fff;
}
.leaderboard-card__top {
	background: #f9f6ff;
	padding: 20px 0 30px 0;
}
.leaderboard-card__body {
	padding: 15px;
	margin-top: -40px;
}

img.circle-img {
	height: 70px;
	width: 70px;
	border-radius: 70px;
	border: 3px solid #fff;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}
img.circle-img.circle-img--small {
	height: 55px;
	width: 55px;
	border-radius: 55px;
}

.table {
	border-spacing: 0 15px;
	border-collapse: separate;
}
.table thead tr th,
.table thead tr td,
.table tbody tr th,
.table tbody tr td {
	vertical-align: middle;
	border: none;
}
.table thead tr th:nth-last-child(1),
.table thead tr td:nth-last-child(1),
.table tbody tr th:nth-last-child(1),
.table tbody tr td:nth-last-child(1) {
	text-align: center;
}
.table tbody tr {
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}
.table tbody tr td {
	background: #fff;
}
.table tbody tr td:nth-child(1) {
	border-radius: 5px 0 0 5px;
}
.table tbody tr td:nth-last-child(1) {
	border-radius: 0 5px 5px 0;
}
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark" >
  <a class="navbar-brand" href="#">Employee Attendance Monitoring System</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">Hello,<%=session.getAttribute("empname") %> <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="logout.jsp">Logout</a>
      </li>

    </ul>
  </div>
</nav>

 <h3 class="mb-4">Employee Attendance Details:</h3>
                     <table class="table">
                        <thead>
                           <tr>
                              <th scope="col">Date</th>
                              <th scope="col">Status</th>
                           </tr>
                        </thead>
                        <tbody>
                         <%
							Statement ast=con.createStatement();
                        	ResultSet rst=ast.executeQuery("select * from attendance where empname=\""+(String)session.getAttribute("empname")+"\";");
                        	while(rst.next()){
                        %>
                           <tr>
                              <th scope="row"><%=rst.getString(1)%></th>
                              <td><%=rst.getString(4)%></td>
                           </tr>
                          <%} %>
                        </tbody>
                     </table>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>

