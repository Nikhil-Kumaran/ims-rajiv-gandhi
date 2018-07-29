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

import com.google.gson.Gson;

import connection.ProvideDBConn;

/**
 * Servlet implementation class ReturnItemServlet
 */
@WebServlet("/ReturnItemServlet")
public class ReturnItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnItemServlet() {
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
		String quantity = request.getParameter("quantity");
		String transid = request.getParameter("transid");
		String custid = request.getParameter("custid");
		String brand = request.getParameter("brand");
		String item = request.getParameter("item");
		System.out.println(quantity + " "+ transid +custid+item+brand);
	    Connection conn;
	   	conn = ProvideDBConn.getCon();
	   	PreparedStatement query;
	   	try {
	   		query=conn.prepareStatement("insert into transaction(iid,ttid,custid,quantity) values((select iid from items where iname=? and ibrand = ?),6,?,?)");
			query.setString(1,item);
			query.setString(2,brand);
			query.setInt(3,Integer.parseInt(custid));
            query.setInt(4,Integer.parseInt(quantity));
            query.executeUpdate();
            query.close();
            
            query=conn.prepareStatement("select max(transid) from transaction");
			ResultSet rs = query.executeQuery();
            rs.next();
            int retid = rs.getInt("max(transid)");
            query.close();
            query=conn.prepareStatement("insert into returnlookup (transid,retid) values(?,?)");
			query.setInt(1,Integer.parseInt(transid));
            query.setInt(2,retid);
            query.executeUpdate();
            query.close();
	   	}catch (Exception e) {
	   		System.out.println("return request exp=="+e.toString());
			// TODO: handle exception
		}
	}

}
