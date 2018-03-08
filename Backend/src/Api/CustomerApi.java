package Api;

import Common.Customer;
import Common.DBService;
import java.sql.*;

public  class CustomerApi {

    public boolean isAuthenticationSuccess(String login, String password) {
        boolean result = false;
        try {
            PreparedStatement statement = DBService.getConnection().prepareStatement(
                    "SELECT login, password FROM customer" +
                            " WHERE login = ?" +
                            " AND password = ?;"
            );
            statement.setString(1, login);
            statement.setString(2, password);
            ResultSet res = statement.executeQuery();
           // TODO:  проверка на непустой селект
          //  result =
        } catch (Exception e)
        {

        }
        return result;
    }

    public Customer getCustomer(String login) {
        String name = "";
        String email = "";
        String phone = "";
        String address = "";
        try {
            PreparedStatement statement = DBService.getConnection().prepareStatement(
                    "SELECT ci.name, ci.email, ci.phone, ci.delivery_addr FROM customer c, cust_info ci" +
                            " WHERE c.cust_id = ci.cstinf_id" +
                            " AND c.login = ?;"
            );
            statement.setString(1, login);
            ResultSet res = statement.executeQuery();
            name = res.getString("name");
            email = res.getString("email");
            phone = res.getString("phone");
            address = res.getString("delivery_addr");
        } catch (Exception e)
        {

        }
        return new Customer(login, name , email, phone, address);
    }

    public void createCustomer(String login, String password) {
        try {
            PreparedStatement statement = DBService.getConnection().prepareStatement(
                    "INSERT INTO customer (login, password)" +
                            " VALUES (?, ?);"
            );
            statement.setString(1, login);
            statement.setString(2, password);
            statement.executeQuery();
        } catch (Exception e)
        {

        }
    }

    public void setCustomerInfo(String login, String name, String email, String phone, String address) {
        try {
            PreparedStatement statement = DBService.getConnection().prepareStatement(
                    "UPDATE cust_info SET" +
                            " name = ?," +
                            " email = ?," +
                            " phone = ?," +
                            " address = ?" +
                            " WHERE cstinf_id IN (SELECT cust_id FROM customer WHERE login = ?);"
            );
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, phone);
            statement.setString(4, address);
            statement.setString(5, login);
            statement.executeQuery();
        } catch (Exception e)
        {

        }
    }
}
