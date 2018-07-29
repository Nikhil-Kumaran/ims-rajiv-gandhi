<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="adminoperations.items.ItemsFormBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="header.html" %> 
<title>Item List</title>
</head>
<body>
<%@ include file="userses.jsp" %>
	<%@ include file="user_template.jsp" %>
	
	<div class="col-10" id="content">
		<h1 style="text-align:center">Item List</h1>
            <div class="container">
               <table class="table">
                  <thead>
                     <tr>
                        <th scope="col">Item ID</th>
                        <th scope="col">Type Category</th>
                        <th scope="col">Category</th>
                        <th scope="col">Item Name</th>
                        <th scope="col">Brand Name</th>
                        <th scope="col">Unit</th>
                        <th scope="col">Price</th>
                        <th scope="col">Stock</th>
                     </tr>
                  </thead>
                  <tbody>
                  <%

                  Collection <ItemsFormBean> items_list = (Collection) request.getAttribute("items");
                  for(ItemsFormBean item : items_list){
                        
                  %>
                     <tr>
                        <th scope="row"><%= item.getItem_id() %></th>
                        <td><%= item.getType_category_id() %></td>
                        <td><%= item.getCategory_id() %></td>
                        <td><%= item.getProduct_name() %></td>
                        <td><%= item.getProduct_brand() %></td>
                        <td><%= item.getUnit() %></td>
                        <td><%= item.getPrice() %></td>
                        <td><%= item.getStock() %></td>
                     </tr>
                  <%
                  }
                  %>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </div>
   <%@ include file="footer.html" %> 
</body>
</html>