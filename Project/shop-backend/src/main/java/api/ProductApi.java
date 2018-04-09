package api;

import common.DBService;
import common.Product;

import java.sql.*;
import java.util.ArrayList;

import common.Global;

public class ProductApi {


    public static Product getProduct(Integer id) {
        String name = "";
        Integer price = 0;
        String description = "";
        Integer quantity = 0;
        String category = "";
        String size = "";
        Integer gender = 0;
        String imgSrc = "";
        try {
            PreparedStatement statement = DBService.getConnection().prepareStatement(
                    "SELECT name, price, description, quantity, prod_category, prod_size, prod_gender, img_src FROM product " +
                            " WHERE prd_id = ?;"
            );
            statement.setInt(1, id);
            ResultSet res = statement.executeQuery();
            if (res.next()) {
                name = res.getString("name");
                price = res.getInt("price");
                description = res.getString("description");
                quantity = res.getInt("quantity");
                category = res.getString("prod_category");
                size = res.getString("prod_size");
                gender = res.getInt("prod_gender");
                imgSrc = res.getString("img_src");
            }
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
        return new Product(id, name, price, description, quantity, category, size, gender, imgSrc);
    }

    public static ArrayList<Product> getProducts(String prodIds, int minPriceFilter, int maxPriceFilter, String categoryFilter, String sizeFilter, int genderFilter, int offset, int limit) {
        ArrayList<Product> products = new ArrayList<>();
        int id;
        String name;
        Integer price;
        String description;
        Integer quantity;
        String category;
        String size;
        Integer gender;
        String imgSrc;
        String query;
        try {
            query = "SELECT prd_id, name, price, description, quantity, prod_category, prod_size, prod_gender, img_src FROM product";

            query += " WHERE price BETWEEN " + minPriceFilter + " AND " + maxPriceFilter;

            if (!prodIds.equals(Global.NONE)) {
                query += " AND " + "prd_Id IN (" + prodIds + ")";
            }
            if (!categoryFilter.equals(Global.NONE)) {
                query += " AND " + "prod_category = '" + categoryFilter + "'";
            }
            if (!sizeFilter.equals(Global.NONE)) {
                query += " AND " + "prod_size IN (" + sizeFilter + ")";
            }
            if (genderFilter != -1) {
                query += " AND " + "prod_gender = " + genderFilter;
            }

            query += " OFFSET " + offset + " LIMIT " + limit;

            ResultSet res = DBService.getConnection().createStatement().executeQuery(query);
            while (res.next()) {
                id = res.getInt("prd_id");
                name = res.getString("name");
                price = res.getInt("price");
                description = res.getString("description");
                quantity = res.getInt("quantity");
                category = res.getString("prod_category");
                size = res.getString("prod_size");
                gender = res.getInt("prod_gender");
                imgSrc = res.getString("img_src");
                products.add(new Product(id, name, price, description, quantity, category, size, gender, imgSrc));
            }
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
        return products;
    }
}