package api;

import common.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

public class OrderApi {

    public static ArrayList<Product> getProductsInOrder(int id) {
        String productIds = "";
        boolean isFirst = true;
        try {
            PreparedStatement statement = DBService.getConnection().prepareStatement(
                    "SELECT product_id FROM prod_order" +
                            " WHERE order_id = ?;"
            );
            statement.setInt(1, id);
            ResultSet res = statement.executeQuery();
            while (res.next()) {
                productIds += isFirst ? "" : ",";
                productIds += res.getInt("product_id");
                isFirst = false;
            }
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
        return ProductApi.getProducts(productIds, 0, 999999, Global.NONE, Global.NONE, -1, 0, 10);
    }

    public static ArrayList<Order> getOrders(int customerId) {
        ArrayList<Order> orders = new ArrayList<>();
        int orderId;
        int price;
        Date dateCreated;
        String status;
        try {
            PreparedStatement statement = DBService.getConnection().prepareStatement(
                    "SELECT ord_id, price, cust_id, date_created, status FROM cust_order" +
                            " WHERE cust_id = ?;"
            );
            statement.setInt(1, customerId);
            ResultSet res = statement.executeQuery();
            while (res.next()) {
                orderId = res.getInt("ord_id");
                price = res.getInt("price");
                dateCreated = res.getDate("date_created");
                status = res.getString("status");
                orders.add(new Order(orderId, price, customerId, dateCreated, status));
            }
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
        return orders;
    }

    public static ArrayList<Product> getProductFromCart(String login) {
        String productIds = "";
        boolean isFirst = true;
        try {
            Customer cust = CustomerApi.getCustomer(login);
            PreparedStatement statement = DBService.getConnection().prepareStatement(
                    "SELECT product_id FROM prod_order" +
                            " WHERE order_id = (SELECT ord_id FROM cust_order WHERE cust_id = ? AND status = 'CART');"
            );
            statement.setInt(1, cust.getId());
            ResultSet res = statement.executeQuery();
            while (res.next()) {
                productIds += isFirst ? "" : ",";
                productIds += res.getInt("product_id");
                isFirst = false;
            }
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
        return ProductApi.getProducts(productIds, 0, 999999, Global.NONE, Global.NONE, -1, 0, 10);
    }

    public static void addProductToCart(String login, int productId) {
        int count = 0;
        int orderId = 0;
        try {
            Customer cust = CustomerApi.getCustomer(login);
            PreparedStatement searchStatement = DBService.getConnection().prepareStatement(
                    "SELECT COUNT(*) FROM cust_order" +
                            " WHERE cust_id = ? AND status = 'CART';"
            );
            searchStatement.setInt(1, cust.getId());
            ResultSet searchRes = searchStatement.executeQuery();
            if (searchRes.next()) {
                count = searchRes.getInt("count");
            }
            if (count == 0) {
                PreparedStatement createCartStatement = DBService.getConnection().prepareStatement(
                        "INSERT INTO cust_order (cust_id, status)" +
                                " VALUES (?, 'CART');"
                );
                createCartStatement.setInt(1, cust.getId());
                createCartStatement.executeQuery();
            }

            PreparedStatement getIdCartOrderStatement = DBService.getConnection().prepareStatement(
                    "SELECT ord_id FROM cust_order" +
                            " WHERE cust_id = ? AND status = 'CART';"
            );
            getIdCartOrderStatement.setInt(1, cust.getId());
            ResultSet cartOrderRes = getIdCartOrderStatement.executeQuery();
            if (cartOrderRes.next()) {
                orderId = cartOrderRes.getInt("ord_id");
            }

            PreparedStatement addProductToOrder = DBService.getConnection().prepareStatement(
                    "INSERT INTO prod_order (product_id, order_id)" +
                            " VALUES (?, ?);"
            );
            addProductToOrder.setInt(1, productId);
            addProductToOrder.setInt(2, orderId);
            addProductToOrder.executeQuery();

        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
    }

    public static void clearShopCart(String login) {
        try {
            Customer cust = CustomerApi.getCustomer(login);
            PreparedStatement statement = DBService.getConnection().prepareStatement(
                    "DELETE FROM prod_order WHERE order_id = (SELECT ord_id FROM cust_order WHERE cust_id = ? AND status = 'CART');"
            );
            statement.setInt(1, cust.getId());
            statement.executeQuery();
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
    }

    public static void deleteProductFromCart(String login, int productId) {
        try {
            Customer cust = CustomerApi.getCustomer(login);
            PreparedStatement statement = DBService.getConnection().prepareStatement(
                    "DELETE FROM prod_order WHERE product_id = ? AND order_id = (SELECT ord_id FROM cust_order WHERE cust_id = ? AND status = 'CART');"
            );
            statement.setInt(1, productId);
            statement.setInt(2, cust.getId());
            statement.executeQuery();
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
    }

    public static void changeStatusToPendingPay(String login) {
        try {
            Customer cust = CustomerApi.getCustomer(login);
            PreparedStatement statement = DBService.getConnection().prepareStatement(
                    "UPDATE cust_order SET status = 'PENDING_PAY' WHERE cust_id = ?;"
            );
            statement.setInt(1, cust.getId());
            statement.executeQuery();
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
    }
}
