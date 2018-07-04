<%@ page import="adminreg.AdminRegBean" %>
<%
try{
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
int  userid;
AdminRegBean currentUser = new AdminRegBean();
System.out.println("print");

currentUser = (AdminRegBean)session.getAttribute("admin");

if(currentUser == null){
	response.sendRedirect("index.jsp");
}
else{
	session.setAttribute("admin",currentUser);
	userid=currentUser.getUid();
}
}
catch(Exception e){
	System.out.println("unauthorised entry"+e.toString());
}
%>