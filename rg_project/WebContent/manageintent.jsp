<%@page import="adminreg.AdminRegBean"%>

<%@ page import="java.util.Collection" %>
<%@ page import="adminoperations.transaction.TransactionBean" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <%@ include file="header.html" %> 
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
   <title>Manage Intent</title>
   <style>
   .fas{
   	cursor:pointer;
   }
   </style>
   <script>
   $(document).ready(function(){
	   console.log("hello");
	   	$('.approve').click(function(){
	   		console.log('hello');
	   		var transid = $($(this).parent().children()[0]).text();
	   		var item = $($(this).parent().children()[1]).text();
	   		var brand = $($(this).parent().children()[2]).text();
	   		var quantity = $($(this).parent().children()[6]).text();
	   		var ttid = 3;
	   		console.log(transid+item+brand+quantity);
	   		
	   		var input = document.createElement("input");

	   		input.setAttribute("type", "hidden");

	   		input.setAttribute("name", "item");

	   		input.setAttribute("value", item);

	   		$('.hid').append(input);
	   		
	   		var input1 = document.createElement("input");

	   		input1.setAttribute("type", "hidden");

	   		input1.setAttribute("name", "brand");

	   		input1.setAttribute("value", brand);

	   		$('.hid').append(input1);
	   		var input2 = document.createElement("input");

	   		input2.setAttribute("type", "hidden");

	   		input2.setAttribute("name", "quantity");

	   		input2.setAttribute("value", quantity);

	   		$('.hid').append(input2);
	   		var input3 = document.createElement("input");

	   		input3.setAttribute("type", "hidden");

	   		input3.setAttribute("name", "transid");

	   		input3.setAttribute("value", transid);

	   		$('.hid').append(input3);
	   		
	   		var input3 = document.createElement("input");

	   		input3.setAttribute("type", "hidden");

	   		input3.setAttribute("name", "ttid");

	   		input3.setAttribute("value", ttid);

	   		$('.hid').append(input3);
	   		var x = document.getElementsByClassName("hid");
	   		x[0].submit();// Form submission
	   		
	   	});
	   	$('.reject').click(function(){
	   		var transid = $($(this).parent().children()[0]).text();
	   		var ttid = 2;
	   		
	   		var input3 = document.createElement("input");

	   		input3.setAttribute("type", "hidden");

	   		input3.setAttribute("name", "transid");

	   		input3.setAttribute("value", transid);

	   		$('.hid').append(input3);
	   		
	   		var input3 = document.createElement("input");

	   		input3.setAttribute("type", "hidden");

	   		input3.setAttribute("name", "ttid");

	   		input3.setAttribute("value", ttid);

	   		$('.hid').append(input3);
	   		var x = document.getElementsByClassName("hid");
	   		x[0].submit();// Form submission
	   	});
   });
  	 
   </script>
</head>
<body>
	<%@ include file="adminses.jsp" %>
	<%@ include file="admin-template.jsp" %>
	<%

            Collection <TransactionBean> trans = (Collection) request.getAttribute("trans");

            %>
         <div class="col-10" id="content">
            <div class="container">
                  <table class="table">
                        <thead>
                              <tr>
                              <th scope="col">Transaction ID</th>
                              <th scope="col">Item name</th>
                              <th scope="col">Brand Name</th>
                              <th scope="col">Transaction type</th>
                              <th scope="col">Customer name</th>
                              <th scope="col">Time</th>
                              <th scope="col">Quantity</th>
                              <th scope="col">Approve</th>
                              <th scope="col">Reject</th>
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
                              <td><%= t.getBrandname() %></td>
                              <td><%= t.getTtname()%></td>
                              <td><%= t.getUsername() %></td>
                              <td><%= t.getTime() %></td>
                              <td><%= t.getQuantity() %></td>
                              <td class="approve"><i class="fas fa-check-circle fa-lg center" style="color: green;margin-left: 1em"></i></td>
                              <td class="reject"><i class="fas fa-times-circle fa-lg" style="color: firebrick;margin-left: 1em;"></i></td>
                              </tr>
                       <%
                        }
                        }%>
                        </tbody>
                  </table>
            </div>
         </div>
      </div>
   </div>
	 <form action="IntentApproveRejectServelt" method = "POST" class="hid">
	 </form>
	<%@ include file="footer.html" %> 
</body>
</html>