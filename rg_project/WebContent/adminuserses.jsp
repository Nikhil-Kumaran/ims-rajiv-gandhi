<%@page import="userreg.UserRegBean"%>
<%@page import="adminreg.AdminRegBean"%>
<%
try{
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
int userid;
UserRegBean currentUser = new UserRegBean();
AdminRegBean currentUsera = new AdminRegBean();
currentUser = (UserRegBean)session.getAttribute("user");
currentUsera = (AdminRegBean)session.getAttribute("admin");

if(currentUser == null && currentUsera == null){
	response.sendRedirect("index.jsp");
}
else if(currentUser != null){
	session.setAttribute("user",currentUser);
	userid=currentUser.getCustid();
}
else{
	session.setAttribute("admin",currentUsera);
	userid=currentUsera.getUid();
}
}
catch(Exception e){
	
}
%>