package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.food.DAO.MenuDAO;
import com.food.DBUtils.DBUtils;
import com.food.model.Menu;

public class MenuDAOImpl implements MenuDAO {

    private Connection con;
    private PreparedStatement pstmt;
    private Statement stmt;
    private ResultSet resultSet;
    private int status = 0;

    ArrayList<Menu> menuList = new ArrayList<>();
    Menu menu;

    private static final String ADD_MENU =
        "INSERT INTO `menu`(`restaurantId`, `menuName`, `price`, `description`, `isAvailable`, `imgPath`) VALUES (?, ?, ?, ?, ?, ?)";

    private static final String SELECT_ALL =
        "SELECT * FROM `menu`";

    private static final String SELECT_BY_ID =
        "SELECT * FROM `menu` WHERE `menuId`=?";

    private static final String SELECT_BY_RESTAURANT =
        "SELECT * FROM `menu` WHERE `restaurantId`=?";

    private static final String UPDATE_MENU =
        "UPDATE `menu` SET `restaurantId`=?, `menuName`=?, `price`=?, `description`=?, `isAvailable`=?, `imgPath`=? WHERE `menuId`=?";

    private static final String DELETE_MENU =
        "DELETE FROM `menu` WHERE `menuId`=?";

    public MenuDAOImpl() {
        try {
            con = DBUtils.myConnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int addMenu(Menu menu) {
        try {
            pstmt = con.prepareStatement(ADD_MENU);
            pstmt.setInt(1, menu.getRestaurantId());
            pstmt.setString(2, menu.getName());
            pstmt.setDouble(3, menu.getPrice());
            pstmt.setString(4, menu.getDescription());
            pstmt.setBoolean(5, menu.getIsAvailable());
            pstmt.setString(6, menu.getImgPath());
            status = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public ArrayList<Menu> getAllMenus() {
        try {
            stmt = con.createStatement();
            resultSet = stmt.executeQuery(SELECT_ALL);
            menuList = extractMenuFromResultSet(resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menuList;
    }

    @Override
    public Menu getMenu(int menuId) {
        try {
            pstmt = con.prepareStatement(SELECT_BY_ID);
            pstmt.setInt(1, menuId);
            resultSet = pstmt.executeQuery();
            menuList = extractMenuFromResultSet(resultSet);
            if (!menuList.isEmpty()) {
                menu = menuList.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return menu;
    }

    @Override
    public ArrayList<Menu> getMenusByRestaurant(int restaurantId) {
        try {
            pstmt = con.prepareStatement(SELECT_BY_RESTAURANT);
            pstmt.setInt(1, restaurantId);
            resultSet = pstmt.executeQuery();
            menuList = extractMenuFromResultSet(resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menuList;
    }

    @Override
    public int updateMenu(Menu menu) {
        try {
            pstmt = con.prepareStatement(UPDATE_MENU);
            pstmt.setInt(1, menu.getRestaurantId());
            pstmt.setString(2, menu.getName());
            pstmt.setDouble(3, menu.getPrice());
            pstmt.setString(4, menu.getDescription());
            pstmt.setBoolean(5, menu.getIsAvailable());
            pstmt.setString(6, menu.getImgPath());
            pstmt.setInt(7, menu.getMenuId());
            status = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public int deleteMenu(int menuId) {
        try {
            pstmt = con.prepareStatement(DELETE_MENU);
            pstmt.setInt(1, menuId);
            status = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    private ArrayList<Menu> extractMenuFromResultSet(ResultSet resultSet) {
        ArrayList<Menu> list = new ArrayList<>();
        try {
            while (resultSet.next()) {
                list.add(new Menu(
                    resultSet.getInt("menuId"),
                    resultSet.getInt("restaurantId"),
                    resultSet.getString("menuName"),
                    resultSet.getDouble("price"),
                    resultSet.getString("description"),
                    resultSet.getBoolean("isAvailable"),
                    resultSet.getString("imgPath")
                  ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
   
    @Override
    public String getRestaurantNameById(int restaurantId) {
        String name = null;
        try {
            
            String sql = "SELECT restaurantName FROM restaurant WHERE restaurantId = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                name = rs.getString("restaurantName");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }


}
