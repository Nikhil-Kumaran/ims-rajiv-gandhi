<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="adminoperations.items.ItemsFormBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="header.html" %> 
    <title>Search Item</title>
</head>
<body>
<%@ include file="adminses.jsp" %>
	<%@ include file="admin-template.jsp" %>
    <div class="col-10" id="content">
            <div class="container">
               <form action="UpdateStock" method = "post">
                  <div class="form-row">
                     <div class="form-group col-md-6">
                        <label for="item name">Item name</label>
                        <input type="text" class="form-control" name="prod_name" placeholder="item name">
                     </div>
                     <div class="form-group col-md-6">
                        <label for="brand name">Brand name</label>
                        <input type="text" class="form-control" name="item_brand" placeholder="Brand name">
                     </div>

                     <div class="form-group col-6 offset-md-3">
                     <label for="stock">Stock</label>
                     <input type="text" class="form-control" name="stock" placeholder="Stock">
                     </div>
                     <button type="submit" class="btn btn-primary col-2 offset-md-5"> Update Stock</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
      <%@ include file="footer.html" %> 
</body>
</html>