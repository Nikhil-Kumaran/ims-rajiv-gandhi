package userlogin;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
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

import connection.ProvideDBConn;
import userreg.UserRegBean;
@WebServlet("/UserLoginDao")
public class UserLoginDao extends HttpServlet {

	Connection conn;
	ResultSet rs;
	String error = null;
    public UserLoginDao() throws SQLException, ClassNotFoundException {
        conn = ProvideDBConn.getCon();
    }
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		UserRegBean b = (UserRegBean) req.getAttribute("user_log");
			PreparedStatement query;
			try {
				query=conn.prepareStatement("select * from user where username=?");
	            query.setString(1, b.getUsername());
	            rs = query.executeQuery();
	            String plainText=b.getPassword();
				MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
				mdAlgorithm.update(plainText.getBytes());

				byte[] digest = mdAlgorithm.digest();
				StringBuffer hexString = new StringBuffer();

				for (int i = 0; i < digest.length; i++) {
				    plainText = Integer.toHexString(0xFF & digest[i]);

				    if (plainText.length() < 2) {
				        plainText = "0" + plainText;
				    }

				    hexString.append(plainText);
				}
				plainText=hexString.toString();
	            if(!rs.next()) {
	            	error = b.getUsername()+" is not a registered user";
	            }
	            else if(!rs.getString("password").equals(plainText)) {
	            	error = "Incorrect Password";
	            }
	            else {
	            	error = null;
	            }
			}
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(error != null) {
				RequestDispatcher rd = req.getRequestDispatcher("/user_login.jsp");
				PrintWriter out= res.getWriter();
				out.println("<font color=red>"+error+"</font>");
				rd.include(req, res);
			}
			else {
				try {
					b.setCustid(rs.getInt("custid"));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				HttpSession ses = req.getSession();
				ses.setAttribute("user", b);
				res.sendRedirect("user_welcome.jsp");
			}
	}

}