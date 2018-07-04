package userreg;

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
@WebServlet("/UserRegPreprocess")
public class UserRegPreprocess extends HttpServlet {
	Connection conn;
	ArrayList <String> dept = new ArrayList<String>();
	ArrayList <String> desig = new ArrayList<String>();
    public UserRegPreprocess() {
    	conn = ProvideDBConn.getCon();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dept.clear();
		desig.clear();
		PreparedStatement ps;
		ResultSet rs;
		try {
			ps = conn.prepareStatement("select * from dept");
			rs = ps.executeQuery();
			while(rs.next()) {
				dept.add(rs.getString("deptname"));
			}
			ps.close();
			rs.close();
			ps = conn.prepareStatement("select * from designation");
			rs = ps.executeQuery();
			while(rs.next()) {
				desig.add(rs.getString("desname"));
			}
			ps.close();
			rs.close();
			RequestDispatcher rd = request.getRequestDispatcher("user_reg.jsp");
			request.setAttribute("dept", dept);
			request.setAttribute("desig", desig);
			rd.forward(request, response);
		}
		catch(Exception e) {
			System.out.println("Admin reg pre exe="+e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
