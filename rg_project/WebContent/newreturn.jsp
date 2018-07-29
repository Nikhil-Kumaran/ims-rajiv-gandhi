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
		var item = "";
		var transid = "";
		var quantity = "";
		var custname = "";
		var brand = "";
		$(".buttn").click(function(){
			transid = $($(this).parent().parent().children()[0]).text();
			item = $($(this).parent().parent().children()[1]).text();
			brand = $($(this).parent().parent().children()[2]).text();
			custname = $($(this).parent().parent().children()[4]).text();
			quantity = $($(($(this).parent().parent().children()[7])).children()).val();
			var input = document.createElement("input");

	   		input.setAttribute("type", "hidden");

	   		input.setAttribute("name", "transid");

	   		input.setAttribute("value", transid);

	   		var input1 = document.createElement("input");

	   		input1.setAttribute("type", "hidden");

	   		input1.setAttribute("name", "quantity");

	   		input1.setAttribute("value", quantity);
	   		
	   		var input2 = document.createElement("input");

	   		input2.setAttribute("type", "hidden");

	   		input2.setAttribute("name", "custname");

	   		input2.setAttribute("value", custname);
	   		
	   		var input3 = document.createElement("input");

	   		input3.setAttribute("type", "hidden");

	   		input3.setAttribute("name", "brand");

	   		input3.setAttribute("value", brand);
	   		
	   		var input4 = document.createElement("input");

	   		input4.setAttribute("type", "hidden");

	   		input4.setAttribute("name", "item");

	   		input4.setAttribute("value", item);
	   		
	   		$('.hid').append(input);
	   		$('.hid').append(input4);
	   		$('.hid').append(input1);
	   		$('.hid').append(input2);
	   		$('.hid').append(input3);
	   		
	   		
	   		$("#info").append("Item: "+item+"<br>Brand: "+brand+"<br>"+"quantity: "+quantity);

		});
		$(".butn").click(function(){
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
		Collection <TransactionBean> trans = (Collection) request.getAttribute("trans");
		UserRegBean currentUser = new UserRegBean();
		currentUser = (UserRegBean)session.getAttribute("user");
		int userid=currentUser.getCustid();
 	%>
	<div class="col-10" id="content">
            <div class="container">
             <h1 style="text-align:center">Success Transaction List</h1>
                        <table class="table">
                              <thead>
                                 <tr>
                                    <th scope="col">Transaction ID</th>
                                    <th scope="col">Item</th>
                                    <th scope="col">brand</th>
                                    <th scope="col">Transaction type</th>
                                    <th scope="col">Customer</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Quantity</th>
                                     <th scope="col">Enter Quantity</th>
                                    <th scope="col">Return</th>
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
                                    <td><%= t.getBrandname() %></td>
                                    <td><%= t.getTtname()%></td>
                                    <td><%= t.getUsername() %></td>
                                    <td><%= t.getTime() %></td>
                                    <td><%= t.getQuantity() %></td>
                                   <td><input type="text" ></td>
<td><button type="button" class="btn buttn" data-toggle="modal" data-target="#exampleModal">
  Return
</button></td>                                    </tr>
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
   <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Return</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="form-group">
       <h2>Do You want to return:</h2>
       <p id="info"></p>
  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-primary butn">Yes</button>
      </div>
    </div>
  </div>
</div>
	<form class="hid" action="ReturnItemServlet" method="post">
		<input type = "hidden" name = "custid" value = "<%= userid%>">
	</form>
   <%@ include file="footer.html" %> 
</body>
</html>