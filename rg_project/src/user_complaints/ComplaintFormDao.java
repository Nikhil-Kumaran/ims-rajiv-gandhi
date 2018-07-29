package user_complaints;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ProvideDBConn;

@WebServlet("/ComplaintFormDao")
public class ComplaintFormDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn;
    public ComplaintFormDao() {
    	conn = ProvideDBConn.getCon();
    }
    protected void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		ComplaintBean b = (ComplaintBean) req.getAttribute("complaint");
		PreparedStatement query;
		try 
		{
			String sql=null;
			Statement stmt = conn.createStatement();
			int transID=b.getTransid();
			String desc=b.getComplaint_description();
			query = conn.prepareStatement("insert into complaints (transid,ctype,cdesc) values(?,0,?)");
			query.setInt(1,transID);
			query.setString(2,desc);
			query.executeUpdate();
			res.sendRedirect("complaintredirect.jsp");
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
    }
}
