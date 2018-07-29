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
 * Servlet implementation class ReturnApproveServerlet
 */
@WebServlet("/ReturnApproveServerlet")
public class ReturnApproveServerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnApproveServerlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection conn;
	   	conn = ProvideDBConn.getCon();
	   	PreparedStatement query;
	    ResultSet rs,rs1,rs2,rs3;
	   	try {
		//String transid=(String) request.getParameter("transid");
		String retid=(String) request.getParameter("retid");
		int type = Integer.parseInt(request.getParameter("type"));
		//System.out.println("transid="+transid);
		//System.out.println("comdesc="+complainttext);
		if(type == 1) {
			query=conn.prepareStatement("select quantity,custid,iid from transaction where transid=?");
	        query.setInt(1,Integer.parseInt(retid));
	        rs = query.executeQuery();
	        rs.next();
	        query=conn.prepareStatement("select transid from returnlookup where retid=?");
	        query.setInt(1,Integer.parseInt(retid));
	        rs1 = query.executeQuery();
	        rs1.next();
	        
	        int transid = rs1.getInt("transid");
	        
	        query = conn.prepareStatement("select quantity from transaction where transid = ?");
	        query.setInt(1, transid);
	        rs3 = query.executeQuery();
	        rs3.next();
	        
	        query=conn.prepareStatement("update transaction set ttid = 7 where transid=?");
	        query.setInt(1,Integer.parseInt(retid));
	        query.executeUpdate();
	        
	        query=conn.prepareStatement("update transaction set quantity=? where transid=?");
	        
	        query.setInt(1,rs3.getInt("quantity")-rs.getInt("quantity"));
	        
	        query.setInt(2,transid);
	        query.executeUpdate();
	        
	        
			
	        
//	        query=conn.prepareStatement("insert into transaction(iid,ttid,custid,quantity) values(?,6,?,?)");
//			query.setInt(1,rs.getInt("iid"));
//			query.setInt(2,rs.getInt("custid"));
//	        query.setInt(3,rs1.getInt("quantity"));
//	        query.executeUpdate();
	        
	        query=conn.prepareStatement("select istock from items where iid=?");
	        query.setInt(1,rs.getInt("iid"));
	        rs2 = query.executeQuery();
	        rs2.next();
	        query=conn.prepareStatement("update items set istock=? where iid=?");
	        query.setInt(1, rs2.getInt("istock")+rs.getInt("quantity"));
	        query.setInt(2,rs.getInt("iid"));
	        query.executeUpdate();
	        
	        query = conn.prepareStatement("delete from returnlookup where retid = ?");
	        query.setInt(1, Integer.parseInt(retid));
	        query.executeUpdate();
		}
		else if(type == 2) {
			query=conn.prepareStatement("update transaction set ttid = 8 where transid=?");
	        query.setInt(1,Integer.parseInt(retid));
	        query.executeUpdate();
	        query.close();
	        query = conn.prepareStatement("delete from returnlookup where retid = ?");
	        query.setInt(1,Integer.parseInt(retid));
	        query.executeUpdate();
	        query.close();
		}
	   	}catch (Exception e) {
	   		System.out.println("return admin exp=="+e.toString());
			// TODO: handle exception
		}
		//System.out.println("=========="+transids);
		response.sendRedirect("admin_return_view.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
