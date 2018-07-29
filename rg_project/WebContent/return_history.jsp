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
   <title>Return History</title>
   <style>
   .fas{
   	cursor:pointer;
   }
   </style>
   
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
                              <th scope="col">Item name</th>
                              <th scope="col">Brand Name</th>
                              <th scope="col">Customer name</th>
                              <th scope="col">Quantity</th>
                              <th scope="col">status</th>
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
								
						%>
                              <tr>
                              <td><%=  rs.getInt("transid")  %></td>
                              
                              <td><%= rs.getString("iname")  %></td>
                              <td><%=rs.getString("ibrand")  %></td>
                              <td><%= rs.getString("username") %></td>
                              <td><%= rs.getInt("quantity") %></td>
                              <td><%= rs.getString("ttname") %></td>
                              </tr>
                       <%
                        }
							}
                        catch(Exception e){
                        	System.out.println("admin return history"+e);
                        }%>
                        </tbody>
                  </table>
            </div>
         </div>
      </div>
   </div>
	<%@ include file="footer.html" %> 
</body>
</html>