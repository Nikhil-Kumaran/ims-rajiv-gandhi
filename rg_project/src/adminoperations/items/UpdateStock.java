package adminoperations.items;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminoperations.items.ItemsFormBean;

@WebServlet("/UpdateStock")
public class UpdateStock extends HttpServlet {
	private String product_name;
	private String product_brand;
	private int updated_stock;
	
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		product_name=req.getParameter("prod_name");
		product_brand=req.getParameter("item_brand");
		updated_stock=Integer.parseInt((req.getParameter("stock")));
		
		ItemsFormBean bean = new ItemsFormBean();
		bean.setProduct_name(product_name);
		bean.setProduct_brand(product_brand);
		bean.setUpdated_stock(updated_stock);
		
		RequestDispatcher rd = req.getRequestDispatcher("/UpdateStockDao");
		req.setAttribute("updateStock", bean);
		rd.forward(req, res);
	}

}
