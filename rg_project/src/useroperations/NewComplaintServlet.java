package useroperations;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.ProvideDBConn;

/**
 * Servlet implementation class NewComplaintServlet
 */
@WebServlet("/NewComplaintServlet")
public class NewComplaintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewComplaintServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		Connection conn;
	   	conn = ProvideDBConn.getCon();
	   	PreparedStatement query;
	    HttpSession ses=request.getSession();
	   	try {
		String transid=(String) ses.getAttribute("transid");
		System.out.println("transid="+transid);
		String complainttext=request.getParameter("complainttext").toString();
		System.out.println("comdesc="+complainttext);
			query=conn.prepareStatement("insert into complaints(transid,ctype,cdesc) values(?,0,?)");
            query.setInt(1,Integer.parseInt(transid));
            query.setString(2,complainttext);
            query.executeUpdate();
	   	}catch (Exception e) {
	   		System.out.println("New complaint exp=="+e.toString());
			// TODO: handle exception
		}
		//System.out.println("=========="+transids);
		response.sendRedirect("user_welcome.jsp");
	}

}
