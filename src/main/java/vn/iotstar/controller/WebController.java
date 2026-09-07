package vn.iotstar.controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.entity.Product;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.impl.ProductServiceImpl;

@WebServlet(urlPatterns = { "/home", "/product", "/product/detail" })
public class WebController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        if (url.contains("/home")) {
            List<Product> top10 = productService.findTop10();
            req.setAttribute("top10", top10);
            req.getRequestDispatcher("/views/home.jsp").forward(req, resp);
        } else if (url.contains("/product/detail")) {
            int id = Integer.parseInt(req.getParameter("id"));
            req.setAttribute("product", productService.findById(id));
            req.getRequestDispatcher("/views/product-detail.jsp").forward(req, resp);
        } else if (url.contains("/product")) {
            int page = 0;
            if (req.getParameter("page") != null) {
                page = Integer.parseInt(req.getParameter("page"));
            }
            int pageSize = 6;
            List<Product> products = productService.findAll(page, pageSize);
            int total = productService.count();
            int totalPage = (int) Math.ceil((double) total / pageSize);
            
            req.setAttribute("products", products);
            req.setAttribute("currentPage", page);
            req.setAttribute("totalPage", totalPage);
            req.getRequestDispatcher("/views/product-list.jsp").forward(req, resp);
        }
    }
}
