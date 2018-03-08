package Common;

import java.sql.*;

public class DBService {
    // Database
    private static final String DB_URL = "jdbc:postgresql://127.0.0.1:5432/Online shop";
    private static final String USER = "postgres";
    private static final String PASS = "123456";

    public static Statement getStatement() {
        return statement;
    }

    public static void setStatement(Statement statement) {
        DBService.statement = statement;
    }

    public static Connection getConnection() {
        return connection;
    }

    public static void setConnection(Connection connection) {
        DBService.connection = connection;
    }

    private static Statement statement;
    private static Connection connection;

    public static void create_connection() {
// Подключение драйвера
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("PostgreSQL JDBC Driver is not found.");
            e.printStackTrace();
        }

        System.out.println("PostgreSQL JDBC Driver successfully connected");
        connection = null;

// Соединение с бд
        try {
            connection = DriverManager.getConnection(DB_URL, USER, PASS);
            statement = connection.createStatement();
        } catch (SQLException e) {
            System.out.println("Connection Failed");
            e.printStackTrace();
        }
    }
}
