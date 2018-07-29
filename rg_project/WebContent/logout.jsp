<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
Cookie[] c=request.getCookies();
for(Cookie d:c)
{
		System.out.println(d.getName());
		d.setMaxAge(0);
		response.addCookie(d);
		
		
}
response.sendRedirect("index.jsp");
%>
</body>
</html>