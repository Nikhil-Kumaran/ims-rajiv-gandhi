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

import userreg.UserRegBean;
import connection.ProvideDBConn;

@WebServlet("/ViewUsers")
public class ViewUsers extends HttpServlet {
	Collection <UserRegBean> users = new ArrayList<UserRegBean>();
	Connection conn;
    public ViewUsers() throws SQLException, ClassNotFoundException {
    	conn = ProvideDBConn.getCon();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		users.clear();
		PreparedStatement query,q1,q2;
		ResultSet rs,rs1,rs2;
		try {
			query = conn.prepareStatement("select * from user");
			rs = query.executeQuery();
			
			while(rs.next()) {
				
				q1 = conn.prepareStatement("select deptname from dept where deptid = ?");
				q1.setInt(1, rs.getInt("deptid"));
				rs1 = q1.executeQuery();
				rs1.next();
				q2 = conn.prepareStatement("select desname from designation where desid = ?");
				q2.setInt(1, rs.getInt("desid"));
				rs2 = q2.executeQuery();
				rs2.next();
				UserRegBean bean = new UserRegBean();
				bean.setCustid(rs.getInt("custid"));
				bean.setLastlogin(rs.getTimestamp("lastlogin"));
				bean.setName(rs.getString("name"));
				bean.setDeptid(rs.getInt("deptid"));
				bean.setDeptname(rs1.getString("deptname"));
				bean.setUsername(rs.getString("username"));
				bean.setEmail(rs.getString("email"));
				bean.setPhone(rs.getString("phone"));
				bean.setAddress(rs.getString("address"));
				bean.setCity(rs.getString("city"));
				bean.setCountry(rs.getString("country"));
				bean.setGender(rs.getString("gender"));
				bean.setDesid(rs.getInt("desid"));
				bean.setDesig(rs2.getString("desname"));
				bean.setPurchased(rs.getInt("purchased"));
				users.add(bean);
			}
			
			for(UserRegBean b: users) {
				System.out.println(b.getLastlogin());
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("users", users);
		RequestDispatcher rd = request.getRequestDispatcher("userlist.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
