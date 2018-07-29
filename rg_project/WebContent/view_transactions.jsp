<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Collection" %>
<%@ page import="adminoperations.transaction.TransactionBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="header.html" %> 
<title>Manage Transactions</title>
<style>
	.hidden{
		display:none;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('.printbtn').click(function(){
			
			
			var transid = $($(this)[0]).parent().parent().children()[0];
			
			var itemname = $($(this)[0]).parent().parent().children()[1];
			
			var transtype = $($(this)[0]).parent().parent().children()[2];
			var custname = $($(this)[0]).parent().parent().children()[3];
			var time = $($(this)[0]).parent().parent().children()[4];
			var quantity = $($(this)[0]).parent().parent().children()[5];
			console.log(transid);
			
			$('.hidden').html("transaction-id: "+$(transid).text()+"<br>Item Name: "+$(itemname).text()
				+"<br>Transaction-type: "+$(transtype).text()+"<br>Customer-Name: "+$(custname).text()+"<br>Time: "+$(time).text()+"<br>quantity: "+$(quantity).text()		
			);
			var printContents = $('.hidden').html();
		     var originalContents = document.body.innerHTML;

		     document.body.innerHTML = printContents;

		     window.print();

		     document.body.innerHTML = originalContents;
		});
	});
</script>
</head>
<body>
	<%@ include file="adminses.jsp" %>
	<%@ include file="admin-template.jsp" %> 
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
                              <th scope="col">Location</th>
                              <th scope="col">Print</th>
                           </tr>
                        </thead>
                        <tbody>
                        <%

                        Collection <TransactionBean> trans = (Collection) request.getAttribute("trans");
                        for(TransactionBean t : trans){
                        %>
                           <tr>
                              <th scope="row"><%= t.getTransid()%></th>
                              <td><%= t.getIname() %></td>
                              <td><%= t.getTtname()%></td>
                              <td><%= t.getUsername() %></td>
                              <td><%= t.getTime() %></td>
                              <td><%= t.getQuantity() %></td>
                              <%
                              if(t.getLocation() != null){ %>
                              	<td><%= t.getLocation() %></td>
                              <%}
                              else{
                              %>
                              <td>Warehouse</td>
                              <%} %>
                              <td><button class="btn printbtn">PRINT</button></td>
                           </tr>
                        <%
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
                                    <th scope="col">Location</th>
                                 </tr>
                              </thead>
                              <tbody>
                              <%

                              
                              for(TransactionBean t : trans){
                              if(t.getTtype() == 3){
                              %>
                                    <tr>
                                    <th scope="row"><%= t.getTransid()%></th>
                                    <td><%= t.getIname() %></td>
                                    <td><%= t.getTtname()%></td>
                                    <td><%= t.getUsername() %></td>
                                    <td><%= t.getTime() %></td>
                                    <td><%= t.getQuantity() %></td>
	                                    <%
	                              if(t.getLocation() != null){ %>
	                              	<td><%= t.getLocation() %></td>
	                              <%}
	                              else{
	                              %>
	                              <td>Warehouse</td>
	                              <%} %>
                                    </tr>
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
                                    <th scope="col">Location</th>
                                 </tr>
                              </thead>
                              <tbody>
                              <%

                              
                              for(TransactionBean t : trans){
                              if(t.getTtype() == 1){
                              %>
                                    <tr>
                                    <th scope="row"><%= t.getTransid()%></th>
                                    <td><%= t.getIname() %></td>
                                    <td><%= t.getTtname()%></td>
                                    <td><%= t.getUsername() %></td>
                                    <td><%= t.getTime() %></td>
                                    <td><%= t.getQuantity() %></td>
	                                    <%
	                              if(t.getLocation() != null){ %>
	                              	<td><%= t.getLocation() %></td>
	                              <%}
	                              else{
	                              %>
	                              <td>Warehouse</td>
	                              <%} %>
                                    </tr>
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
                                    <th scope="col">Location</th>
                                 </tr>
                              </thead>
                              <tbody>
                              <%

                              
                              for(TransactionBean t : trans){
                              if(t.getTtype() == 2){
                              %>
                                    <tr>
                                    <th scope="row"><%= t.getTransid()%></th>
                                    <td><%= t.getIname() %></td>
                                    <td><%= t.getTtname()%></td>
                                    <td><%= t.getUsername() %></td>
                                    <td><%= t.getTime() %></td>
                                    <td><%= t.getQuantity() %></td>
	                                    <%
	                              if(t.getLocation() != null){ %>
	                              	<td><%= t.getLocation() %></td>
	                              <%}
	                              else{
	                              %>
	                              <td>Warehouse</td>
	                              <%} %>
                                    </tr>
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
                              <th scope="col">Location</th>
                              </tr>
                        </thead>
                        <tbody>
                        <%

                        
                        for(TransactionBean t : trans){
                        if(t.getTtype() == 4){
                        %>
                              <tr>
                              <th scope="row"><%= t.getTransid()%></th>
                              <td><%= t.getIname() %></td>
                              <td><%= t.getTtname()%></td>
                              <td><%= t.getUsername() %></td>
                              <td><%= t.getTime() %></td>
                              <td><%= t.getQuantity() %></td>
                              <%
                              if(t.getLocation() != null){ %>
                              	<td><%= t.getLocation() %></td>
                              <%}
                              else{
                              %>
                              <td>Warehouse</td>
                              <%} %>
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
   <div class="hidden">
   </div>
   <%@ include file="footer.html" %> 
</body>
</html>