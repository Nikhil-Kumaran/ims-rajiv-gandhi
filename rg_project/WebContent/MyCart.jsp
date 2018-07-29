<%@page import="useroperations.UserAllTransactions"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="header.html" %> 
<title>MyCart</title>
<script language="JavaScript">
function checkAll(ele) {
    var checkboxes = document.getElementsByTagName('input');
    if (ele.checked) {
        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].type == 'checkbox') {
                checkboxes[i].checked = true;
            }
        }
    } else {
        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].type == 'checkbox') {
                checkboxes[i].checked = false;
            }
        }
    }
}
</script>
</head>
<body>
<%@ include file="userses.jsp" %>
<%@ include file="user_template.jsp" %> 
		
<%
UserRegBean currentUser = new UserRegBean();
currentUser = (UserRegBean)session.getAttribute("user");
int userid=currentUser.getCustid(); %>       
         <div class="col-10" id="content">
         <h1 style="text-align:center">MyCart</h1>
            <div class="container">
             <form action="IntentRequestServlet" method="post">
               <table class="table">
                  <thead>
                     <tr>
                        <th><input type="checkbox" onClick="checkAll(this)" /> Select All</th>
                        <th scope="col">Transaction Id</th>
                        <th scope="col">Brand Name</th>
                        <th scope="col">Item Name</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Status</th>
                        <th scope="col">Time</th>
                     </tr>
                  </thead>
                  <tbody>
                  <%
                  ResultSet rs;
                  try{
                  UserAllTransactions uat=new UserAllTransactions();
                  rs=uat.Trans(userid+"",5);
                  while(rs.next()){%>
                     <tr>
                        <td><input type="checkbox" name="transid" value="<%=rs.getInt("transid")%>"/></td>
	  	<td><%= rs.getInt("transid") %></td>
	    <td><%= rs.getString("ibrand") %></td>
	    <td><%= rs.getString("iname") %></td>
	    <td><%= rs.getInt("quantity") %></td>
	     <td><%= rs.getString("ttname") %></td>
	      <td><%= rs.getTimestamp("time") %></td>
                     </tr>
                     <% 
                  }
                  }
                  catch(Exception e){
                   System.out.println(e.toString());
                  }
                  %>
                  <tr>
                  <td colspan=7 style="text-align:center"><input type="submit" value="Send Request"/></td>
                  </tr>
                  </tbody>
               </table>
            </form>
            </div>
         </div>
      </div>
   </div>
<%@ include file="footer.html" %>
</body>
</html>