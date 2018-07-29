package adminoperations.items;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ProvideDBConn;

/**
 * Servlet implementation class ItemsPreprocess
 */
@WebServlet("/ItemsPreprocess")
public class ItemsPreprocess extends HttpServlet {
	Connection conn;
	ArrayList <String> tcname= new ArrayList<String>();
	ArrayList <String> cname= new ArrayList<String>();
	ArrayList <String> sname= new ArrayList<String>();
    public ItemsPreprocess() {
    	conn = ProvideDBConn.getCon();
    }
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		tcname.clear();
		cname.clear();
		sname.clear();
		PreparedStatement ps;
		ResultSet rs;
		try {
			
			ps = conn.prepareStatement("select * from categories");
			rs = ps.executeQuery();
			while(rs.next()) {
				cname.add(rs.getString("cname"));
			}
			rs.close();
			ps.close();
			ps = conn.prepareStatement("select * from tcategories");
			rs = ps.executeQuery();
			while(rs.next()) {
				tcname.add(rs.getString("tcname"));
			}
			rs.close();
			ps.close();
			ps = conn.prepareStatement("select * from suppliers");
			rs = ps.executeQuery();
			while(rs.next()) {
				sname.add(rs.getString("suppname"));
			}
			rs.close();
			ps.close();
			RequestDispatcher rd = req.getRequestDispatcher("add_items.jsp");
			req.setAttribute("cname", cname);
			req.setAttribute("tcname", tcname);
			req.setAttribute("sname", sname);
			rd.forward(req, res);
		}
		catch(Exception e) {
			System.out.println("item preprocess exp = "+e);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}