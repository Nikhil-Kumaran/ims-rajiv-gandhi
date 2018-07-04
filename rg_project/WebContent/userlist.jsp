<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Collection" %>
<%@ page import="userreg.UserRegBean" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="header.html" %> 
<title>Admin List</title>

</head>
<body>
<%@ include file="adminses.jsp" %>
	<%@ include file="admin-template.jsp" %>
	<div class="col-10" id="content">
            <div class="container">
               <table class="table">
                  <thead>
                     <tr>
                        <th scope="col">Customer ID</th>
                        <th scope="col">Designation</th>
                        <th scope="col">Name</th>
                        <th scope="col">Username</th>
                        <th scope="col">Department</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Email</th>
                        <th scope="col">Phone Number</th>
                        <th scope="col">City</th>

                     </tr>
                  </thead>
                  <tbody>
                  <%
                  Collection <UserRegBean> users = (Collection) request.getAttribute("users");
                  for(UserRegBean u : users){
                  
                  %>
                     <tr>
                        <th scope="row"><%= u.getCustid() %></th>
                        <td><%= u.getDesig() %></td>
                        <td><%= u.getName() %></td>
                        <td><%= u.getUsername() %></td>
                        <td><%= u.getDeptname() %></td>
                        <td><%= u.getGender() %></td>
                        <td><%= u.getEmail() %></td>
                        <td><%= u.getPhone() %></td>
                        <td><%= u.getCity() %></td>
                     </tr>
                  <%
                  }
                  %>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </div>
   <%@ include file="footer.html" %> 
</body>
</html>