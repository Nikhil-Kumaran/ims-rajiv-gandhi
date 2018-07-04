package adminoperations.items;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.ProvideDBConn;


@WebServlet(urlPatterns = {"/ItemsFormDao"})
public class ItemsFormDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn;
	String error = null;
	
	public ItemsFormDao()
	{
		try 
		{
			conn = ProvideDBConn.getCon();
		} 
		catch (Exception e1) 
		{
			e1.printStackTrace();
		}
	}
	protected void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		ItemsFormBean b = (ItemsFormBean) req.getAttribute("item");
		PreparedStatement query;
		String sql1=null,sql2=null;
		try 
		{
			Statement stmt = conn.createStatement();
			sql1="select * from tcategories where tcname='"+ b.getType_category_id()+"'";
			ResultSet rs1=stmt.executeQuery(sql1);
			rs1.next();
			int tcid=rs1.getInt("tcid");
			sql2="select * from categories where cname='"+ b.getCategory_id()+"'";
			ResultSet rs2=stmt.executeQuery(sql2);
			rs2.next();
			int cid=rs2.getInt("cid");
			query = conn.prepareStatement("insert into items (tcid,cid,iname,ibrand,iprice,iunit,istock) values(?,?,?,?,?,?,?)");
			query.setInt(1,tcid);
			query.setInt(2,cid);
			query.setString(3, b.getProduct_name());
			query.setString(4, b.getProduct_brand());
			query.setFloat(5, b.getPrice());
			query.setString(6, b.getUnit());
			query.setInt(7, b.getStock());
			query.executeUpdate();
			
			res.sendRedirect("ItemsPreprocess");
			
			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
}
}
