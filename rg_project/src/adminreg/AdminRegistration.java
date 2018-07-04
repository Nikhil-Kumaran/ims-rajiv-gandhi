package adminreg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AdminRegistration")
public class AdminRegistration extends HttpServlet {
	private String rname;
	private String username;
	private String password;
	private String name;
	private String phone;
	private String email;
	private String address;
	private String city;
	private String country;
	private String gender;
    public AdminRegistration() {
    	
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		name = req.getParameter("name");
		rname = req.getParameter("rname");
		username = req.getParameter("username");
		password = req.getParameter("password");
		email = req.getParameter("email");
		address = req.getParameter("address");
		phone = req.getParameter("phone");
		city = req.getParameter("city");
		country = req.getParameter("country");
		gender = req.getParameter("gender");
		AdminRegBean bean = new AdminRegBean();
		bean.setName(name);
		bean.setRname(rname);
		bean.setUsername(username);
		bean.setPassword(password);
		bean.setEmail(email);
		bean.setPhone(phone);
		bean.setAddress(address);
		bean.setCity(city);
		bean.setCountry(country);
		bean.setGender(gender);
		
		req.setAttribute("admin_reg", bean);
		
		RequestDispatcher rd = req.getRequestDispatcher("/AdminRegistrationDao");
		rd.forward(req, res);
	}

}
