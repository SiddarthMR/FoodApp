package com.food.DBUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class DBUtils {

    private static final String url = "jdbc:mysql://localhost:3306/foodapp";
    private static final String username = "root";
    private static final String password = "Siddu@143";

    public static Connection myConnect() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Connected");
        return con;
    }
}
