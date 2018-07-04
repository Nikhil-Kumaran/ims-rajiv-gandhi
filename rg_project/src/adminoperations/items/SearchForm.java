package adminoperations.items;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminoperations.items.ItemsFormBean;

@WebServlet("/SearchForm")
public class SearchForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String search_category;
	private String search_name;
       
    public SearchForm() {
       
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		search_category=req.getParameter("searchCategory");
		if(search_category!="")
		{
			ItemsFormBean bean = new ItemsFormBean();
			search_name=req.getParameter("search_item");
			bean.setSearch_category(search_category);
			bean.setSearch_name(search_name);
			
			RequestDispatcher rd = req.getRequestDispatcher("SearchFormDao");
			req.setAttribute("category", bean);
			rd.forward(req, res);
		}
		else
		{
				Cookie[] c=req.getCookies();
				String s = null;
				for(Cookie d:c)
				{
					System.out.println("servlet"+d.getName());
					if(d.getName().equals("intent"))
					{
						s=d.getName();
						break;
					}
					else if(d.getName().equals("adminsearch")) {
						s=d.getName();
						break;
					}
					else if(d.getName().equals("usersearch")) {
						s=d.getName();
						break;
					}
				}
				if(s.equals("intent")) {
					RequestDispatcher rd = req.getRequestDispatcher("newintent.jsp");
					rd.forward(req,res);
				}
				else if(s.equals("adminsearch")) {
					RequestDispatcher rd = req.getRequestDispatcher("search_item.jsp");
					rd.forward(req,res);
				}
				else if(s.equals("usersearch")) {
					RequestDispatcher rd = req.getRequestDispatcher("user-search_item.jsp");
					rd.forward(req,res);
				}
				
				
		}
	}

}
