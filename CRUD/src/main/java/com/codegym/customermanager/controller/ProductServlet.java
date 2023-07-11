package com.codegym.customermanager.controller;




import com.codegym.customermanager.model.Product;
import com.codegym.customermanager.service.ProductService;
import com.codegym.customermanager.service.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreate(req, resp);
                break;
            case "edit":
                showEdit(req, resp);
                break;
            case "delete":
                deleteProduct(req, resp);
                break;
            default:
                showList(req, resp);

        }

    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        long id = Long.parseLong(req.getParameter("id"));
        productService.remove(id);

        req.getSession().setAttribute("messageDelete", "Xóa thành công");
        resp.sendRedirect("/products");
    }

    private void showEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long idProduct = Long.parseLong(req.getParameter("id"));

        Product product = productService.findById(idProduct);
        req.setAttribute("products", product);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/products/edit.jsp");
        requestDispatcher.forward(req, resp);

    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> productList = productService.findAll();
        req.setAttribute("products", productList);


        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/products/list.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/products/create.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                saveProduct(req, resp);
                break;
            case "edit":
                updateProduct(req, resp);
                break;
        }
    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        long id = Long.parseLong(req.getParameter("id"));
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        BigDecimal price = new BigDecimal(req.getParameter("price"));

        DateTimeFormatter DATEFORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        LocalDate createAt = LocalDate.parse(req.getParameter("createAt"), DATEFORMATTER);

        Product product = productService.findById(id);
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setCreateAt(createAt);

        productService.update(id, product);
        req.getSession().setAttribute("messageEdit", "Sửa thành công");
        resp.sendRedirect("/products");


    }

    private void saveProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        BigDecimal price = new BigDecimal(req.getParameter("price"));
        DateTimeFormatter DATEFORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        LocalDate createAt = LocalDate.parse(req.getParameter("createAt"), DATEFORMATTER);


        long id = (long)(Math.random() * 10000);
        Product product = new Product(id, name, description, price,createAt);
        productService.save(product);

        req.setAttribute("message", "Thêm thành công");
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/products/create.jsp");
        requestDispatcher.forward(req, resp);
    }
}
