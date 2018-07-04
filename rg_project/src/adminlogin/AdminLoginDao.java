package adminlogin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminreg.AdminRegBean;
import connection.ProvideDBConn;
import adminreg.AdminRegBean;
@WebServlet("/AdminLoginDao")
public class AdminLoginDao extends HttpServlet {
	int userid;
	ResultSet rs ;
	Connection conn;
	String error = null;
    public AdminLoginDao() throws SQLException, ClassNotFoundException {
    	conn = ProvideDBConn.getCon();
    }
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		AdminRegBean b = (AdminRegBean) req.getAttribute("admin_log");
			PreparedStatement query;
			try {
				query=conn.prepareStatement("select * from admin where username=?");
	            query.setString(1, b.getUsername());
	            rs = query.executeQuery();
	            if(!rs.next()) {
	            	error = b.getUsername()+" is not a registered user";
	            }
	            else if(!rs.getString("password").equals(b.getPassword())) {
	            	error = "Incorrect Password";
	            }
	            else {
	            	error = null;
	            }
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(error != null) {
				RequestDispatcher rd = req.getRequestDispatcher("/admin_login.jsp");
				PrintWriter out= res.getWriter();
				out.println("<font color=red>"+error+"</font>");
				rd.include(req, res);
			}
			else {
				try {
					b.setUid(rs.getInt("uid"));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				HttpSession ses = req.getSession();
				ses.setAttribute("admin", b);
				res.sendRedirect("admin_welcome.jsp");
			}
	}

}