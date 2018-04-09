package servlets;

import api.OrderApi;
import common.DBService;
import common.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class CartPageServlet extends HttpServlet {

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DBService.createСonnection();
        if (request.getParameter("action") != null) {
            String login = request.getSession(false).getAttribute("login").toString();
            if (request.getParameter("action").equals("remove")) {
                OrderApi.deleteProductFromCart(login, Integer.parseInt(request.getParameter("id")));
            }
        }
        if (request.getSession(false).getAttribute("login") != null) {
            String login = request.getSession(false).getAttribute("login").toString();
            ArrayList<Product> products = OrderApi.getProductFromCart(login);
            request.setAttribute("products", products);
            int price = 0;
            for (Product product : products) {
                price += product.getPrice();
            }
            request.setAttribute("price", price);
        }
        getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("action") != null) {
            String login = request.getSession(false).getAttribute("login").toString();
            String action = request.getParameter("action");
            switch (action) {
                case "clear":
                    OrderApi.clearShopCart(login);
                    break;
                case "continue":
                    OrderApi.changeStatusToPendingPay(login);
                    break;
            }
        }
        processRequest(request, response);
    }
}