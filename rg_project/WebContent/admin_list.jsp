<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Collection" %>

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
                        <th scope="col">Admin ID</th>
                        <th scope="col">Admin Role</th>
                        <th scope="col">Name</th>
                        <th scope="col">Username</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Email</th>
                        <th scope="col">Phone Number</th>
                        <th scope="col">City</th>
                     </tr>
                  </thead>
                  <tbody>
                  <%

                  Collection <AdminRegBean> admins = (Collection) request.getAttribute("admins");
                  for(AdminRegBean ad : admins){
                  
                  %>
                     <tr>
                        <th scope="row"><%= ad.getUid() %></th>
                        <td><%= ad.getRname() %></td>
                        <td><%= ad.getName() %></td>
                        <td><%= ad.getUsername() %></td>
                        <td><%= ad.getGender() %></td>
                        <td><%= ad.getEmail() %></td>
                        <td><%= ad.getPhone() %></td>
                        <td><%= ad.getCity() %></td>
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