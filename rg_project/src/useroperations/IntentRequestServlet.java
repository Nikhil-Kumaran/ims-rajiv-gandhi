package useroperations;

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
 * Servlet implementation class IntentRequestServlet
 */
@WebServlet("/IntentRequestServlet")
public class IntentRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntentRequestServlet() {
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
	   	try {
		String[] transids=request.getParameterValues("transid");
		for (String strTemp : transids){
			System.out.println(strTemp);
			query=conn.prepareStatement("Update transaction set ttid=1 where transid=?");
            query.setInt(1,Integer.parseInt(strTemp));
            query.executeUpdate();
			}
	   	}catch (Exception e) {
	   		System.out.println("intent request exp=="+e.toString());
			// TODO: handle exception
		}
		//System.out.println("=========="+transids);
		response.sendRedirect("user_welcome.jsp");
	}

}
