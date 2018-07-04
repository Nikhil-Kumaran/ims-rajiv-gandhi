package userreg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {

    public UserRegistration() {
    	
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		UserRegBean bean = new UserRegBean();
		
		bean.setName(req.getParameter("name"));
		bean.setUsername(req.getParameter("username"));
		bean.setPassword(req.getParameter("password"));
		bean.setEmail(req.getParameter("email"));
		bean.setPhone( req.getParameter("phone"));
		bean.setAddress(req.getParameter("address"));
		bean.setCity(req.getParameter("city"));
		bean.setCountry( req.getParameter("country"));
		bean.setGender(req.getParameter("gender"));
		bean.setPurchased(0);
		bean.setDeptname(req.getParameter("dept"));
		bean.setDesig(req.getParameter("desig"));
		
		
		req.setAttribute("user_reg", bean);
		
		RequestDispatcher rd = req.getRequestDispatcher("/UserRegistrationDao");
		rd.forward(req, res);
	}

}
