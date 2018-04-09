package servlets;

import api.CustomerApi;
import api.OrderApi;
import common.Customer;
import common.DBService;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProfilePageServlet extends HttpServlet {

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DBService.createСonnection();

        getServletContext().getRequestDispatcher("/profile.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        if (type.equals("logIn") && CustomerApi.isAuthenticationSuccess(login, password)) {
            HttpSession session = request.getSession(true);
            session.setAttribute("login", login);
            Customer cust = CustomerApi.getCustomer(login);
            request.setAttribute("name", cust.getName());
            request.setAttribute("email", cust.getEmail());
            request.setAttribute("phone", cust.getPhone());
            request.setAttribute("address", cust.getAddress());
        } else if (type.equals("registration")) {
            if (CustomerApi.isCustomerExist(login)) {
                // ошибка
            } else {
                CustomerApi.createCustomer(login, password);
                // успех
            }
        } else if (type.equals("setInfo")) {
            login = request.getSession(false).getAttribute("login").toString();
            CustomerApi.setCustomerInfo(login, name, email, phone, address);
        }
        processRequest(request, response);
    }
}