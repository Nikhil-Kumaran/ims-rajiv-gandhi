<%@ page import="userchat.UserChat" %>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <%@ include file="header.html" %> 
   <title>User Chat</title>
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
   	   	});
   </script>
</head>
<body>
	<% UserChat ac = new UserChat();
		ResultSet rs = ac.ListTransactions(9);
	%>
   <div class="container-fluid">
      <div class="row">
         <div class="col-2" id="side-menu">
            <div class="links">
            	<% while(rs.next()){ %>
               <div class="linkitem trans"><a href="user_chat_message.jsp?transid=<%= rs.getInt("transid")%>&userid=<%= rs.getInt("userid")%>">Transaction id-> <%=rs.getInt("transid") %></a></div>
               <%} %>
            </div>
         </div>
         <div class="col-10" id="content">
            <div class="name"></div>
            <div class="chatwindow">
            <h1>Messages will appear here</h1>
               <br>
               <br>
               <div class="user"></div>
               <div class="admin"></div>
            </div>
            <div class="text">
               <textarea name="" id="message"></textarea>
               <button class="btn">Send</button>
            </div>
         </div>
      </div>
   </div>
   <%@ include file="footer.html" %> 
</body>
</html>