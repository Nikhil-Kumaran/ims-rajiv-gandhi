package adminreg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ProvideDBConn;

/**
 * Servlet implementation class AdminPreprocess
 */
@WebServlet("/AdminPreprocess")
public class AdminPreprocess extends HttpServlet {
	Connection conn;
	ArrayList <String> roles = new ArrayList<String>();
    public AdminPreprocess() {
    	conn = ProvideDBConn.getCon();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		roles.clear();
		PreparedStatement ps;
		ResultSet rs;
		try {
			ps = conn.prepareStatement("select * from role");
			rs = ps.executeQuery();
			while(rs.next()) {
				roles.add(rs.getString("rpermission"));
			}
			RequestDispatcher rd = request.getRequestDispatcher("admin_reg.jsp");
			request.setAttribute("roles", roles);
			rd.forward(request, response);
		}
		catch(Exception e) {
			System.out.println("Admin reg pre exe="+e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
