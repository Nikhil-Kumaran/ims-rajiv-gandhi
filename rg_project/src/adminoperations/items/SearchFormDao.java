package adminoperations.items;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminoperations.items.ItemsFormBean;
import connection.ProvideDBConn;


@WebServlet(urlPatterns = {"/SearchFormDao"})
public class SearchFormDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn;
	Collection <ItemsFormBean> search_list = new ArrayList<ItemsFormBean>();
	String error = null;
	
	public SearchFormDao()
	{
		conn = ProvideDBConn.getCon();
	}
	protected void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		ItemsFormBean b = (ItemsFormBean) req.getAttribute("category");
		PreparedStatement query;
		search_list.clear();
		try 
		{
			String sql=null;
			Statement stmt = conn.createStatement();
			String value=b.getSearch_name();
			switch(b.getSearch_category().toString())
			{
				case "tcid":sql ="select * from items where tcid=(select tcid from tcategories where tcname='"+value+"')";break;
				case "cid":sql ="select * from items where cid=(select cid from categories where cname='"+value+"')";break;
				case "prod_name":sql ="select * from items where iname='"+value+"'";break;
				case "item_brand":sql ="select * from items where ibrand='"+value+"'";break;
			}
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()) {
				ItemsFormBean bean = new ItemsFormBean();
				bean.setItem_id(rs.getInt("iid"));
				bean.setType_category_id(rs.getString("tcid"));
				bean.setCategory_id(rs.getString("cid"));
				bean.setProduct_name(rs.getString("iname"));
				bean.setProduct_brand(rs.getString("ibrand"));
				bean.setUnit(rs.getString("iunit"));
				bean.setPrice(rs.getFloat("iprice"));
				bean.setStock(rs.getInt("istock"));
				search_list.add(bean);
			}
			req.setAttribute("items", search_list);
			Cookie[] c=req.getCookies();
			String s = null;
			for(Cookie d:c)
			{
				if(d.getName().equals("intent"))
				{
					s=d.getName();
					d.setMaxAge(0);
					res.addCookie(d);
					break;
				}
				else if(d.getName().equals("adminsearch")) {
					s=d.getName();
					d.setMaxAge(0);
					res.addCookie(d);
					break;
				}
				else if(d.getName().equals("usersearch")) {
					s=d.getName();
					d.setMaxAge(0);
					res.addCookie(d);
					break;
				}
			}
			
			if(s.equals("intent")) {
				RequestDispatcher rd = req.getRequestDispatcher("order_item.jsp");
				rd.forward(req,res);
			}
			else if(s.equals("adminsearch")) {
				RequestDispatcher rd = req.getRequestDispatcher("item_list.jsp");
				rd.forward(req,res);
			}
			else if(s.equals("usersearch")) {
				RequestDispatcher rd = req.getRequestDispatcher("user-item_list.jsp");
				rd.forward(req,res);
			}
			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		
}
}
