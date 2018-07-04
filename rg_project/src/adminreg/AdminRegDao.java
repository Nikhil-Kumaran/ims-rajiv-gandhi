package adminreg;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ProvideDBConn;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(urlPatterns = { "/AdminRegistrationDao" })
public class AdminRegDao extends HttpServlet{
	Connection conn;
	String error = null;
	public AdminRegDao() throws SQLException, ClassNotFoundException {
		conn = ProvideDBConn.getCon();

	}
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		AdminRegBean b = (AdminRegBean) req.getAttribute("admin_reg");
			PreparedStatement query;
			try {
				query = conn.prepareStatement("insert into admin (rid,username,password,name,phone,email,address,city,country,gender) values ((select rid from role where rpermission = ?),?,?,?,?,?,?,?,?,?)"); 
	            //String sqlQuery = "insert into e_book (name,email,pass) values('"+text1+"','"+text2+"','"+text3+"')";
	            query.setString(1,b.getRname());
	            query.setString(2,b.getUsername());
	            query.setString(3,b.getPassword());
	            query.setString(4,b.getName());
	            query.setString(5,b.getPhone());
	            query.setString(6,b.getEmail());
	            query.setString(7,b.getAddress());
	            query.setString(8,b.getCity());
	            query.setString(9,b.getCountry());
	            query.setString(10,b.getGender());
	            query.executeUpdate();
			}
			catch(SQLIntegrityConstraintViolationException prime){
				error = b.getEmail()+" You are already a registered user";
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(error != null) {
				RequestDispatcher rd = req.getRequestDispatcher("/admin_reg.jsp");
				PrintWriter out= res.getWriter();
				out.println("<font color=red>"+error+"</font>");
				rd.include(req, res);
			}
			else {
				RequestDispatcher rd = req.getRequestDispatcher("/admin_login.jsp");
				PrintWriter out= res.getWriter();
				out.println("<font color=green>Registration successful, please login below.</font>");
				rd.include(req, res);
			}
	}
	
}
