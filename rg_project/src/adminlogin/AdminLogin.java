package adminlogin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminreg.AdminRegBean;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private String username;
	private String password;
    public AdminLogin() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		username = req.getParameter("username");
		password = req.getParameter("password");
		AdminRegBean bean = new AdminRegBean();
		bean.setUsername(username);
		bean.setPassword(password);
		req.setAttribute("admin_log", bean);
		RequestDispatcher rd = req.getRequestDispatcher("/AdminLoginDao");
		rd.forward(req, res);
	}

}
