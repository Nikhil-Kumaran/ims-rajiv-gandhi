package adminoperations.transaction;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminreg.AdminRegBean;
import connection.ProvideDBConn;

/**
 * Servlet implementation class ViewTransactions
 */
@WebServlet("/ViewTransactions")
public class ViewTransactions extends HttpServlet {
	Collection <TransactionBean> transactions = new ArrayList<TransactionBean>();
	Connection conn;
    public ViewTransactions() throws ClassNotFoundException, SQLException {
    	conn = ProvideDBConn.getCon();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		transactions.clear();
		PreparedStatement query;
		try {
			query = conn.prepareStatement("select * from transaction");
			ResultSet rs = query.executeQuery();
			
			while(rs.next()) {
				TransactionBean bean = new TransactionBean();
				ResultSet username = conn.prepareStatement("select username from user where custid = "+rs.getInt("custid")).executeQuery();
				username.next();
				bean.setUsername(username.getString("username"));
				bean.setUserid(rs.getInt("custid"));
				ResultSet iname = conn.prepareStatement("select iname,ibrand from items where iid = "+rs.getInt("iid")).executeQuery();
				iname.next();
				bean.setIname(iname.getString("iname"));
				bean.setBrandname(iname.getString("ibrand"));
				ResultSet ttname = conn.prepareStatement("select ttname from transactiontype where ttid = "+rs.getInt("ttid")).executeQuery();
				ttname.next();
				bean.setTtname(ttname.getString("ttname"));
				bean.setQuantity(rs.getInt("quantity"));
				bean.setTime(rs.getTimestamp("time"));
				bean.setTransid(rs.getInt("transid"));
				bean.setTtype(rs.getInt("ttid"));
				bean.setLocation(rs.getString("location"));
				transactions.add(bean);
			}
			request.setAttribute("trans", transactions);
			String s = null;
			Cookie c[] = request.getCookies();
			for(Cookie d :c) {
				if(d.getName().equals("manageintent")) {
					s = d.getName();
					d.setMaxAge(0);
					response.addCookie(d);
					break;
				}
				else if(d.getName().equals("alltrans")) {
					s = d.getName();
					d.setMaxAge(0);
					response.addCookie(d);
					break;
				}
				else if(d.getName().equals("myTrans")) {
					s = d.getName();
					d.setMaxAge(0);
					response.addCookie(d);
					break;
				}
				else if(d.getName().equals("usercomplaint")) {
					s = d.getName();
					d.setMaxAge(0);
					response.addCookie(d);
					break;
				}
				else if(d.getName().equals("userreturn")) {
					s = d.getName();
					d.setMaxAge(0);
					response.addCookie(d);
					break;
				}
			}
			if(s.equals("alltrans")) {
				RequestDispatcher rd = request.getRequestDispatcher("view_transactions.jsp");
				rd.forward(request, response);	
			}
			else if(s.equals("manageintent")){
				RequestDispatcher rd = request.getRequestDispatcher("manageintent.jsp");
				rd.forward(request, response);
			}
			else if(s.equals("myTrans")) {
				RequestDispatcher rd = request.getRequestDispatcher("my_transactions.jsp");
				rd.forward(request, response);
			}
			else if(s.equals("usercomplaint")) {
				RequestDispatcher rd = request.getRequestDispatcher("newcomplaint.jsp");
				rd.forward(request, response);
			}
			else if(s.equals("userreturn")) {
				RequestDispatcher rd = request.getRequestDispatcher("newreturn.jsp");
				rd.forward(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}

		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
