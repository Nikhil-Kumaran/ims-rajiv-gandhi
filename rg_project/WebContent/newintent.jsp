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
<%@ include file="userses.jsp" %>
	<%@ include file="user_template.html" %>
	<% Cookie c1=new Cookie("intent","int");
			//c1.setMaxAge(60*60*24);
			response.addCookie(c1);
			//System.out.print(c1.getName());
			%>
    <div class="col-10" id="content">
            <div class="container">
                  <h2 class="center">Search Item</h2>
               <form action="SearchForm" method="post">
                  <div class="form-row">
                     <div class="form-group col-md-6">
                        <label for="role">Search By</label>
                        <select name="searchCategory" class="form-control">
                           <option value="tcid">Type Category Name</option>
                           <option value="cid">Category Name</option>
                           <option value="prod_name">Product Name</option>
                           <option value="item_brand">Brand Name</option>
                        </select>
                     </div>
                     <div class="form-group col-md-6">
                     <label for="Keyword">Field</label>
                     <input type="text" class="form-control" name="search_item" placeholder="Keyword">
                     </div>
                     <button type="submit" class="btn btn-primary col-2 offset-md-5"> Search</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
      <%@ include file="footer.html" %> 
</body>
</html>