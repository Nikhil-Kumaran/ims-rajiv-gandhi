package admin_complaints;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user_complaints.ComplaintBean;

@WebServlet("/ReplyForm")
public class ReplyForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}
	
	void processRequest(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int cid=Integer.parseInt(req.getParameter("cid"));
		String desc=req.getParameter("replytext");
		
		ComplaintBean bean=new ComplaintBean();
		bean.setCid(cid);
		bean.setAdmin_reply(desc);
		
		RequestDispatcher rd = req.getRequestDispatcher("/ReplyFormDao");
		req.setAttribute("reply", bean);
		rd.forward(req, res);
	}

}
