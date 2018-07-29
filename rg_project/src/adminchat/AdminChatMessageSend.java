package adminchat;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ProvideDBConn;
import user_complaints.ComplaintBean;

/**
 * Servlet implementation class AdminChatMessage
 */
@WebServlet("/AdminChatMessageSend")
public class AdminChatMessageSend extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Connection conn;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChatMessageSend() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int transid =  Integer.parseInt(request.getParameter("transid"));
		int userid =  Integer.parseInt(request.getParameter("userid"));
		String message =  request.getParameter("message");
		int p_type =  Integer.parseInt(request.getParameter("p_type"));
		conn = ProvideDBConn.getCon();
		ResultSet rs = null;
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement("insert into chat(userid,transid,message,p_type) values(?,?,?,?)");
			ps.setInt(1, userid);
			ps.setInt(2, transid);
			ps.setString(3, message);
			ps.setInt(4, p_type);
			ps.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("in admin send message "+e);
		}
		
		response.sendRedirect("admin_chat_message.jsp?transid="+transid+"&userid="+userid);
		
	}

}
