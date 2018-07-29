package admin_complaints;

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
import user_complaints.ComplaintBean;

@WebServlet("/IgnoreComplaint")
public class IgnoreComplaint extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn;
    public IgnoreComplaint() {
    	conn = ProvideDBConn.getCon();
    }
    protected void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		int cid=Integer.parseInt(req.getParameter("cid"));
		PreparedStatement query;
		try 
		{
			String sql=null;
			Statement stmt = conn.createStatement();
			query = conn.prepareStatement("update complaints set ctype=2 where cid= ?");
			query.setInt(1,cid);
			query.executeUpdate();
			res.sendRedirect("ComplaintView");
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
    }
}
