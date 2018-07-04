package adminoperations.views;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.sql.Connection;

import adminreg.AdminRegBean;
import connection.ProvideDBConn;

@WebServlet("/ViewAdmins")
public class ViewAdmins extends HttpServlet {
	Collection <AdminRegBean> admins = new ArrayList<AdminRegBean>();
	Connection conn;
    public ViewAdmins() throws SQLException, ClassNotFoundException {
    	conn = ProvideDBConn.getCon();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		admins.clear();
		PreparedStatement query,q1;
		ResultSet rs,rs1;
		try {
			query = conn.prepareStatement("select * from admin");
			rs = query.executeQuery();
			
			while(rs.next()) {
				q1 = conn.prepareStatement("select rpermission from role where rid = ?");
				q1.setInt(1, rs.getInt("rid"));
				rs1 = q1.executeQuery();
				rs1.next();
				AdminRegBean bean = new AdminRegBean();
				bean.setUid(rs.getInt("uid"));
				bean.setLastlogin(rs.getString("lastlogin"));
				bean.setName(rs.getString("name"));
				bean.setRid(rs.getInt("rid"));
				bean.setRname(rs1.getString("rpermission"));
				bean.setUsername(rs.getString("username"));
				bean.setPassword(rs.getString("password"));
				bean.setEmail(rs.getString("email"));
				bean.setPhone(rs.getString("phone"));
				bean.setAddress(rs.getString("address"));
				bean.setCity(rs.getString("city"));
				bean.setCountry(rs.getString("country"));
				bean.setGender(rs.getString("gender"));
				admins.add(bean);
			}
			
			for(AdminRegBean b: admins) {
				System.out.println(b.getLastlogin());
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("admins", admins);
		RequestDispatcher rd = request.getRequestDispatcher("admin_list.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
