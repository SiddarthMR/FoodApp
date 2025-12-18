package com.food.DAOImpl;

import java.sql.*;
import java.util.ArrayList;

import com.food.DAO.RestaurantDAO;
import com.food.DBUtils.DBUtils;
import com.food.model.Restaurant;

public class RestaurantDAOImpl implements RestaurantDAO {

    private Connection con;
    private PreparedStatement pstmt;
    private Statement stmt;
    private ResultSet resultSet;

    ArrayList<Restaurant> restaurantList = new ArrayList<>();
    Restaurant restaurant;
    int status = 0;

    // SQL Queries
    private static final String ADD_RESTAURANT =
        "INSERT INTO `restaurant`(`restaurantName`, `deliveryTime`, `cuisineType`, `address`, `rating`, `isActive`, `imagePath`) VALUES (?, ?, ?, ?, ?, ?, ?)";
    
    private static final String SELECT_ALL =
        "SELECT * FROM `restaurant`";
    
    private static final String SELECT_BY_ID =
        "SELECT * FROM `restaurant` WHERE `restaurantId`=?";
    
    private static final String UPDATE_BY_ID =
        "UPDATE `restaurant` SET `restaurantName`=?, `deliveryTime`=?, `cuisineType`=?, `address`=?, `rating`=?, `isActive`=?, `imagePath`=? WHERE `restaurantId`=?";
    
    private static final String DELETE_BY_ID =
        "DELETE FROM `restaurant` WHERE `restaurantId`=?";

    public RestaurantDAOImpl() {
        try {
            con = DBUtils.myConnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int addRestaurant(Restaurant r) {
        try {
            pstmt = con.prepareStatement(ADD_RESTAURANT);
            pstmt.setString(1, r.getRestaurantName());
            pstmt.setString(2, r.getDeliveryTime());
            pstmt.setString(3, r.getCuisineType());
            pstmt.setString(4, r.getAddress());
            pstmt.setDouble(5, r.getRating());
            pstmt.setBoolean(6, r.isActive());
            
            pstmt.setString(8, r.getImagePath());

            status = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public ArrayList<Restaurant> getAllRestaurants() {
        try {
            stmt = con.createStatement();
            resultSet = stmt.executeQuery(SELECT_ALL);
            restaurantList = extractRestaurantFromResultSet(resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurantList;
    }

    @Override
    public Restaurant getRestaurant(int restaurantId) {
        try {
            pstmt = con.prepareStatement(SELECT_BY_ID);
            pstmt.setInt(1, restaurantId);
            resultSet = pstmt.executeQuery();

            restaurantList = extractRestaurantFromResultSet(resultSet);
            if (!restaurantList.isEmpty()) {
                restaurant = restaurantList.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return restaurant;
    }

    @Override
    public int updateRestaurant(Restaurant r) {
        try {
            pstmt = con.prepareStatement(UPDATE_BY_ID);
            pstmt.setString(1, r.getRestaurantName());
            pstmt.setString(2, r.getDeliveryTime());
            pstmt.setString(3, r.getCuisineType());
            pstmt.setString(4, r.getAddress());
            pstmt.setDouble(5, r.getRating());
            pstmt.setBoolean(6, r.isActive());
           
            pstmt.setString(8, r.getImagePath());
            pstmt.setInt(9, r.getRestaurantId());

            status = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public int deleteRestaurant(int restaurantId) {
        try {
            pstmt = con.prepareStatement(DELETE_BY_ID);
            pstmt.setInt(1, restaurantId);
            status = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    private ArrayList<Restaurant> extractRestaurantFromResultSet(ResultSet resultSet) {
        ArrayList<Restaurant> list = new ArrayList<>();
        try {
            while (resultSet.next()) {
                list.add(new Restaurant(
                    resultSet.getInt("restaurantId"),
                    resultSet.getString("restaurantName"),
                    resultSet.getString("deliveryTime"),
                    resultSet.getString("cuisineType"),
                    resultSet.getString("address"),
                    resultSet.getDouble("rating"),
                    resultSet.getBoolean("isActive"),
                   
                    resultSet.getString("imagePath")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
