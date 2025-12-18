package com.food.DAO;

import java.util.ArrayList;

import com.food.model.User;

public interface UserDAO {
 int addUser(User u);
 ArrayList<User> getAllUser();
 User getUser(String email);
 int updateUser(User u);
 int deleteUser(String email ); 
}
