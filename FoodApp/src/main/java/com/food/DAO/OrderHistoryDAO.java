package com.food.DAO;

import java.util.List;
import com.food.model.OrderHistory;

public interface OrderHistoryDAO {
    List<OrderHistory> getOrderHistoryByUser(int userId);

	int addOrderHistory(OrderHistory oh);
}
