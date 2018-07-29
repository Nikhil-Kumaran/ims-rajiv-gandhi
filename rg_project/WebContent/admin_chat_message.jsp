<%@ page import="adminchat.AdminChat" %>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <%@ include file="header.html" %> 
   <title>Document</title>
   <style>
      #side-menu{
         height: 100vh;
         overflow-y: scroll;
      }
      .chatwindow{

         background: wheat;
         width: 100%;
         height: 85vh;
         overflow-y: scroll;
      }
      .admin{
         text-align: right;
         width:300px;
         background: red;
         position: relative;
         left: 73%;
         margin-bottom: 3px;
         
      }
      .user{
         text-align: left;
         width:300px;
         background: red;
         position :relative;
         left: 2%;
         margin-bottom: 3px;
      }
      .text{
         height: 10vh;
      }
      #message{
         height: 10vh;
         width: 90%;
         resize: none;
      }
      button{
         position: relative;
         top:-35%;
         height: 10vh;
         width: 8%;
         margin: 0;
      }
   </style>
   <script type="text/javascript">
   	$(document).ready(function(){
   		console.log("Hello");
   		$('#send').click(function(){
   			var message = $('#message').val();
   			var input1 = document.createElement("input");

	   		input1.setAttribute("type", "hidden");

	   		input1.setAttribute("name", "message");

	   		input1.setAttribute("value", message);
	   		
	   		$('.hid').append(input1);
	   		
	   		var x = document.getElementsByClassName("hid");
	   		x[0].submit();
   		});
   	});
   </script>
</head>
<body>
	<% 
		String trans = request.getParameter("transid");
	String user = request.getParameter("userid");
		AdminChat ac = new AdminChat();
		ResultSet rs = ac.ListTransactions();
		ResultSet rs1 = ac.ListMessage(Integer.parseInt(trans));
		rs1.next();
	%>
   <div class="container-fluid">
      <div class="row">
         <div class="col-2" id="side-menu">
            <div class="links">
            	<% while(rs.next()){ %>
               <div class="linkitem trans"><a href="admin_chat_message.jsp?transid=<%= rs.getInt("transid")%>">Transaction id-> <%=rs.getInt("transid") %></a></div>
               <%} %>
            </div>
         </div>
         <div class="col-10" id="content">
            <div class="name"><%= rs1.getString("username") %></div>
            <%int uid = rs1.getInt("custid"); %>
            <div class="chatwindow">
               <br>
               <br>
               <%do{ 
               	if(rs1.getInt("p_type") == 1){
               %>
               <div class="user"><%= rs1.getString("message") %></div>
               <%}
               	else{%>
               <div class="admin"><%= rs1.getString("message") %></div>
               <%} }while(rs1.next());
               %>
            </div>
            <div class="text">
               <textarea name="" id="message"></textarea>
               <button class="btn" id="send">Send</button>
            </div>
         </div>
      </div>
   </div>
   <form class="hid" action="AdminChatMessageSend" method="post">
		<input type="hidden" name="p_type" value="2">
		<input type="hidden" name = "userid" value="<%= uid%>">
		<input type="hidden" name = "transid" value="<%= trans%>">
	</form>
   <%@ include file="footer.html" %> 
</body>
</html>