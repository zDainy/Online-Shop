package servlets;

import api.ProductApi;
import common.DBService;
import common.Global;
import common.Product;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductPageServlet extends HttpServlet {

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int gender = -1;
        String cat = Global.NONE;
        String size = Global.NONE;
        int minPrice = 0;
        int maxPrice = 99999;

        DBService.createСonnection();

        if (request.getParameter("gender") != null) {
            gender = Integer.parseInt(request.getParameter("gender"));
        }
        if (request.getParameter("cat") != null) {
            cat = request.getParameter("cat");
        }
        ArrayList<Product> products = ProductApi.getProducts(Global.NONE, minPrice, maxPrice, cat, size, gender, 0, 12);
        request.setAttribute("products", products);
        getServletContext().getRequestDispatcher("/product.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String size = "";
        int minPrice = 0;
        int maxPrice = 99999;
        boolean isFirst = true;

        if (request.getParameter("xxs") != null && request.getParameter("xxs").equals("on")) {
            size += isFirst ? "" : ",";
            size += "'XXS'";
            isFirst = false;
        }
        if (request.getParameter("xs") != null && request.getParameter("xs").equals("on")) {
            size += isFirst ? "" : ",";
            size += "'XS'";
            isFirst = false;
        }
        if (request.getParameter("s") != null && request.getParameter("s").equals("on")) {
            size += isFirst ? "" : ",";
            size += "'S'";
            isFirst = false;
        }
        if (request.getParameter("m") != null && request.getParameter("m").equals("on")) {
            size += isFirst ? "" : ",";
            size += "'M'";
            isFirst = false;
        }
        if (request.getParameter("l") != null && request.getParameter("l").equals("on")) {
            size += isFirst ? "" : ",";
            size += "'L'";
            isFirst = false;
        }
        if (request.getParameter("xl") != null && request.getParameter("xl").equals("on")) {
            size += isFirst ? "" : ",";
            size += "'XL'";
            isFirst = false;
        }
        if (request.getParameter("xxl") != null && request.getParameter("xxl").equals("on")) {
            size += isFirst ? "" : ",";
            size += "'XXL'";
        }
        if (request.getParameter("min") != null && !request.getParameter("min").equals("")) {
            minPrice = Integer.parseInt(request.getParameter("min"));
        }
        if (request.getParameter("max") != null && !request.getParameter("max").equals("")) {
            maxPrice = Integer.parseInt(request.getParameter("max"));
        }
        if (size.equals("")) {
            size = Global.NONE;
        }
        ArrayList<Product> products = ProductApi.getProducts(Global.NONE, minPrice, maxPrice, Global.NONE, size, -1, 0, 12);
        request.setAttribute("products", products);
        getServletContext().getRequestDispatcher("/product.jsp").forward(request, response);
    }
}