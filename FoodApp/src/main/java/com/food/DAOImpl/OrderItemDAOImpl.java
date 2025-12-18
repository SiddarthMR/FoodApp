package com.food.DAOImpl;

import com.food.DAO.OrderItemDAO;
import com.food.DBUtils.DBUtils;
import com.food.model.orderItem;

import java.sql.*;
import java.util.ArrayList;

public class OrderItemDAOImpl implements OrderItemDAO {

    private static final String INSERT =
            "INSERT INTO orderitem(orderId, menuId, restaurantId, menuName, restaurantName, quantity, subTotal) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?)";

    private static final String SELECT_BY_ORDERID =
            "SELECT * FROM orderitem WHERE orderId=?";

    private static final String SELECT_ONE =
            "SELECT * FROM orderitem WHERE orderItemId=?";

    private static final String DELETE =
            "DELETE FROM orderitem WHERE orderItemId=?";

    @Override
    public int addOrderItem(orderItem oi) {
        int result = 0;
        try (Connection con = DBUtils.myConnect();
             PreparedStatement ps = con.prepareStatement(INSERT)) {

            ps.setInt(1, oi.getOrderId());
            ps.setInt(2, oi.getMenuId());
            ps.setInt(3, oi.getRestaurantId());
            ps.setString(4, oi.getMenuName());
            ps.setString(5, oi.getRestaurantName());
            ps.setInt(6, oi.getQuantity());
            ps.setDouble(7, oi.getSubTotal());

            result = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public ArrayList<orderItem> getOrderItemsByOrderId(int orderId) {
        ArrayList<orderItem> list = new ArrayList<>();
        try (Connection con = DBUtils.myConnect();
             PreparedStatement ps = con.prepareStatement(SELECT_BY_ORDERID)) {

            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new orderItem(
                        rs.getInt("orderId"),
                        rs.getInt("menuId"),
                        rs.getInt("restaurantId"),
                        rs.getString("menuName"),
                        rs.getString("restaurantName"),
                        rs.getInt("quantity"),
                        rs.getDouble("subTotal")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public orderItem getOrderItem(int id) {
        orderItem oi = null;
        try (Connection con = DBUtils.myConnect();
             PreparedStatement ps = con.prepareStatement(SELECT_ONE)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                oi = new orderItem(
                        rs.getInt("orderId"),
                        rs.getInt("menuId"),
                        rs.getInt("restaurantId"),
                        rs.getString("menuName"),
                        rs.getString("restaurantName"),
                        rs.getInt("quantity"),
                        rs.getDouble("subTotal")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return oi;
    }

    @Override
    public int deleteOrderItem(int id) {
        int result = 0;
        try (Connection con = DBUtils.myConnect();
             PreparedStatement ps = con.prepareStatement(DELETE)) {

            ps.setInt(1, id);
            result = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
