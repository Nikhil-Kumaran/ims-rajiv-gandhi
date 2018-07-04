package userlogin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import userreg.UserRegBean;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private String username;
	private String password;
    public UserLogin() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		username = req.getParameter("username");
		password = req.getParameter("password");
		UserRegBean bean = new UserRegBean();
		bean.setUsername(username);
		bean.setPassword(password);
		req.setAttribute("user_log", bean);
		RequestDispatcher rd = req.getRequestDispatcher("/UserLoginDao");
		rd.forward(req, res);
	}

}
