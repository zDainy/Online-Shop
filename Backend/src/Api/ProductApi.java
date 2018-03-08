package Api;

import Common.DBService;
import Common.Product;
import java.sql.*;

public class ProductApi {

    public Product getProduct(Integer id) {
        String name = "";
        Integer price = 0;
        String description = "";
        Integer quantity = 0;
        String category = "";
        String size = "";
        Integer gender = 0;
        String img_src = "";
        try {
            PreparedStatement statement = DBService.getConnection().prepareStatement(
                    "SELECT name, price, description, quantity, category, size, gender, img_src FROM product" +
                            " WHERE prd_id = ?;"
            );
            statement.setString(1, id.toString());
            ResultSet res = statement.executeQuery();
            name = res.getString("name");
            price = res.getInt("price");
            description = res.getString("description");
            quantity = res.getInt("quantity");
            category = res.getString("category");
            size = res.getString("size");
            gender = res.getInt("gender");
            img_src = res.getString("img_src");
        } catch (Exception e)
        {

        }
        return new Product(name, price, description, quantity, category, size, gender, img_src);
    }
}
