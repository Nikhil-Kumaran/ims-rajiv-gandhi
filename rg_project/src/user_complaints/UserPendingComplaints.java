package user_complaints;

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

import user_complaints.ComplaintBean;

@WebServlet("/UserPendingComplaints")
public class UserPendingComplaints extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn;
    public UserPendingComplaints() {
    	try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ims?autoReconnect=true&useSSL=false","root","nattu4598");
		} 
		catch (Exception e1) 
		{
			e1.printStackTrace();
		}
    }
    protected void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		PreparedStatement query;
		String userid=null;
		Collection <ComplaintBean> ViewPendingComplaint = new ArrayList<ComplaintBean>();
		try 
		{
			String sql=null;
			Statement stmt = conn.createStatement();
			query=conn.prepareStatement("(select * from complaints where complaintstatus=1)as pendingview inner join (select transid from transaction where userid='"+userid+"')as transview on pendingview.transid=transview.transid");
			ResultSet rs=query.executeQuery();
			while(rs.next())
			{
				ComplaintBean b = new ComplaintBean();
				b.setTransid(rs.getInt("transid"));
				
				sql="select * from complaintstatus where complainttype="+rs.getInt("complaintstatus");
				Statement stmt1 = conn.createStatement();
				ResultSet rs1=stmt1.executeQuery(sql);
				rs1.next();
				b.setStatus(rs1.getString("complaintname"));
				
				b.setComplaint_description(rs.getString("complaintdesc"));
				ViewPendingComplaint.add(b);
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		req.setAttribute("ViewPendingComplaints", ViewPendingComplaint);
		RequestDispatcher rd = req.getRequestDispatcher("UserPendingView.jsp");
		rd.forward(req, res);
    }
}
