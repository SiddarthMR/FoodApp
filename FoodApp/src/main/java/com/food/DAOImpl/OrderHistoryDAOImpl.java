package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.OrderHistoryDAO;
import com.food.DBUtils.DBUtils;
import com.food.model.OrderHistory;


public class OrderHistoryDAOImpl implements OrderHistoryDAO {

	@Override
	public List<OrderHistory> getOrderHistoryByUser(int userId) {
	    
	    List<OrderHistory> list = new ArrayList<>();

	    String sql = "SELECT orderId, restaurantName, menuName, orderDate, " +
	                 "totalAmount, status, paymentMode " +
	                 "FROM orderhistory " +
	                 "WHERE userId = ? " +
	                 "ORDER BY orderDate DESC";

	    try (Connection con = DBUtils.myConnect();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            OrderHistory oh = new OrderHistory(
	                rs.getInt("orderId"),
	                rs.getString("restaurantName"),
	                rs.getString("menuName"),
	                rs.getTimestamp("orderDate"),
	                rs.getDouble("totalAmount"),
	                rs.getString("status"),
	                rs.getString("paymentMode")
	            );
	            list.add(oh);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
    @Override
    public int addOrderHistory(OrderHistory oh) {
        int result = 0;

        try (Connection con = DBUtils.myConnect()){
        	String sql = "INSERT INTO orderhistory(orderId, userId, restaurantId, menuId, restaurantName, menuName, orderDate, totalAmount, status, paymentMode) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, oh.getOrderId());
            ps.setInt(2, oh.getUserId());
            ps.setInt(3, oh.getRestaurantId());
            ps.setInt(4, oh.getMenuId());
            ps.setString(5, oh.getRestaurantName());
            ps.setString(6, oh.getMenuName());
            ps.setTimestamp(7, new java.sql.Timestamp(oh.getOrderDate().getTime()));
            ps.setDouble(8, oh.getTotalAmount());
            ps.setString(9, oh.getStatus());
            ps.setString(10, oh.getPaymentMode());
            result = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

}
