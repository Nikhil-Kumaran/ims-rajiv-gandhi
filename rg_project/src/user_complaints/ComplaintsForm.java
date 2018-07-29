package user_complaints;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ComplaintsForm")
public class ComplaintsForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}
	
	void processRequest(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int transid=Integer.parseInt(req.getParameter("transid"));
		String desc=req.getParameter("complainttext");
		
		ComplaintBean bean=new ComplaintBean();
		bean.setTransid(transid);
		bean.setComplaint_description(desc);
		
		RequestDispatcher rd = req.getRequestDispatcher("/ComplaintFormDao");
		req.setAttribute("complaint", bean);
		rd.forward(req, res);
	}

}
