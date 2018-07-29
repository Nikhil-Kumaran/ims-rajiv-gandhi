package adminoperations.transaction;

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
 * Servlet implementation class IntentApproveRejectServelt
 */
@WebServlet("/IntentApproveRejectServelt")
public class IntentApproveRejectServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntentApproveRejectServelt() {
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
	   	PreparedStatement query,query2,query1;
	   	try {
		int transid = Integer.parseInt(request.getParameter("transid"));
		int ttid = Integer.parseInt(request.getParameter("ttid"));
		
		if(ttid == 3) {

		   	String item = request.getParameter("item");
		   	String brand = request.getParameter("brand");
		   	int quantity = Integer.parseInt(request.getParameter("quantity"));
			query1 = conn.prepareStatement("select istock from items where iname=? and ibrand=?");
			query1.setString(1, item);
			query1.setString(2, brand);
			ResultSet rs=query1.executeQuery();
			rs.next();
			int i=rs.getInt("istock");
			i=i-quantity;
			if(i < 0) {
				throw new NullPointerException("stock is very low");
			}
			query2 =conn.prepareStatement("update items set istock=? where iname=? and ibrand=?");
			query2.setInt(1, i);
			query2.setString(2, item);
			query2.setString(3, brand);
			query2.executeUpdate();
		}
		
		query=conn.prepareStatement("Select * from transaction where transid=?");
		query.setInt(1,transid);
		ResultSet rs=query.executeQuery();
		rs.next();
		int custid=rs.getInt("custid");
		query=conn.prepareStatement("Select * from user where custid=?");
		query.setInt(1,custid);
		rs=query.executeQuery();
		rs.next();
		String loc=rs.getString("location");
		query=conn.prepareStatement("Update transaction set ttid=?,location=? where transid=?");
        query.setInt(1,ttid);
        query.setString(2,loc);
        query.setInt(3,transid);
        query.executeUpdate();
        response.sendRedirect("ManageIntent");
	   	}catch (Exception e) {
	   		System.out.println("intent request exp=="+e.toString());
			// TODO: handle exception
		}
	   	
	}

}