<%@page import="userreg.UserRegBean"%>
<%
try{
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
UserRegBean currentUser = new UserRegBean();
currentUser = (UserRegBean)session.getAttribute("user");
if(currentUser == null){
	response.sendRedirect("index.jsp");
}
else{
session.setAttribute("user",currentUser);
}
}
catch(Exception e){
	
}
%>