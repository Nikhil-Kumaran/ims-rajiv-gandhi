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

@WebServlet("/ReplyFormDao")
public class ReplyFormDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn;
    public ReplyFormDao() {
    	conn = ProvideDBConn.getCon();
    }
    protected void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		ComplaintBean b = (ComplaintBean) req.getAttribute("reply");
		PreparedStatement query;
		try 
		{
			String sql=null;
			Statement stmt = conn.createStatement();
			int cid=b.getCid();
			String desc=b.getAdmin_reply();
			query = conn.prepareStatement("update complaints set adminreply=? where cid="+cid);
			query.setString(1, desc);
			query.executeUpdate();
			query = conn.prepareStatement("update complaints set ctype=1 where cid="+cid);
			query.executeUpdate();
			res.sendRedirect("ComplaintView");
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
    }
}
