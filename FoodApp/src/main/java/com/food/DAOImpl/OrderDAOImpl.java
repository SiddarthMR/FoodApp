package com.food.DAOImpl;

import java.sql.*;
import java.util.ArrayList;

import com.food.DAO.OrderDAO;
import com.food.DBUtils.DBUtils;
import com.food.model.orderTable;

public class OrderDAOImpl implements OrderDAO {

    private static final String ADD_ORDER =
        "INSERT INTO `ordertable`(`restaurantId`, `userId`, `orderDate`, `totalAmount`, `status`, `paymentMode`) VALUES (?, ?, ?, ?, ?, ?)";

    private static final String SELECT_ALL =
        "SELECT * FROM `ordertable`";

    private static final String SELECT_BY_ID =
        "SELECT * FROM `ordertable` WHERE `orderId`=?";

    private static final String UPDATE_BY_ID =
        "UPDATE `ordertable` SET `restaurantId`=?, `userId`=?, `orderDate`=?, `totalAmount`=?, `status`=?, `paymentMode`=? WHERE `orderId`=?";

    private static final String DELETE_BY_ID =
        "DELETE FROM `ordertable` WHERE `orderId`=?";

    private static final String SELECT_ORDER_WITH_NAMES =
    	    "SELECT o.orderId, o.orderDate, o.totalAmount, o.status, o.paymentMode, " +
    	    "r.restaurantName, u.username, m.menuName " +
    	    "FROM ordertable o " +
    	    "JOIN restaurant r ON o.restaurantId = r.restaurantId " +
    	    "JOIN user u ON o.userId = u.userId " +
    	    "JOIN orderitem oi ON o.orderId = oi.orderId " +
    	    "JOIN menu m ON oi.menuId = m.menuId " +
    	    "WHERE o.orderId = ?";
    

    private Connection con;

    public OrderDAOImpl() {
        try {
            con = DBUtils.myConnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /** Insert order without returning ID */
    @Override
    public int addOrder(orderTable o) {
        try (PreparedStatement pstmt = con.prepareStatement(ADD_ORDER)) {
            pstmt.setInt(1, o.getRestaurantId());
            pstmt.setInt(2, o.getUserId());
            pstmt.setTimestamp(3, new Timestamp(o.getOrderDate().getTime()));
            pstmt.setDouble(4, o.getTotalAmount());
            pstmt.setString(5, o.getStatus());
            pstmt.setString(6, o.getPaymentMode());

            return pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /** Insert order and return generated orderId */
    @Override
    public int addOrderAndReturnId(orderTable o) {
        int generatedId = -1;

        try (PreparedStatement pstmt = con.prepareStatement(ADD_ORDER, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1, o.getRestaurantId());
            pstmt.setInt(2, o.getUserId());
            pstmt.setTimestamp(3, new Timestamp(o.getOrderDate().getTime()));
            pstmt.setDouble(4, o.getTotalAmount());
            pstmt.setString(5, o.getStatus());
            pstmt.setString(6, o.getPaymentMode());

            pstmt.executeUpdate();

            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) {
                    generatedId = rs.getInt(1);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return generatedId;
    }

    @Override
    public ArrayList<orderTable> getAllOrders() {
        ArrayList<orderTable> list = new ArrayList<>();

        try (Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(SELECT_ALL)) {

            list = extractOrderFromResultSet(rs);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public orderTable getOrder(int orderId) {
        orderTable order = null;

        try (PreparedStatement pstmt = con.prepareStatement(SELECT_BY_ID)) {

            pstmt.setInt(1, orderId);
            ResultSet rs = pstmt.executeQuery();

            ArrayList<orderTable> list = extractOrderFromResultSet(rs);
            if (!list.isEmpty()) {
                order = list.get(0);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    @Override
    public int updateOrder(orderTable o) {
        try (PreparedStatement pstmt = con.prepareStatement(UPDATE_BY_ID)) {

            pstmt.setInt(1, o.getRestaurantId());
            pstmt.setInt(2, o.getUserId());
            pstmt.setTimestamp(3, new Timestamp(o.getOrderDate().getTime()));
            pstmt.setDouble(4, o.getTotalAmount());
            pstmt.setString(5, o.getStatus());
            pstmt.setString(6, o.getPaymentMode());
            pstmt.setInt(7, o.getOrderId());

            return pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int deleteOrder(int orderId) {
        try (PreparedStatement pstmt = con.prepareStatement(DELETE_BY_ID)) {

            pstmt.setInt(1, orderId);
            return pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private ArrayList<orderTable> extractOrderFromResultSet(ResultSet rs) {
        ArrayList<orderTable> list = new ArrayList<>();

        try {
            while (rs.next()) {
                orderTable o = new orderTable(
                    rs.getInt("orderId"),
                    rs.getInt("restaurantId"),
                    rs.getInt("userId"),
                    rs.getTimestamp("orderDate"),
                    rs.getDouble("totalAmount"),
                    rs.getString("status"),
                    rs.getString("paymentMode")
                );
                list.add(o);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    @Override
    public orderTable getOrderWithNames(int orderId) {

        orderTable order = null;

        try (PreparedStatement pstmt = con.prepareStatement(SELECT_ORDER_WITH_NAMES)) {

            pstmt.setInt(1, orderId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                order = new orderTable();
                order.setOrderId(rs.getInt("orderId"));
                order.setOrderDate(rs.getTimestamp("orderDate"));
                order.setTotalAmount(rs.getDouble("totalAmount"));
                order.setStatus(rs.getString("status"));
                order.setPaymentMode(rs.getString("paymentMode"));

                // Names
                order.setRestaurantName(rs.getString("restaurantName"));
                order.setUserName(rs.getString("username"));
                order.setMenuName(rs.getString("menuName"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return order;
    }

}
