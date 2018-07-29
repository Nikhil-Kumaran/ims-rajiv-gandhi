<%@page import="useroperations.UserAllTransactions"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <%@ include file="header.html" %> 
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
   <title>Pending Intent</title>
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
	   		var retid = $($(this).parent().children()[0]).text();
	   		var transid = $($(this).parent().children()[1]).text();
	   		console.log(transid+retid);
	   		
	   		var input = document.createElement("input");

	   		input.setAttribute("type", "hidden");

	   		input.setAttribute("name", "transid");

	   		input.setAttribute("value", transid);

	   		$('.hid').append(input);
	   		
	   		var input1 = document.createElement("input");

	   		input1.setAttribute("type", "hidden");

	   		input1.setAttribute("name", "retid");

	   		input1.setAttribute("value", retid);

	   		$('.hid').append(input1);
	   		
	   		var input2 = document.createElement("input");

	   		input2.setAttribute("type", "hidden");

	   		input2.setAttribute("name", "type");

	   		input2.setAttribute("value", "1");

	   		$('.hid').append(input2);
	   		var x = document.getElementsByClassName("hid");
	   		x[0].submit();// Form submission
	   		
	   	});
	   	$('.reject').click(function(){
	   		var retid = $($(this).parent().children()[0]).text();
	   		
	   		var input = document.createElement("input");

	   		input.setAttribute("type", "hidden");

	   		input.setAttribute("name", "retid");

	   		input.setAttribute("value", retid);

	   		$('.hid').append(input);
	   		
	   		//var input3 = document.createElement("input");

	   		//input3.setAttribute("type", "hidden");

	   		//input3.setAttribute("name", "retid");

	   		//input3.setAttribute("value", retid);

	   		//$('.hid').append(input3);
	   		
	   		var input2 = document.createElement("input");

	   		input2.setAttribute("type", "hidden");

	   		input2.setAttribute("name", "type");

	   		input2.setAttribute("value", "2");

	   		$('.hid').append(input2);
	   		
	   		var x = document.getElementsByClassName("hid");
	   		x[0].submit();// Form submission
	   	});
   });
  	 
   </script>
</head>
<body>
	<%@ include file="adminses.jsp" %>
	<%@ include file="admin-template.jsp" %>
         <div class="col-10" id="content">
            <div class="container">
                  <table class="table">
                        <thead>
                              <tr>
                              <th scope="col">Transaction ID</th>
                              <th scope="col">Time</th>
                              <th scope="col">Item name</th>
                              <th scope="col">Brand Name</th>
                              <th scope="col">Customer name</th>
                              <th scope="col">Quantity</th>
                              <th scope="col">Approve</th>
                              <th scope="col">Reject</th>
                              </tr>
                        </thead>
                        <tbody>
                        <%
							ResultSet rs,rs1;
							try{
							UserAllTransactions uat=new UserAllTransactions();
							rs=uat.ret();
							String name;
							while(rs.next()){
								if(rs.getInt("ttid") == 6){
						%>
                              <tr>
                              <td><%=  rs.getInt("transid")  %></td>
                              <td><%=  rs.getTimestamp("t.time")  %></td>
                              <td><%= rs.getString("iname")  %></td>
                              <td><%=rs.getString("ibrand")  %></td>
                              <td><%= rs.getString("username") %></td>
                              <td><%= rs.getInt("quantity") %></td>
                              <td class="approve"><i class="fas fa-check-circle fa-lg center" style="color: green;margin-left: 1em"></i></td>
                              <td class="reject"><i class="fas fa-times-circle fa-lg" style="color: firebrick;margin-left: 1em;"></i></td>
                              </tr>
                       <%
								}
                        }
							}
                        catch(Exception e){
                        	System.out.println("admin return view"+e);
                        }%>
                        </tbody>
                  </table>
            </div>
         </div>
      </div>
   </div>
	 <form action="ReturnApproveServerlet" method = "POST" class="hid">
	 </form>
	<%@ include file="footer.html" %> 
</body>
</html>