package adminoperations.views;

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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminoperations.items.ItemsFormBean;
import connection.ProvideDBConn;

import java.io.IOException;
import java.sql.Connection;


@WebServlet("/ViewItems")
public class ViewItems extends HttpServlet {
	Connection conn;
	Collection <ItemsFormBean> items_list = new ArrayList<ItemsFormBean>();
    public ViewItems() throws SQLException, ClassNotFoundException 
    {
    	conn = ProvideDBConn.getCon();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PreparedStatement query;
		items_list.clear();
		String sql=null;
		try {
			query = conn.prepareStatement("select * from items");
			ResultSet rs = query.executeQuery();
			
			while(rs.next()) {
				ItemsFormBean bean = new ItemsFormBean();
				bean.setItem_id(rs.getInt("iid"));
				
				sql="select * from tcategories where tcid='"+rs.getInt("tcid")+"'";
				Statement stmt = conn.createStatement();
				ResultSet rs1=stmt.executeQuery(sql);
				rs1.next();
				bean.setType_category_id(rs1.getString("tcname"));
				
				sql="select * from categories where cid='"+rs.getInt("cid")+"'";
				stmt = conn.createStatement();
				rs1=stmt.executeQuery(sql);
				rs1.next();
				bean.setCategory_id(rs1.getString("cname"));
				
				bean.setProduct_name(rs.getString("iname"));
				bean.setProduct_brand(rs.getString("ibrand"));
				bean.setUnit(rs.getString("iunit"));
				bean.setPrice(rs.getFloat("iprice"));
				bean.setStock(rs.getInt("istock"));
				items_list.add(bean);
			}
			
//			for(ItemsFormBean b: items_list) {
//				System.out.println(b.getLastlogin());
//			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("items", items_list);
		RequestDispatcher rd = request.getRequestDispatcher("item_list.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
