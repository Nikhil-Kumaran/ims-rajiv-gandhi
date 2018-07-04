<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="header.html" %> 
    <title>Admin Registration</title>
</head>
<body>
<%@ include file="adminses.jsp" %>
<% ArrayList <String> roles = (ArrayList)request.getAttribute("roles");
%>
<%@ include file="admin-template.jsp" %> 
	<div class="col-10" id="content">
		<h2>Admin Registration</h2>
		<div class="container">
               <form action="AdminRegistration" method="POST">
                  <div class="form-row">
                     <div class="form-group col-md-6">
                        <label for="name">Name</label>
                        <input type="text" name="name" class="form-control" id="name" placeholder="Name">
                     </div>
                     <!-- <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Dropdown button
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                          <a class="dropdown-item" href="#">Action</a>
                          <a class="dropdown-item" href="#">Another action</a>
                          <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                      </div> -->
                     <div class="form-group col-md-6">
                        <label for="username">User Name</label>
                        <input type="text" name="username" class="form-control" id="uname" placeholder="UserName">
                     </div>
                     <div class="form-group col-md-6">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" name="email" placeholder="Email">
                     </div>
                     <div class="form-group col-md-6">
                     <label for="password">Password</label>
                     <input type="password" class="form-control" name="password" placeholder="Password">
                     </div>
                     <!-- <div class="form-group col-md-6">
                        <label for="department">Department</label>
                        <select id="department" class="form-control">
                           <option selected>Choose...</option>
                           <option>...</option>
                           <option>...</option>
                           <option>...</option>
                           <option>...</option>
                        </select>
                     </div> -->
                     <div class="form-group col-md-6">
                        <label for="role">Admin Role</label>
                        <select name="rname" class="form-control">
                        <% for(String s : roles){ %>
                           <option ><%=s %></option>
                           <%} %>
                        </select>
                     </div>
                     <div class="form-group col-md-6">
                      <label for="gender">Gender</label>
                      <select name="gender" class="form-control">
                         <option selected>Choose...</option>
                         <option>M</option>
                         <option>F</option>
                      </select>
                      </div>
                     <div class="form-group col-md-6">
                        <label for="phone">Phone</label>
                        <input type="number" class="form-control" name="phone" placeholder="Phone Number">
                     </div>
                     <div class="form-group col-md-6">
                      <label for="address">Address</label>
                      <textarea class="form-control" name="address" rows="3"></textarea>
                    </div>
                     <div class="form-group col-md-6">
                      <label for="city">City</label>
                      <input type="text" class="form-control" name="city" placeholder="city">
                    </div>
                    <div class="form-group col-md-6">
                    <label for="country">country</label>
                    <input type="text" class="form-control" name="country" placeholder="country">
                    </div>
                     <button type="submit" class="btn btn-primary col-2 offset-md-5">Add Admin</button>
                  </div>
                  
               </form>
            </div>
	</div>    
</div>
</div>
<!-- <center>
<h3>Admin Registration</h3>
<h4>${err}</h4>

<form action = "AdminRegistration" method = "POST">
    Name:<br>
    <input type="text" name="name"><br>
    User Name:<br>
    <input type="text" name="username"><br>
    Password:<br>
    <input type = "password" name = "password"><br>
    Gender:<br>
    <input type="text" name="gender"><br>
    Permission:<br>
    <input type="text" name="rid"><br>
    Phone:<br>
    <input type="text" name="phone"><br>
    Email ID:<br>
    <input type="email" name="email"><br>
    Address:<br>
    <input type="text" name="address"><br>
    City:<br>
    <input type="text" name="city"><br>
    Country:<br>
    <input type="text" name="country"><br>
    <input type = "submit" value = "Register">
  </form>
</center> -->
	<%@ include file="footer.html" %> 
</body>
</html>