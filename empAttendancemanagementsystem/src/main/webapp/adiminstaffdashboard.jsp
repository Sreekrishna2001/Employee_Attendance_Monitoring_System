<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<% 
	String use=(String)session.getAttribute("empname");
	if(use==null)
	{
		response.sendRedirect("login.jsp");	
	}
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/final_epdb","root","password");
	Statement st=con.createStatement();
	String dept=(String)session.getAttribute("dept");
%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <title>Admin Staff Dashboard</title>
      <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
      <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" type="text/css" href="css/style.css">
   </head>
   <body>
 	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" ">
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
                        <img src="data:image/png;base64,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" alt="Image" class="shadow">
                     </div>
                     <h4 class="text-center">Hello <%=session.getAttribute("empname") %></h4>
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
                     Attendance Management
                     </a>
                     <a class="nav-link"  href="logout.jsp" >
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
                                 <label>Id Number</label>
                                 <input type="number" name="empid"  class="form-control" required>
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label>Name</label>
                                 <input type="text" name="empname" class="form-control" required>
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label>Email</label>
                                 <input type="email" name="empemail"  class="form-control" required >
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label>Age</label>
                                 <input type="text" name="empage" class="form-control" required>
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label>Gender</label><br>
                                 <select style="height:35px;width: 100%" class="form-select" name="empgender" aria-label="Default select example" required>
                                    <option selected>Open this select menu</option>
                                    <option value="1">Male</option>
                                    <option value="2">Female</option>
                                 </select>
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label>DOB</label>
                                 <input type="date" name="empdob" class="form-control" required>
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label>DEPARTMENT</label>
                                 <input type="text" name="empdep" class="form-control" value="<%=dept %>" disabled required>
                              </div>
                           </div>
                           <div class="col-md-6">
							<input name="adminstaff" value="No" hidden/>
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
                              <th scope="col">Id</th>
                              <th scope="col">name</th>
                              <th scope="col">Email</th>
                              <th scope="col">Age</th>
                           </tr>
                        </thead>
                        <tbody>
                        <%
							Statement ast=con.createStatement();
                        	ResultSet rst=ast.executeQuery("select * from employee where empdep=\""+dept+"\";");
                        	while(rst.next()){
                        %>
                           <tr>
                              <th scope="row"><%=rst.getInt(1) %></th>
                              <td><%=rst.getString(2) %></td>
                              <td><%=rst.getString(3) %></td>
                              <td><%=rst.getString(4) %></td>
                           </tr>
                         <%} %>
                        </tbody>
                     </table>
                  </div>
                  <div class="tab-pane fade" id="application" role="tabpanel" aria-labelledby="application-tab">
                     <h3 class="mb-4">Attendance Management</h3>
                     <div>
                        <form class="totalform" action="./attendancereceivers" method="post">
                           <span>&nbsp;</span>
                           <h2 style=" margin-top: 8px; margin-bottom: 20px">
                              Attendance on <input type="date" class="form-control" name="date" required>
                           </h2>
                           <table class="attendance" rowspan="20px" padding="13px" border="1px" style="width:100vh">
                              <div>
                                 <tr>
                                    <th>Employee Name</th>
                                    <th>Attendance Status</th>
                                 </tr>
                                 <% 
                                  	ResultSet rs=st.executeQuery("select * from employee where empdep=\""+dept+"\" and adminstaff=0;");
                                 	while(rs.next()){
                                  %>
                                 <tr>
                                    <td><%=rs.getString(2) %></td>
                                    <td>
                                       <label class="seperate">               
                                       <input type="checkbox" style="text-align:center;" name="<%=rs.getString(2) %>" />
                                       <span class="checkmark"></span>
                                       </label>
                                    </td>
                                 </tr>
                                 <%} %>
                              </div>
                           </table>
                           <br />
                           <div id="button">
                              <input type="submit" value="submit" id="sub" />
                              <input type="reset" id="res" />
                           </div>
                        </form>
                     </div>
                  </div>
                  <div class="tab-pane fade" id="notification" role="tabpanel" aria-labelledby="notification-tab">
                     <h3 class="mb-4">Attendance Report</h3>
                     <div class="form-group">
                        <div class="form-check">
                           <input class="form-check-input" type="checkbox" value="" id="notification1">
                           <label class="form-check-label" for="notification1">
                           Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum accusantium accusamus, neque cupiditate quis
                           </label>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="form-check">
                           <input class="form-check-input" type="checkbox" value="" id="notification2" >
                           <label class="form-check-label" for="notification2">
                           hic nesciunt repellat perferendis voluptatum totam porro eligendi.
                           </label>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="form-check">
                           <input class="form-check-input" type="checkbox" value="" id="notification3" >
                           <label class="form-check-label" for="notification3">
                           commodi fugiat molestiae tempora corporis. Sed dignissimos suscipit
                           </label>
                        </div>
                     </div>
                     <div>
                        <button class="btn btn-primary">Update</button>
                        <button class="btn btn-light">Cancel</button>
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