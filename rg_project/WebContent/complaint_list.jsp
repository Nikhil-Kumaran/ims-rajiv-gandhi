<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="user_complaints. ComplaintBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="header.html" %> 
<title>Complaints</title>
<script>
$(document).ready(function(){
	console.log("hello");
		$(".rp").click(function(){
			var cid = $($(this).parent().parent().children()[0]).text();
			var input = document.createElement("input");

	   		input.setAttribute("type", "hidden");

	   		input.setAttribute("name", "cid");

	   		input.setAttribute("value", cid);

	   		$('.hid1').append(input);

		});
		$(".butn").click(function(){
			var replytext = $("#replytext").val();
			var input = document.createElement("input");

	   		input.setAttribute("type", "hidden");

	   		input.setAttribute("name", "replytext");

	   		input.setAttribute("value", replytext);

	   		$('.hid1').append(input);
	   		var x = document.getElementsByClassName("hid1");
	   		x[0].submit();// Form submission

		});
		$('.ig').click(function(){
			var cid = $($(this).parent().parent().children()[0]).text();
			//console.log(transid);
			var input = document.createElement("input");

	   		input.setAttribute("type", "hidden");

	   		input.setAttribute("name", "cid");

	   		input.setAttribute("value", cid);

	   		$('.hid').append(input);
	   		
	   		var x = document.getElementsByClassName("hid");
	   		x[0].submit();// Form submission
	   		
	   		
		});
		$('#myModal').on('shown.bs.modal', function () {
			  $('#myInput').trigger('focus')
			});
});
</script>
</head>
<body>
<%@ include file="adminses.jsp" %>
	<%@ include file="admin-template.jsp" %>
	<div class="col-10" id="content">
            <div class="container">
            <h1 style="text-align:center">Complaints</h1>
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
        <th>ComplaintID</th>  
	  	<th>TransactionID</th>
	    <th>Complaint Status</th>
	    <th>Complaint Description</th> 
	    <th>Admin Reply</th>
	  </tr>
                  </thead>
                  <tbody>
                  <%
	
	Collection <ComplaintBean> complaint_list = (Collection) request.getAttribute("complaints");
	for(ComplaintBean cb : complaint_list){
		
	%>
                     <tr>
        <td><%= cb.getCid() %></td>
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
        <th>ComplaintID</th>          
	  	<th>TransactionID</th>
	    <th>Complaint Status</th>
	    <th>Complaint Description</th> 
	    <th>Reply</th>
	    <th>Ignore</th>
	  </tr>
                  </thead>
                  <tbody>
                  <%
	
	
	for(ComplaintBean cb : complaint_list){
		if(cb.getStatus().equals("pending")){
	%>
                     <tr>
        <td><%= cb.getCid() %></td>
	  	<td><%= cb.getTransid() %></td>
	  	<td><%= cb.getStatus() %></td>
	    <td><%= cb.getComplaint_description() %></td>
	    <td><button type="button" class="btn rp" data-toggle="modal" data-target="#exampleModal">
  Reply
</button></td>
<td><button type="button" class="btn ig">
  Ignore
</button></td>
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
     <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Reply</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="form-group">
    <label for="exampleFormControlTextarea1">Your Reply</label>
    <textarea class="form-control" id="replytext" rows="5"></textarea>
  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-primary butn">Reply</button>
      </div>
    </div>
  </div>
</div>
   <form class="hid" action="IgnoreComplaint" method="post">
   
   </form>
   <form class="hid1" action="ReplyForm" method="post">
   
   </form>
   <%@ include file="footer.html" %> 
</body>
</html>