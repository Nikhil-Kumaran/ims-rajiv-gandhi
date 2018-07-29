<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Collection" %>
<%@ page import="adminoperations.transaction.TransactionBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="header.html" %> 
<title>New Complaint</title>
<script>
	$(document).ready(function(){
		$(".buttn").click(function(){
			var transid = $($(this).parent().parent().children()[0]).text();
			var input = document.createElement("input");

	   		input.setAttribute("type", "hidden");

	   		input.setAttribute("name", "transid");

	   		input.setAttribute("value", transid);

	   		$('.hid').append(input);

		});
		$(".butn").click(function(){
			var complainttext = $("#complainttext").val();
			var input = document.createElement("input");

	   		input.setAttribute("type", "hidden");

	   		input.setAttribute("name", "complainttext");

	   		input.setAttribute("value", complainttext);

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
	
	<%@ include file="userses.jsp" %>
	<%@ include file="user_template.jsp" %>
	<%
		UserRegBean currentUser = new UserRegBean();
		currentUser = (UserRegBean)session.getAttribute("user");
		int userid=currentUser.getCustid();
	%>
	<div class="col-10" id="content">
            <div class="container">
            	<h1 style="text-align:center">Transaction List</h1>
               <ul class="nav nav-tabs" id="myTab" role="tablist">
                  <li class="nav-item">
                     <a class="nav-link active" id="all-tab" data-toggle="tab" href="#all" role="tab" aria-controls="home" aria-selected="true">All</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" id="requested-tab" data-toggle="tab" href="#requested" role="tab" aria-controls="profile" aria-selected="false">Requested</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" id="success-tab" data-toggle="tab" href="#success" role="tab" aria-controls="contact" aria-selected="false">Success</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" id="canceledadmin-tab" data-toggle="tab" href="#canceleduser" role="tab" aria-controls="contact" aria-selected="false">Canceled By user</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" id="canceleduser-tab" data-toggle="tab" href="#canceledadmin" role="tab" aria-controls="contact" aria-selected="false">Canceled by Admin</a>
                  </li>
               </ul>
               <div class="tab-content" id="myTabContent">
                  <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="home-tab">
                     <table class="table">
                        <thead>
                           <tr>
                              <th scope="col">Transaction ID</th>
                              <th scope="col">Item name</th>
                              <th scope="col">Transaction type</th>
                              <th scope="col">Customer name</th>
                              <th scope="col">Time</th>
                              <th scope="col">Quantity</th>
                              <th scope="col">Complaint</th>
                           </tr>
                        </thead>
                        <tbody>
                        <%

                        Collection <TransactionBean> trans = (Collection) request.getAttribute("trans");
                        for(TransactionBean t : trans){
                           if(t.getUserid() == userid){
                        %>
                           <tr>
                              <th scope="row"><%= t.getTransid()%></th>
                              <td><%= t.getIname() %></td>
                              <td><%= t.getTtname()%></td>
                              <td><%= t.getUsername() %></td>
                              <td><%= t.getTime() %></td>
                              <td><%= t.getQuantity() %></td>
                              <td><button type="button" class="btn buttn" data-toggle="modal" data-target="#exampleModal">
  Complaint
</button></td>
                           </tr>
                        <%
                        }
                        }
                        %>
                        </tbody>
                     </table>
                  </div>
                  <div class="tab-pane fade" id="success" role="tabpanel" aria-labelledby="profile-tab">
                        <table class="table">
                              <thead>
                                 <tr>
                                    <th scope="col">Transaction ID</th>
                                    <th scope="col">Item name</th>
                                    <th scope="col">Transaction type</th>
                                    <th scope="col">Customer name</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Quantity</th>
                                 </tr>
                              </thead>
                              <tbody>
                              <%

                              
                              for(TransactionBean t : trans){
                              if(t.getTtype() == 3 && t.getUserid() == userid){
                              %>
                                    <tr>
                                    <th scope="row"><%= t.getTransid()%></th>
                                    <td><%= t.getIname() %></td>
                                    <td><%= t.getTtname()%></td>
                                    <td><%= t.getUsername() %></td>
                                    <td><%= t.getTime() %></td>
                                    <td><%= t.getQuantity() %></td>
<td><button type="button" class="btn buttn" data-toggle="modal" data-target="#exampleModal">
  Complaint
</button></td>                                    </tr>
                              <%
                              }
                              }
                              %>
                              </tbody>
                           </table>
                  </div>
                  <div class="tab-pane fade" id="requested" role="tabpanel" aria-labelledby="contact-tab">
                        <table class="table">
                              <thead>
                                 <tr>
                                    <th scope="col">Transaction ID</th>
                                    <th scope="col">Item name</th>
                                    <th scope="col">Transaction type</th>
                                    <th scope="col">Customer name</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Quantity</th>
                                 </tr>
                              </thead>
                              <tbody>
                              <%

                              
                              for(TransactionBean t : trans){
                              if(t.getTtype() == 1 && t.getUserid() == userid){
                              %>
                                    <tr>
                                    <th scope="row"><%= t.getTransid()%></th>
                                    <td><%= t.getIname() %></td>
                                    <td><%= t.getTtname()%></td>
                                    <td><%= t.getUsername() %></td>
                                    <td><%= t.getTime() %></td>
                                    <td><%= t.getQuantity() %></td>
<td><button type="button" class="btn buttn" data-toggle="modal" data-target="#exampleModal">
  Complaint
</button></td>                                    </tr>
                              <%
                              }
                              }
                              %>
                              </tbody>
                           </table>
                  </div>
                  <div class="tab-pane fade" id="canceledadmin" role="tabpanel" aria-labelledby="contact-tab">
                        <table class="table">
                              <thead>
                                 <tr>
                                    <th scope="col">Transaction ID</th>
                                    <th scope="col">Item name</th>
                                    <th scope="col">Transaction type</th>
                                    <th scope="col">Customer name</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Quantity</th>
                                 </tr>
                              </thead>
                              <tbody>
                              <%

                              
                              for(TransactionBean t : trans){
                              if(t.getTtype() == 2 && t.getUserid() == userid){
                              %>
                                    <tr>
                                    <th scope="row"><%= t.getTransid()%></th>
                                    <td><%= t.getIname() %></td>
                                    <td><%= t.getTtname()%></td>
                                    <td><%= t.getUsername() %></td>
                                    <td><%= t.getTime() %></td>
                                    <td><%= t.getQuantity() %></td>
<td><button type="button" class="btn buttn" data-toggle="modal" data-target="#exampleModal">
  Complaint
</button></td>                                    </tr>
                              <%
                              }
                              }
                              %>
                              </tbody>
                           </table>
                  </div>
                  <div class="tab-pane fade" id="canceleduser" role="tabpanel" aria-labelledby="contact-tab">
                  <table class="table">
                        <thead>
                              <tr>
                              <th scope="col">Transaction ID</th>
                              <th scope="col">Item name</th>
                              <th scope="col">Transaction type</th>
                              <th scope="col">Customer name</th>
                              <th scope="col">Time</th>
                              <th scope="col">Quantity</th>
                              </tr>
                        </thead>
                        <tbody>
                        <%

                        
                        for(TransactionBean t : trans){
                        if(t.getTtype() == 4 && t.getUserid() == userid){
                        %>
                              <tr>
                              <th scope="row"><%= t.getTransid()%></th>
                              <td><%= t.getIname() %></td>
                              <td><%= t.getTtname()%></td>
                              <td><%= t.getUsername() %></td>
                              <td><%= t.getTime() %></td>
                              <td><%= t.getQuantity() %></td>
<td><button type="button" class="btn buttn" data-toggle="modal" data-target="#exampleModal">
  Complaint
</button></td>                              </tr>
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
        <h5 class="modal-title" id="exampleModalLabel">New Complaint</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="form-group">
    <label for="exampleFormControlTextarea1">Your Complaint</label>
    <textarea class="form-control" id="complainttext" rows="5"></textarea>
  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-primary butn">Complaint</button>
      </div>
    </div>
  </div>
</div>
	<form class="hid" action="ComplaintsForm" method="post">
		
	</form>
   <%@ include file="footer.html" %> 
</body>
</html>