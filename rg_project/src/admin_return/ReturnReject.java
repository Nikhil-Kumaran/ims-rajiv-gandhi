package admin_return;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ProvideDBConn;

/**
 * Servlet implementation class ReturnReject
 */
@WebServlet("/ReturnReject")
public class ReturnReject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnReject() {
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
		Connection conn;
	   	conn = ProvideDBConn.getCon();
	   	PreparedStatement query;
	    ResultSet rs,rs1,rs2;
	   	try {
		String transid=(String) request.getParameter("transid");
		String retid=(String) request.getParameter("retid");
		//System.out.println("transid="+transid);
		//System.out.println("comdesc="+complainttext);
		
		query=conn.prepareStatement("update returntable set retstatus = 3 where retid=?");
        query.setInt(1,Integer.parseInt(retid));
        query.executeUpdate();
        
            
	   	}catch (Exception e) {
	   		System.out.println("return admin exp=="+e.toString());
			// TODO: handle exception
		}
		//System.out.println("=========="+transids);
		response.sendRedirect("admin_return_view.jsp");
	}

}
