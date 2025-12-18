package com.food.DAO;

import java.util.List;

import com.food.model.Restaurant;

public interface RestaurantDAO {
    int addRestaurant(Restaurant r);
    List<Restaurant> getAllRestaurants();
    Restaurant getRestaurant(int restaurantId);
    int updateRestaurant(Restaurant r);
    int deleteRestaurant(int restaurantId);
}
