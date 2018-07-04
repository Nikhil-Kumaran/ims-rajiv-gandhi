package userreg;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ProvideDBConn;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.*;

@WebServlet(urlPatterns = { "/UserRegistrationDao" })
public class UserRegDao extends HttpServlet{
	Connection conn;
	String error = null;
	public UserRegDao() throws SQLException, ClassNotFoundException {
		
        conn = ProvideDBConn.getCon();

	}
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		UserRegBean b = (UserRegBean) req.getAttribute("user_reg");
			PreparedStatement query;
			try {
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
				
				query = conn.prepareStatement("insert into user (username,password,name,phone,email,address,city,country,gender,purchased,deptid,desid) values (?,?,?,?,?,?,?,?,?,?,(select deptid from dept where deptname = ?),(select desid from designation where desname = ?))"); 
	            //String sqlQuery = "insert into e_book (name,email,pass) values('"+text1+"','"+text2+"','"+text3+"')";
	            query.setString(1,b.getUsername());
	            query.setString(2,plainText);
	            query.setString(3,b.getName());
	            query.setString(4,b.getPhone());
	            query.setString(5,b.getEmail());
	            query.setString(6,b.getAddress());
	            query.setString(7,b.getCity());
	            query.setString(8,b.getCountry());
	            query.setString(9,b.getGender());
	            query.setInt(10,b.getPurchased());
	            query.setString(11,b.getDeptname());
	            query.setString(12,b.getDesig());
	            query.executeUpdate();
			}
			catch(SQLIntegrityConstraintViolationException prime){
				error = b.getEmail()+" You are already a registered user";
			}
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(error != null) {
				RequestDispatcher rd = req.getRequestDispatcher("/user_reg.jsp");
				PrintWriter out= res.getWriter();
				out.println("<font color=red>"+error+"</font>");
				rd.include(req, res);
			}
			else {
				RequestDispatcher rd = req.getRequestDispatcher("/user_login.jsp");
				PrintWriter out= res.getWriter();
				out.println("<font color=green>Registration successful, please login below.</font>");
				rd.include(req, res);
			}
	}
	
}
