package adminoperations.items;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminoperations.items.ItemsFormBean;
import connection.ProvideDBConn;


@WebServlet(urlPatterns = {"/UpdateStockDao"})
public class UpdateStockDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn;
	String error = null;
	
	public UpdateStockDao()
	{
		conn = ProvideDBConn.getCon();
	}
	protected void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		ItemsFormBean b = (ItemsFormBean) req.getAttribute("updateStock");
		PreparedStatement query1,query2;
		try 
		{
			query1 = conn.prepareStatement("select istock from items where iname=? and ibrand=?");
			query1.setString(1, b.getProduct_name());
			query1.setString(2, b.getProduct_brand());
			ResultSet rs=query1.executeQuery();
			rs.next();
			int i=rs.getInt("istock");
			i=i+b.getUpdated_stock();
			query2 =conn.prepareStatement("update items set istock=? where iname=? and ibrand=?");
			query2.setInt(1, i);
			query2.setString(2, b.getProduct_name());
			query2.setString(3, b.getProduct_brand());
			query2.executeUpdate();
			res.sendRedirect("updatestock.jsp");
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
}
}
