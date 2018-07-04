<%@page import="useroperations.AddCart"%>
<%@page import="useroperations.UserSearchProcess"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Items To Cart</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src = "scripts/cart.js"></script>
</head>
<body>
<h2>Add Items To Cart</h2>
<table style="width:100%">
<tr>
	<th>Item Name</th>
  <th>Brand Name</th>
  <th>Unit</th> 
  <th>Available Stock</th>
  <th>Enter Your Count</th>
  <th></th>
</tr>
<%
ResultSet rs;
try{
String bookname=request.getParameter("bookname")+"";
UserSearchProcess usp=new UserSearchProcess();
rs=usp.SearchItem(request.getParameter("brandname"), request.getParameter("itemname"));

while(rs.next()){%>
 <tr style="text-align:center" >
	  	<td><%= rs.getString("iname") %></td>
	    <td><%= rs.getString("ibrand") %></td>
	    <td><%= rs.getString("iunit") %></td>
	    <td><%= rs.getInt("istock") %></td>
	    <td><input type="text" ></td>
	    <td><input type="button" value="Add To Cart" class="btn"></td>
	  </tr>
	  
<% 
}
}
catch(Exception e){
 System.out.println(e.toString());
}
%>


<tr>
<td colspan=6 style="text-align:center"><a href="MyCart.jsp"> Go To My Cart</a></td>
 </tr>

</body>
</html>