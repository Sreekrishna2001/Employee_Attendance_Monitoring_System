<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<% 
	String use=(String)session.getAttribute("empname");
	String selecteddate=(String)session.getAttribute("selecteddate");
	System.out.println(selecteddate);
	if(use==null)
	{
		response.sendRedirect("login.jsp");	
	}
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/final_epdb","root","password");
	Statement st=con.createStatement();
%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <title>Admin Dashboard</title>
      <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
      <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" type="text/css" href="css/style.css">
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
      <section style="padding-top:7vh;width: 90%;margin: auto;" >
         <div  >
            <div class="bg-white shadow rounded-lg d-block d-sm-flex">
               <div class="profile-tab-nav border-right">
                  <div class="p-4">
                     <div class="img-circle text-center mb-3">
                        <img src="https://www.wpeka.com/rgh/wp-content/uploads/2014/03/Changing-the-default-admin-user-in-WordPress1-e1462965535256.jpg" alt="Image" class="shadow">
                     </div>
                     <h4 class="text-center">Hello admin</h4>
                  </div>
                  <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                     <a class="nav-link active" id="account-tab" data-toggle="pill" href="#account" role="tab" aria-controls="account" aria-selected="true">
                     <i class="fa fa-home text-center mr-1"></i> 
                     Add Employee
                     </a>
                     <a class="nav-link" id="password-tab" data-toggle="pill" href="#password" role="tab" aria-controls="password" aria-selected="false">
                     <i class="fa fa-key text-center mr-1"></i> 
                     Employee/staff details
                     </a>
                     <a class="nav-link" id="application-tab" data-toggle="pill" href="#application" role="tab" aria-controls="application" aria-selected="false">
                     <i class="fa fa-tv text-center mr-1"></i> 
                     Add Department
                     </a>
                     <a class="nav-link" id="notification-tab" data-toggle="pill" href="#notification" role="tab" aria-controls="notification" aria-selected="false">
                     <i class="fa fa-bell text-center mr-1"></i> 
                     Attendance Report
                     </a>
                     <a class="nav-link"  href="logout.jsp"  aria-controls="notification" aria-selected="false">
                     <i class="fa fa-bell text-center mr-1"></i> 
                     LogOut
                     </a>
                  </div>
               </div>
               <div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
                  <div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
                     <h3 class="mb-4">Add Employee</h3>
                     <form action="addemployee" method="POST">
                        <div class="row">
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label>Employee id</label>
                                 <input type="number" name="empid"  class="form-control" required>
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label>Employee name</label>
                                 <input type="text" name="empname" class="form-control" required>
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label>Employee Email</label>
                                 <input type="email" name="empemail"  class="form-control" required >
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label>Employee Age</label>
                                 <input type="text" name="empage" class="form-control" required>
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label>Employee Gender</label>
                                 <select class="form-select" name="empgender" style="height:35px;width: 100%" aria-label="Default select example" username>
                                    <option selected>Open this select menu</option>
                                    <option value="1">Male</option>
                                    <option value="2">Female</option>
                                 </select>
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label>Employee DOB</label>
                                 <input type="date" name="empdob" class="form-control" required>
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label>Employee Dept</label>
                                 <select class="form-select" style="height:35px;width: 100%" name="empdep"  aria-label="Default select example" required>
                                 	<option selected>Open this select menu</option>
                                 	<%
                                 		ResultSet rs=st.executeQuery("select * from department");
                                 		while(rs.next()){
                                 	%>
                                    <option value="<%=rs.getString(2) %>"><%=rs.getString(2) %></option>
                                    <%} %>
                                 </select>
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label>Adminstaff</label>
                                 <select class="form-select" style="height:35px;width: 100%" name="adminstaff" aria-label="Default select example" required >
                                    <option selected>Open this select menu</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                 </select>
                              </div>
                           </div>
                        </div>
                        <div>
                           <button class="btn btn-primary" type="submit" >Submit</button>
                           <button class="btn btn-light">Back</button>
                        </div>
                  </div>
                  </form>
                  <div class="tab-pane fade" id="password" role="tabpanel" aria-labelledby="password-tab">
                     <h3 class="mb-4">Employee Details</h3>
                     <table class="table">
                        <thead>
                           <tr>
                              <th scope="col">ID</th>
                              <th scope="col">Name</th>
                              <th scope="col">Email</th>
                              <th scope="col">Age</th>
                              <th>Action</th>
                           </tr>
                        </thead>
                        <tbody>
                         <%
							Statement ast=con.createStatement();
                        	ResultSet rst=ast.executeQuery("select * from employee;");
                        	while(rst.next()){
                        %>
                           <tr>
                              <th scope="row"><%=rst.getInt(1)%></th>
                              <td><%=rst.getString(2)%></td>
                              <td><%=rst.getString(3)%></td>
                              <td><%=rst.getString(4)%></td>
                              <td><a class="btn btn-danger" href="delete_emp.jsp?empid=<%=rst.getInt(1)%>">Delete</a></td>
                              
                           </tr>
                          <%} %>
                        </tbody>
                     </table>
                  </div>
                  
                  <div class="tab-pane fade" id="application" role="tabpanel" aria-labelledby="application-tab">
                     <h3 class="mb-4">Add Department</h3>
                     <form action="adddepartment" method="post">
                     <div class="row">
                        <div class="col-md-6">
                           <div class="form-group">
                              <div class="form-group">
                                 <label>Dapertment Name</label>
                                 <input class="form-control" type="text" name="depname"  placeholder="departentname" required>

                              </div>
                              <div class="form-group">
                              	<label>Description</label>
                                 <textarea class="form-control" type="text" name="depdesc" placeholder="description" required></textarea>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div>
                        <button class="btn btn-primary" type="submit">Submit</button>
                        <span class="btn btn-light">Cancel</span>
                     </div>
                  </form>
                  </div>
                  <div class="tab-pane fade" id="notification" role="tabpanel" aria-labelledby="notification-tab">
                     <h3 class="mb-4">Attendance Report</h3>
                    <div>
                        <div>
                           <span>&nbsp;</span>
                           <h2 style=" margin-top: 8px; margin-bottom: 20px">
                           <% 
                           	if(selecteddate==null)
                           	{
                           %>
                           	  <form action="admin_selected_date.jsp">
                              Attendance on <input type="date" class="form-control" name="selecteddate" required>
                              <button type="submit" class="btn btn-primary"> Check</button>
                              </form>
                            <%}else{ %>
                            	<form action="admin_selected_date.jsp">
                              	Attendance on <%=selecteddate %>
                              	<input type="date" class="form-control" value="selecteddate" name="selecteddate" required>
                              	<button type="submit" class="btn btn-primary"> Check</button>
                              </form>
                            <%} %>

                           </h2>
                           <table class="attendance" rowspan="20px" padding="13px" border="1px" style="width:100vh">
                              <div>
                                 <tr>
                                    <th>Employee Name</th>
                                    <th>Attendance Status</th>
                                 </tr>
                                 <% 
                                  	ResultSet report=st.executeQuery("select * from attendance where atttakendate=\""+selecteddate+"\";");
                                 	while(report.next()){
                                  %>
                                 <tr>
                                    <td><%=report.getString(3) %></td>
                                    <td>
                                       <label class="seperate">  
                                       <%
                                       	if(report.getInt(4)==1){
                                       %>
                                       Present
                                       <%}else{ %>
                                       Absent 
                                       <%} %>
                                       </label>
                                    </td>
                                 </tr>
                                 <%} %>
                              </div>
                           </table>
                           <br />
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
   </body>
</html>