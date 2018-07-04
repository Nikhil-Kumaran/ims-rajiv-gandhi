<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="header.html" %> 
<title>Add Items</title>
</head>
<body>
<%@ include file="adminses.jsp" %>
	<% ArrayList <String> cname = (ArrayList)request.getAttribute("cname");
	ArrayList <String> tcname = (ArrayList)request.getAttribute("tcname");
%>
	<%@ include file="admin-template.jsp" %> 
	<div class="col-10" id="content">
            <div class="container">
            	<h2 class="center">Add Items</h2>
            	<br>
               <form action="ItemsForm" method="post">
                  <div class="form-row">
                  	<div class="center form-group col-md-12">
                        <label for="error">${err}</label>
                     </div>
                     <div class="form-group col-md-6">
                        <label for="itemname">Item Name</label>
                        <input type="text" class="form-control" name="itemname" placeholder="Item Name">
                     </div>
                     <div class="form-group col-md-6">
                        <label for="brandname">Brand Name</label>
                        <input type="text" class="form-control" name="brandname" placeholder="brand name">
                     </div>
                     <div class="form-group col-md-6">
                        <label for="topcategory">Top Category</label>
                        <select name="topcategory" class="form-control">
                        <% for(String s : tcname){ %>
                           <option ><%=s %></option>
                           <%} %>
                        </select>
                     </div>
                     <div class="form-group col-md-6">
                        <label for="category">Category</label>
                        <select name="category" class="form-control">
                        <% for(String s : cname){ %>
                           <option ><%=s %></option>
                           <%} %>
                        </select>
                     </div>
                     <div class="form-group col-md-6">
                        <label for="price">price</label>
                        <input type="number" class="form-control" name="price" placeholder="price">
                     </div>
                     <div class="form-group col-md-6">
                     <label for="unit">unit</label>
                     <input type="text" class="form-control" name="unit" placeholder="unit">
                     </div>
                     <div class="form-group col-md-6">
                     <label for="stock">stock</label>
                     <input type="number" class="form-control" name="stock" placeholder="stock">
                     </div>
                     <button type="submit" class="btn btn-primary col-2 offset-md-5">Add Item</button>
                  </div>
                  
               </form>
            </div>
         </div>
      </div>
   </div>
   <%@ include file="footer.html" %> 
</body>
</html>