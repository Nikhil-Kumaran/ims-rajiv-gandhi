<% Cookie c1=new Cookie("userreturn","ur");
	//c1.setMaxAge(60*60*24);
	response.addCookie(c1);
	//System.out.print(c1.getName());
	response.sendRedirect("ViewTransactions");
%>