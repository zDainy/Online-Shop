package servlets;

import api.OrderApi;
import common.DBService;
import api.ProductApi;
import common.Global;
import common.Product;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainPageServlet extends HttpServlet {

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DBService.createСonnection();
        ArrayList<Product> products = ProductApi.getProducts(Global.NONE, 0, 99999, Global.NONE, Global.NONE, -1, 0, 8);
        request.setAttribute("products", products);
        getServletContext().getRequestDispatcher("/main.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        String login = request.getSession(false).getAttribute("login").toString();
        OrderApi.addProductToCart(login, Integer.parseInt(productId));
        processRequest(request, response);
    }
}