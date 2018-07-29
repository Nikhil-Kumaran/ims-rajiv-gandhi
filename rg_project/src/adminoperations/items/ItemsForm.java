package adminoperations.items;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminoperations.items.ItemsFormBean;

@WebServlet("/ItemsForm")
public class ItemsForm extends HttpServlet {
	private String type_category_id;
	private String category_id;
	private String product_name;
	private String product_brand;
	private String unit;
	private String supplier;
	private float price;
	private int stock;
	
	private static final long serialVersionUID = 1L;
   
    public ItemsForm() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		type_category_id=req.getParameter("topcategory");
		category_id=req.getParameter("category");
		product_name=req.getParameter("itemname");
		product_brand=req.getParameter("brandname");
		unit=req.getParameter("unit");
		price=Float.parseFloat(req.getParameter("price"));
		stock=Integer.parseInt((req.getParameter("stock")));
		supplier=req.getParameter("supplier");
		
		ItemsFormBean bean = new ItemsFormBean();
		bean.setType_category_id(type_category_id);
		bean.setCategory_id(category_id);
		bean.setProduct_name(product_name);
		bean.setProduct_brand(product_brand);
		bean.setUnit(unit);
		bean.setPrice(price);
		bean.setStock(stock);
		bean.setSupplier(supplier);
		
		RequestDispatcher rd = req.getRequestDispatcher("/ItemsFormDao");
		req.setAttribute("item", bean);
		rd.forward(req, res);
	}

}