package com.food.DAO;

import java.util.ArrayList;
import com.food.model.Menu;

public interface MenuDAO {
    int addMenu(Menu menu);
    ArrayList<Menu> getAllMenus();
    Menu getMenu(int menuId);
    ArrayList<Menu> getMenusByRestaurant(int restaurantId);
    int updateMenu(Menu menu);
    int deleteMenu(int menuId);
	String getRestaurantNameById(int restaurantId);
    

}
