<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="user_complaints. ComplaintBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="header.html" %> 
<title>Complaint history</title>
</head>
<body>
<%@ include file="userses.jsp" %>
	<%@ include file="user_template.jsp" %>
	<div class="col-10" id="content">
            <div class="container">
            <h1 style="text-align:center">My Complaint</h1>
		<ul class="nav nav-tabs" id="myTab" role="tablist">
                  <li class="nav-item">
                     <a class="nav-link active" id="all-tab" data-toggle="tab" href="#all" role="tab" aria-controls="home" aria-selected="true">All</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" id="pending-tab" data-toggle="tab" href="#pending" role="tab" aria-controls="profile" aria-selected="false">Pending</a>
                  </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                  <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="home-tab">
               <table class="table">
                  <thead>
                    <tr>
	  	<th>TransactionID</th>
	    <th>Complaint Status</th>
	    <th>Complaint Description</th> 
	    <th>Admin Reply</th>
	  </tr>
                  </thead>
                  <tbody>
                  <%
	
	Collection <ComplaintBean> complaint_list = (Collection) request.getAttribute("UserViewComplaints");
	for(ComplaintBean cb : complaint_list){
		
	%>
                     <tr>
	  	<td><%= cb.getTransid() %></td>
	  	<td><%= cb.getStatus() %></td>
	    <td><%= cb.getComplaint_description() %></td>
	    <td><%= cb.getAdmin_reply() %></td>
	  </tr>
                  <%
                  }
                  %>
                  </tbody>
               </table>
               </div>
               
               
               <div class="tab-pane fade show " id="pending" role="tabpanel" aria-labelledby="home-tab">
               <table class="table">
                  <thead>
                    <tr>
	  	<th>TransactionID</th>
	    <th>Complaint Status</th>
	    <th>Complaint Description</th> 
	    <th>Admin Reply</th>
	  </tr>
                  </thead>
                  <tbody>
                  <%
	
	
	for(ComplaintBean cb : complaint_list){
		if(cb.getStatus().equals("pending")){
	%>
                     <tr>
	  	<td><%= cb.getTransid() %></td>
	  	<td><%= cb.getStatus() %></td>
	    <td><%= cb.getComplaint_description() %></td>
	    <td><%= cb.getAdmin_reply() %></td>
	  </tr>
                  <%
                  }
	}
                  %>
                  </tbody>
               </table>
               </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <%@ include file="footer.html" %> 
</body>
</html>