package admin_complaints;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminoperations.items.ItemsFormBean;
import connection.ProvideDBConn;
import user_complaints.ComplaintBean;

@WebServlet("/ComplaintView")
public class ComplaintView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn;
    public ComplaintView() {
    	conn = ProvideDBConn.getCon();
    }
    protected void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		PreparedStatement query;
		Collection <ComplaintBean> complaint_list = new ArrayList<ComplaintBean>();
		try 
		{
			String sql=null;
			Statement stmt = conn.createStatement();
			query = conn.prepareStatement("select * from complaints");
			ResultSet rs=query.executeQuery();
			
			while(rs.next())
			{
				ComplaintBean b = new ComplaintBean();
				b.setTransid(rs.getInt("transid"));
				b.setCid(rs.getInt("cid"));
				sql="select * from complaintstatus where ctype="+rs.getInt("ctype");
				Statement stmt1 = conn.createStatement();
				ResultSet rs1=stmt1.executeQuery(sql);
				rs1.next();
				b.setStatus(rs1.getString("cname"));
				
				b.setComplaint_description(rs.getString("cdesc"));
				b.setAdmin_reply(rs.getString("adminreply"));
				complaint_list.add(b);
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		req.setAttribute("complaints", complaint_list);
		RequestDispatcher rd = req.getRequestDispatcher("complaint_list.jsp");
		rd.forward(req, res);
    }

}
